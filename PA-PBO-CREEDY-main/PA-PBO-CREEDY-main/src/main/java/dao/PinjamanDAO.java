package com.mycompany.caps_creedy.dao;

import com.mycompany.caps_creedy.database.Koneksi;
import java.sql.*;
import java.math.BigDecimal;
import java.util.*;

public class PinjamanDAO {
    public List<Object[]> daftar(String userId) throws SQLException {
        try(Connection c=Koneksi.getConnection()) {
            NasabahDAO.aktif(c,userId);
            try(PreparedStatement p=c.prepareStatement("SELECT pinjaman_id,tanggal_pengajuan,tenor_bulan,jumlah_pinjaman,status,catatan_keputusan,nomor_rekening_pencairan FROM pinjaman WHERE nasabah_user_id=? ORDER BY tanggal_pengajuan DESC,pinjaman_id")) {
                p.setString(1,userId);try(ResultSet r=p.executeQuery()) {
                    List<Object[]> rows=new ArrayList<>();while(r.next()) rows.add(new Object[]{r.getString(1),r.getDate(2),r.getInt(3),r.getBigDecimal(4),r.getString(5),r.getString(6),r.getString(7)});return rows;
                }
            }
        }
    }
    public List<String> pilihan(String userId) throws SQLException {
        return daftar(userId).stream().filter(r -> Set.of("Aktif","Lunas","Disetujui").contains(r[4])).map(r -> (String)r[0]).toList();
    }
    public record Jadwal(List<Object[]> rows, BigDecimal angsuran, BigDecimal sisa, BigDecimal denda) {}
    public Jadwal jadwal(String userId,String pinjaman) throws SQLException {
        try(Connection c=Koneksi.getConnection()) {
            NasabahDAO.aktif(c,userId);
            try(PreparedStatement p=c.prepareStatement("SELECT j.angsuran_id,j.tanggal_jatuh_tempo,j.pokok_angsuran+j.bunga_angsuran,j.denda,j.status_pembayaran FROM jadwal_angsuran j JOIN pinjaman p ON p.pinjaman_id=j.pinjaman_id WHERE p.nasabah_user_id=? AND p.pinjaman_id=? ORDER BY j.tanggal_jatuh_tempo,j.angsuran_id")) {
                p.setString(1,userId);p.setString(2,pinjaman);
                try(ResultSet r=p.executeQuery()) {
                    List<Object[]> rows=new ArrayList<>();BigDecimal total=BigDecimal.ZERO,denda=BigDecimal.ZERO,bulanan=BigDecimal.ZERO;
                    while(r.next()) {
                        BigDecimal tagihan=r.getBigDecimal(3),fine=r.getBigDecimal(4);
                        rows.add(new Object[]{r.getString(1),r.getDate(2),tagihan,fine,r.getString(5)});
                        if(!"Lunas".equals(r.getString(5))) {total=total.add(tagihan).add(fine);denda=denda.add(fine);if(bulanan.signum()==0)bulanan=tagihan;}
                    }
                    return new Jadwal(rows,bulanan,total,denda);
                }
            }
        }
    }
    public String ajukan(String userId,String rekening,String nominal,String tenor,String tujuan) throws SQLException {
        BigDecimal jumlah=TransaksiDAO.nominal(nominal);
        if(tenor==null || !tenor.trim().matches("[0-9]{1,3}"))throw new IllegalArgumentException("Jangka waktu harus berupa bilangan bulat 1–360 bulan.");
        int bulan=Integer.parseInt(tenor.trim());
        if(bulan<1 || bulan>360)throw new IllegalArgumentException("Jangka waktu harus 1–360 bulan.");
        if(tujuan==null || tujuan.isBlank() || tujuan.trim().length()>200)throw new IllegalArgumentException("Tujuan pinjaman wajib diisi, maksimal 200 karakter.");
        try(Connection c=Koneksi.getConnection()) {
            c.setAutoCommit(false);
            try {
                NasabahDAO.aktif(c,userId);
                // Rekening dikunci agar tidak dapat ditutup selama pengajuan disimpan.
                TransaksiDAO.rekening(c,userId,rekening);
                String id=TransaksiDAO.id("P");
                try(PreparedStatement p=c.prepareStatement("INSERT INTO pinjaman (pinjaman_id,jumlah_pinjaman,tenor_bulan,suku_bunga,tujuan_pinjaman,skor_kelayakan,tanggal_pengajuan,nasabah_user_id,nomor_rekening_pencairan) VALUES (?,?,?,12.00,?,0,CURDATE(),?,?)")) {
                    p.setString(1,id);p.setBigDecimal(2,jumlah);p.setInt(3,bulan);p.setString(4,tujuan.trim());p.setString(5,userId);p.setString(6,rekening);p.executeUpdate();
                }
                c.commit();return id;
            }catch(SQLException|RuntimeException e){c.rollback();throw e;}
        }
    }

