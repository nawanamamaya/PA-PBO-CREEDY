package com.mycompany.caps_creedy.dao;

import com.mycompany.caps_creedy.database.Koneksi;
import java.sql.*;
import java.math.*;
import java.util.UUID;

public class TransaksiDAO {
    private static final BigDecimal MAX=new BigDecimal("9999999999999.99");
    public static BigDecimal nominal(String text) {
        if(text==null || !text.trim().matches("[0-9]{1,13}([.,][0-9]{1,2})?"))throw new IllegalArgumentException("Nominal harus berupa angka positif tanpa pemisah ribuan, misalnya 100000 atau 100000,50.");
        BigDecimal n=new BigDecimal(text.trim().replace(',','.')).setScale(2);
        if(n.signum()<=0 || n.compareTo(MAX)>0)throw new IllegalArgumentException("Nominal harus lebih dari nol dan sesuai batas nilai rekening.");
        return n;
    }
    static String id(String prefix){return prefix+UUID.randomUUID().toString().replace("-","").substring(0,9);}
    static BigDecimal rekening(Connection c,String userId,String nomor)throws SQLException {
        if(nomor==null || !nomor.matches("[A-Za-z0-9-]{1,20}"))throw new IllegalArgumentException("Nomor rekening tidak valid.");
        try(PreparedStatement p=c.prepareStatement("SELECT saldo FROM rekening WHERE nomor_rekening=? AND status_rekening='Aktif'"+(userId==null?"":" AND nasabah_user_id=?")+" FOR UPDATE")) {
            p.setString(1,nomor);if(userId!=null)p.setString(2,userId);
            try(ResultSet r=p.executeQuery()){if(!r.next())throw new IllegalArgumentException("Rekening tidak aktif, tidak ditemukan, atau bukan milik Anda.");return r.getBigDecimal(1);}
        }
    }
    static void saldo(Connection c,String nomor,BigDecimal nilai)throws SQLException {
        if(nilai.signum()<0)throw new IllegalArgumentException("Saldo tidak mencukupi.");
        if(nilai.compareTo(MAX)>0)throw new IllegalArgumentException("Saldo tujuan akan melebihi batas nilai rekening.");
        try(PreparedStatement p=c.prepareStatement("UPDATE rekening SET saldo=? WHERE nomor_rekening=?")){p.setBigDecimal(1,nilai);p.setString(2,nomor);if(p.executeUpdate()!=1)throw new SQLException("Rekening berubah saat transaksi");}
    }
    private static void catat(Connection c,String nomor,String jenis,BigDecimal jumlah,BigDecimal saldo,String pinjaman,String angsuran,String catatan)throws SQLException {
        try(PreparedStatement p=c.prepareStatement("INSERT INTO transaksi (transaksi_id,jenis_transaksi,jumlah,saldo_setelah,channel,waktu_transaksi,keterangan,nomor_rekening,pinjaman_id,angsuran_id) VALUES (?,?,?,?,'Mobile Banking',NOW(),?,?,?,?)")) {
            p.setString(1,id("T"));p.setString(2,jenis);p.setBigDecimal(3,jumlah);p.setBigDecimal(4,saldo);p.setString(5,catatan);p.setString(6,nomor);p.setString(7,pinjaman);p.setString(8,angsuran);p.executeUpdate();
        }
    }
    public void transfer(String userId,String sumber,String tujuan,String nominal,String catatan)throws SQLException {
        BigDecimal jumlah=nominal(nominal);
        if(sumber==null || sumber.equals(tujuan))throw new IllegalArgumentException("Rekening sumber dan tujuan harus berbeda.");
        if(tujuan==null || !tujuan.matches("[A-Za-z0-9-]{1,20}"))throw new IllegalArgumentException("Nomor rekening tujuan tidak valid.");
        if(catatan==null || catatan.length()>150)throw new IllegalArgumentException("Catatan maksimal 150 karakter.");
        try(Connection c=Koneksi.getConnection()){
            c.setAutoCommit(false);
            try {
                NasabahDAO.aktif(c,userId);
                // Urutan kunci konsisten untuk dua transfer yang saling berlawanan.
                BigDecimal awal,akhir;
                if(sumber.compareTo(tujuan)<0){awal=rekening(c,userId,sumber);akhir=rekening(c,null,tujuan);}
                else{akhir=rekening(c,null,tujuan);awal=rekening(c,userId,sumber);}
                BigDecimal debit=awal.subtract(jumlah),kredit=akhir.add(jumlah);
                saldo(c,sumber,debit);saldo(c,tujuan,kredit);
                catat(c,sumber,"Transfer",jumlah,debit,null,null,"Ke "+tujuan+": "+catatan);
                catat(c,tujuan,"Transfer",jumlah,kredit,null,null,"Dari "+sumber+": "+catatan);
                c.commit();
            }catch(SQLException|RuntimeException e){c.rollback();throw e;}
        }
    }
    public record Tagihan(String id,java.sql.Date jatuhTempo,BigDecimal jumlah,BigDecimal denda) {
        public String rincian(){return "ID Angsuran: "+id+"\nJatuh tempo: "+jatuhTempo+"\nPokok + bunga: Rp "+jumlah.subtract(denda)+"\nDenda tercatat: Rp "+denda+"\nTotal dibayar: Rp "+jumlah;}
    }
    private static Tagihan tagihan(Connection c,String userId,String pinjaman,boolean lock)throws SQLException {
        try(PreparedStatement p=c.prepareStatement("SELECT j.angsuran_id,j.tanggal_jatuh_tempo,j.pokok_angsuran+j.bunga_angsuran+j.denda,j.denda FROM jadwal_angsuran j JOIN pinjaman p ON p.pinjaman_id=j.pinjaman_id WHERE p.nasabah_user_id=? AND p.pinjaman_id=? AND p.status='Aktif' AND j.status_pembayaran<>'Lunas' ORDER BY j.tanggal_jatuh_tempo,j.angsuran_id LIMIT 1"+(lock?" FOR UPDATE":""))) {
            p.setString(1,userId);p.setString(2,pinjaman);
            try(ResultSet r=p.executeQuery()){if(!r.next())throw new IllegalArgumentException("Tidak ada angsuran belum lunas pada pinjaman aktif ini.");return new Tagihan(r.getString(1),r.getDate(2),r.getBigDecimal(3),r.getBigDecimal(4));}
        }
    }
    public Tagihan tagihan(String userId,String pinjaman)throws SQLException {
        try(Connection c=Koneksi.getConnection()){NasabahDAO.aktif(c,userId);return tagihan(c,userId,pinjaman,false);}
    }
    public void bayar(String userId,String pinjaman,String sumber,String expectedId,BigDecimal expectedTotal)throws SQLException {
        try(Connection c=Koneksi.getConnection()){
            c.setAutoCommit(false);
            try {
                NasabahDAO.aktif(c,userId);
                // Kunci rekening dahulu, lalu jadwal; snapshot tagihan mencegah klik ulang membayar bulan berikutnya.
                BigDecimal awal=rekening(c,userId,sumber);
                Tagihan t=tagihan(c,userId,pinjaman,true);
                if(!t.id().equals(expectedId) || t.jumlah().compareTo(expectedTotal)!=0)throw new IllegalArgumentException("Tagihan berubah atau sudah dibayar. Muat ulang rincian pembayaran.");
                if(t.jumlah().signum()<=0)throw new IllegalStateException("Nilai tagihan tidak valid. Hubungi petugas.");
                BigDecimal akhir=awal.subtract(t.jumlah());saldo(c,sumber,akhir);
                try(PreparedStatement p=c.prepareStatement("UPDATE jadwal_angsuran SET status_pembayaran='Lunas',sisa_angsuran=0 WHERE angsuran_id=? AND status_pembayaran<>'Lunas'")){
                    p.setString(1,t.id());if(p.executeUpdate()!=1)throw new IllegalStateException("Angsuran sudah dibayar. Muat ulang halaman.");
                }
                catat(c,sumber,"Pembayaran Angsuran",t.jumlah(),akhir,pinjaman,t.id(),"Pembayaran angsuran "+t.id());
                try(PreparedStatement p=c.prepareStatement("UPDATE pinjaman SET status='Lunas' WHERE pinjaman_id=? AND NOT EXISTS (SELECT 1 FROM jadwal_angsuran WHERE pinjaman_id=? AND status_pembayaran<>'Lunas')")){
                    p.setString(1,pinjaman);p.setString(2,pinjaman);p.executeUpdate();
                }
                c.commit();
            }catch(SQLException|RuntimeException e){c.rollback();throw e;}
        }
    }
}