    public static BigDecimal skor(String input) {
        if(input==null || !input.trim().matches("[0-9]{1,3}([.,][0-9]{1,2})?"))throw new IllegalArgumentException("Skor harus berupa angka 0–100, maksimal dua angka desimal.");
        BigDecimal nilai=new BigDecimal(input.trim().replace(',','.')).setScale(2);
        if(nilai.compareTo(new BigDecimal("100"))>0)throw new IllegalArgumentException("Skor harus berada pada rentang 0–100.");
        return nilai;
    }
    private static BigDecimal batas(PegawaiDAO.Profil profil) {
        return switch(profil.batas()) {
            case "100 Juta" -> new BigDecimal("100000000");
            case "500 Juta" -> new BigDecimal("500000000");
            case "Rp0" -> BigDecimal.ZERO;
            default -> throw new IllegalStateException("Batas persetujuan petugas belum dikenali. Hubungi admin.");
        };
    }
    private record Kredit(String nasabah,String rekening,BigDecimal jumlah,int bulan,BigDecimal bunga,BigDecimal skor,String status) {}
    private static Kredit kunci(Connection c,String id,String status,BigDecimal expectedScore) throws SQLException {
        if(id==null || !id.matches("[A-Za-z0-9-]{1,10}"))throw new IllegalArgumentException("Pilih pinjaman yang valid.");
        try(PreparedStatement p=c.prepareStatement("SELECT nasabah_user_id,nomor_rekening_pencairan,jumlah_pinjaman,tenor_bulan,suku_bunga,skor_kelayakan,status FROM pinjaman WHERE pinjaman_id=? FOR UPDATE")) {
            p.setString(1,id);try(ResultSet r=p.executeQuery()) {
                if(!r.next())throw new IllegalStateException("Pinjaman tidak ditemukan. Muat ulang daftar.");
                Kredit k=new Kredit(r.getString(1),r.getString(2),r.getBigDecimal(3),r.getInt(4),r.getBigDecimal(5),r.getBigDecimal(6),r.getString(7));
                if(!status.equals(k.status()))throw new IllegalStateException("Status pinjaman sudah berubah. Muat ulang daftar sebelum melanjutkan.");
                if(expectedScore!=null && k.skor().compareTo(expectedScore)!=0)throw new IllegalStateException("Skor telah diubah petugas lain. Muat ulang daftar.");
                return k;
            }
        }
    }
    public String ajukanPetugas(String petugas,String nasabah,String rekening,String nominal,String tenor,String tujuan) throws SQLException {
        BigDecimal jumlah=TransaksiDAO.nominal(nominal);
        if(tenor==null || !tenor.matches("[0-9]{1,3}"))throw new IllegalArgumentException("Jangka waktu harus 1–360 bulan.");
        int bulan=Integer.parseInt(tenor);
        if(bulan<1 || bulan>360)throw new IllegalArgumentException("Jangka waktu harus 1–360 bulan.");
        if(tujuan==null || tujuan.isBlank() || tujuan.trim().length()>200)throw new IllegalArgumentException("Tujuan wajib diisi, maksimal 200 karakter.");
        try(Connection c=Koneksi.getConnection()) {
            c.setAutoCommit(false);
            try {
                PegawaiDAO.petugas(c,petugas);NasabahDAO.aktif(c,nasabah);TransaksiDAO.rekening(c,nasabah,rekening);
                String id=TransaksiDAO.id("P");
                try(PreparedStatement p=c.prepareStatement("INSERT INTO pinjaman (pinjaman_id,jumlah_pinjaman,tenor_bulan,suku_bunga,tujuan_pinjaman,skor_kelayakan,tanggal_pengajuan,nasabah_user_id,pegawai_user_id,nomor_rekening_pencairan) VALUES (?,?,?,12.00,?,0,CURDATE(),?,?,?)")) {
                    p.setString(1,id);p.setBigDecimal(2,jumlah);p.setInt(3,bulan);p.setString(4,tujuan.trim());p.setString(5,nasabah);p.setString(6,petugas);p.setString(7,rekening);p.executeUpdate();
                }
                c.commit();return id;
            }catch(SQLException|RuntimeException e){c.rollback();throw e;}
        }
    }
    // Skor dan keputusan memakai snapshot agar perubahan petugas lain tidak tertimpa.
    public void simpanSkor(String petugas,String id,String nilai,BigDecimal expectedScore) throws SQLException {
        BigDecimal score=skor(nilai);
        if(expectedScore==null)throw new IllegalArgumentException("Pilih ulang pengajuan sebelum menyimpan skor.");
        try(Connection c=Koneksi.getConnection()) {
            c.setAutoCommit(false);
            try {
                PegawaiDAO.petugas(c,petugas);kunci(c,id,"Diajukan",expectedScore);
                try(PreparedStatement p=c.prepareStatement("UPDATE pinjaman SET skor_kelayakan=?,pegawai_user_id=? WHERE pinjaman_id=?")) {
                    p.setBigDecimal(1,score);p.setString(2,petugas);p.setString(3,id);p.executeUpdate();
                }
                c.commit();
            }catch(SQLException|RuntimeException e){c.rollback();throw e;}
        }
    }
    public void putuskan(String petugas,String id,String keputusan,String nilai,String catatan,BigDecimal expectedScore) throws SQLException {
        if(!Set.of("Disetujui","Ditolak").contains(Objects.toString(keputusan,"")))throw new IllegalArgumentException("Keputusan hanya Disetujui atau Ditolak.");
        BigDecimal score=skor(nilai);
        if(catatan==null || catatan.isBlank() || catatan.trim().length()>200)throw new IllegalArgumentException("Isi alasan keputusan, maksimal 200 karakter.");
        if(expectedScore==null)throw new IllegalArgumentException("Pilih ulang pengajuan sebelum menetapkan keputusan.");
        try(Connection c=Koneksi.getConnection()) {
            c.setAutoCommit(false);
            try {
                PegawaiDAO.Profil profil=PegawaiDAO.petugas(c,petugas);
                Kredit k=kunci(c,id,"Diajukan",expectedScore);
                if("Disetujui".equals(keputusan)) {
                    if(k.jumlah().signum()<=0 || k.jumlah().compareTo(batas(profil))>0)throw new IllegalArgumentException("Nominal melampaui batas persetujuan Anda: "+profil.batas()+".");
                    NasabahDAO.aktif(c,k.nasabah());TransaksiDAO.rekening(c,k.nasabah(),k.rekening());
                }
                try(PreparedStatement p=c.prepareStatement("UPDATE pinjaman SET status=?,skor_kelayakan=?,catatan_keputusan=?,tanggal_keputusan=CURDATE(),pegawai_user_id=? WHERE pinjaman_id=?")) {
                    p.setString(1,keputusan);p.setBigDecimal(2,score);p.setString(3,catatan.trim());p.setString(4,petugas);p.setString(5,id);p.executeUpdate();
                }
                c.commit();
            }catch(SQLException|RuntimeException e){c.rollback();throw e;}
        }
    }
    public record Pencairan(String pinjaman,String rekening,BigDecimal jumlah,int bulan,BigDecimal bungaTotal,BigDecimal saldo) {}
    public Pencairan cairkan(String petugas,String id,BigDecimal expectedJumlah,String expectedRekening) throws SQLException {
        try(Connection c=Koneksi.getConnection()) {
            c.setAutoCommit(false);
            try {
                PegawaiDAO.Profil profil=PegawaiDAO.petugas(c,petugas);
                Kredit k=kunci(c,id,"Disetujui",null);
                if(expectedJumlah==null || k.jumlah().compareTo(expectedJumlah)!=0 || !Objects.equals(k.rekening(),expectedRekening))throw new IllegalStateException("Data pencairan berubah. Muat ulang dan konfirmasi kembali.");
                if(k.jumlah().signum()<=0 || k.jumlah().compareTo(batas(profil))>0)throw new IllegalArgumentException("Nominal melampaui batas kewenangan Anda: "+profil.batas()+".");
                if(k.bulan()<1 || k.bulan()>360 || k.bunga().signum()<0)throw new IllegalStateException("Tenor atau bunga pinjaman tidak valid. Hubungi admin.");
                NasabahDAO.aktif(c,k.nasabah());
                BigDecimal saldo=TransaksiDAO.rekening(c,k.nasabah(),k.rekening()).add(k.jumlah());
                try(PreparedStatement p=c.prepareStatement("SELECT (SELECT COUNT(*) FROM jadwal_angsuran WHERE pinjaman_id=?)+(SELECT COUNT(*) FROM transaksi WHERE pinjaman_id=? AND jenis_transaksi='Pencairan Pinjaman')")) {
                    p.setString(1,id);p.setString(2,id);try(ResultSet r=p.executeQuery()){r.next();if(r.getLong(1)>0)throw new IllegalStateException("Pinjaman sudah memiliki jadwal atau pencairan. Hubungi admin untuk memeriksa data.");}
                }
                java.time.LocalDate tanggal;
                try(Statement st=c.createStatement();ResultSet r=st.executeQuery("SELECT CURDATE()")){r.next();tanggal=r.getDate(1).toLocalDate();}
                BigDecimal bungaTotal=k.jumlah().multiply(k.bunga()).multiply(BigDecimal.valueOf(k.bulan())).divide(new BigDecimal("1200"),2,java.math.RoundingMode.HALF_UP);
                BigDecimal pokokBulan=k.jumlah().divide(BigDecimal.valueOf(k.bulan()),2,java.math.RoundingMode.DOWN);
                BigDecimal bungaBulan=bungaTotal.divide(BigDecimal.valueOf(k.bulan()),2,java.math.RoundingMode.DOWN);
                if(pokokBulan.add(bungaBulan).signum()<=0)throw new IllegalArgumentException("Nominal terlalu kecil untuk membentuk angsuran bulanan pada tenor ini.");
                // Sisa pembulatan masuk ke angsuran terakhir; total pokok dan bunga tetap tepat.
                try(PreparedStatement p=c.prepareStatement("INSERT INTO jadwal_angsuran (angsuran_id,sisa_angsuran,tanggal_jatuh_tempo,pokok_angsuran,bunga_angsuran,pinjaman_id) VALUES (?,?,?,?,?,?)")) {
                    for(int i=1;i<=k.bulan();i++) {
                        p.setString(1,TransaksiDAO.id("A"));p.setInt(2,k.bulan()-i+1);p.setDate(3,java.sql.Date.valueOf(tanggal.plusMonths(i)));
                        p.setBigDecimal(4,i==k.bulan()?k.jumlah().subtract(pokokBulan.multiply(BigDecimal.valueOf(i-1))):pokokBulan);
                        p.setBigDecimal(5,i==k.bulan()?bungaTotal.subtract(bungaBulan.multiply(BigDecimal.valueOf(i-1))):bungaBulan);p.setString(6,id);p.addBatch();
                    }
                    p.executeBatch();
                }
                TransaksiDAO.saldo(c,k.rekening(),saldo);
                try(PreparedStatement p=c.prepareStatement("INSERT INTO transaksi (transaksi_id,jenis_transaksi,jumlah,saldo_setelah,channel,waktu_transaksi,keterangan,nomor_rekening,pegawai_user_id,pinjaman_id) VALUES (?,'Pencairan Pinjaman',?,?,'Teller',NOW(),?,?,?,?)")) {
                    p.setString(1,TransaksiDAO.id("T"));p.setBigDecimal(2,k.jumlah());p.setBigDecimal(3,saldo);p.setString(4,"Pencairan pinjaman "+id);p.setString(5,k.rekening());p.setString(6,petugas);p.setString(7,id);p.executeUpdate();
                }
                try(PreparedStatement p=c.prepareStatement("UPDATE pinjaman SET status='Aktif',tanggal_cair=?,pegawai_user_id=? WHERE pinjaman_id=?")) {
                    p.setDate(1,java.sql.Date.valueOf(tanggal));p.setString(2,petugas);p.setString(3,id);p.executeUpdate();
                }
                c.commit();return new Pencairan(id,k.rekening(),k.jumlah(),k.bulan(),bungaTotal,saldo);
            }catch(SQLException|RuntimeException e){c.rollback();throw e;}
        }
    }
}
