package com.mycompany.caps_creedy.dao;

import com.mycompany.caps_creedy.database.Koneksi;
import com.mycompany.caps_creedy.model.Pegawai;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PegawaiDAO {

    public List<Pegawai> getAllPegawai() throws SQLException {
        List<Pegawai> list = new ArrayList<>();
        String sql = "SELECT * FROM pegawai";
        try (Connection conn = Koneksi.getConnection();
             Statement st = conn.createStatement();
             ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                list.add(new Pegawai(
                    rs.getString("nip"),
                    rs.getString("nama"),
                    rs.getString("jabatan"),
                    rs.getString("status")
                ));
            }
        }
        return list;
    }

    public boolean tambahPegawai(Pegawai p) throws SQLException {
        String sql = "INSERT INTO pegawai (nip, nama, jabatan, status) VALUES (?, ?, ?, ?)";
        try (Connection conn = Koneksi.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getNip());
            ps.setString(2, p.getNama());
            ps.setString(3, p.getJabatan());
            ps.setString(4, p.getStatus());
            return ps.executeUpdate() > 0;
        }
    }

    public boolean ubahStatusPegawai(String nip, String statusBaru) throws SQLException {
        String sql = "UPDATE pegawai SET status = ? WHERE nip = ?";
        try (Connection conn = Koneksi.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, statusBaru);
            ps.setString(2, nip);
            return ps.executeUpdate() > 0;
        }
    }

    public record Profil(String userId,String nip,String jabatan,String cabang,String nama,String batas) {}

    static Profil petugas(Connection c,String userId) throws SQLException {return profil(c,userId,true);}
    private static Profil profil(Connection c,String userId,boolean kredit) throws SQLException {
        try (PreparedStatement p=c.prepareStatement("SELECT u.user_id,p.nip,p.jabatan,c.nama_cabang,u.nama_lengkap,p.batas_persetujuan FROM users u JOIN pegawai p ON p.user_id=u.user_id JOIN cabang c ON c.cabang_id=p.cabang_id WHERE u.user_id=? AND u.user_type='Pegawai' AND u.status='Aktif' "+(kredit?" AND p.jabatan='Petugas Kredit'":"")+" FOR SHARE")) {
            p.setString(1,userId);
            try(ResultSet r=p.executeQuery()) {
                if(!r.next())throw new IllegalStateException("Akun pegawai tidak aktif atau tidak memiliki akses. Silakan login kembali.");
                return new Profil(r.getString(1),r.getString(2),r.getString(3),r.getString(4),r.getString(5),r.getString(6));
            }
        }
    }
    public Profil profilPegawai(String userId) throws SQLException {
        try(Connection c=Koneksi.getConnection()){return profil(c,userId,false);}
    }
    public Profil profilPetugas(String userId) throws SQLException {
        try(Connection c=Koneksi.getConnection()){return petugas(c,userId);}
    }
    public record NasabahPilihan(String userId,String nik,String nama,String alamat,java.math.BigDecimal tagihan) {
        public String toString(){return nik+" — "+nama;}
    }
    public List<NasabahPilihan> nasabah(String petugasId,String pencarian) throws SQLException {
        String cari=filter(pencarian);
        try(Connection c=Koneksi.getConnection()) {
            petugas(c,petugasId);
            String sql="SELECT n.user_id,n.nik,u.nama_lengkap,n.alamat,COALESCE((SELECT SUM(j.pokok_angsuran+j.bunga_angsuran+j.denda) FROM jadwal_angsuran j JOIN pinjaman p ON p.pinjaman_id=j.pinjaman_id WHERE p.nasabah_user_id=n.user_id AND j.status_pembayaran<>'Lunas'),0) FROM nasabah n JOIN users u ON u.user_id=n.user_id WHERE u.status='Aktif' AND u.user_type='Nasabah' AND LOCATE(?,CONCAT(n.nik,' ',u.nama_lengkap))>0 ORDER BY u.nama_lengkap,n.nik";
            try(PreparedStatement p=c.prepareStatement(sql)) {
                p.setString(1,cari);try(ResultSet r=p.executeQuery()) {
                    List<NasabahPilihan> rows=new ArrayList<>();while(r.next())rows.add(new NasabahPilihan(r.getString(1),r.getString(2),r.getString(3),r.getString(4),r.getBigDecimal(5)));return rows;
                }
            }
        }
    }
    public List<String> rekeningNasabah(String petugasId,String nasabahId) throws SQLException {
        try(Connection c=Koneksi.getConnection()){petugas(c,petugasId);}
        return new NasabahDAO().nomorRekening(nasabahId);
    }
    public String detailNasabah(String petugasId,String nasabahId) throws SQLException {
        try(Connection c=Koneksi.getConnection()){petugas(c,petugasId);}
        String[] d=new NasabahDAO().profil(nasabahId);
        return "Nama: "+d[4]+"\nNIK: "+d[2]+"\nTelepon: "+d[0]+"\nAlamat: "+d[5]+"\nTipe: "+d[6]+"\nTanggal daftar: "+d[7]+"\nRekening aktif: "+String.join(", ",new NasabahDAO().nomorRekening(nasabahId));
    }
    public List<Object[]> pengajuan(String petugasId,String status,String pencarian) throws SQLException {
        String cari=filter(pencarian);
        try(Connection c=Koneksi.getConnection()) {
            petugas(c,petugasId);
            try(PreparedStatement p=c.prepareStatement("SELECT p.pinjaman_id,u.nama_lengkap,p.tenor_bulan,p.jumlah_pinjaman,p.status,p.skor_kelayakan,p.nasabah_user_id,p.catatan_keputusan FROM pinjaman p JOIN users u ON u.user_id=p.nasabah_user_id JOIN nasabah n ON n.user_id=p.nasabah_user_id WHERE p.status=? AND LOCATE(?,CONCAT(p.pinjaman_id,' ',n.nik,' ',u.nama_lengkap))>0 ORDER BY p.tanggal_pengajuan,p.pinjaman_id")) {
                p.setString(1,status);p.setString(2,cari);try(ResultSet r=p.executeQuery()) {
                    List<Object[]> rows=new ArrayList<>();while(r.next())rows.add(new Object[]{r.getString(1),r.getString(2),r.getInt(3),r.getBigDecimal(4),r.getString(5),r.getBigDecimal(6),r.getString(7),r.getString(8)});return rows;
                }
            }
        }
    }
    public record Tunggakan(List<Object[]> rows,java.math.BigDecimal tagihan,java.math.BigDecimal denda) {}
    public Tunggakan tunggakan(String petugasId,int minimalHari,String pencarian) throws SQLException {
        String cari=filter(pencarian);
        if(minimalHari<1)throw new IllegalArgumentException("Batas keterlambatan harus lebih dari nol.");
        try(Connection c=Koneksi.getConnection()) {
            petugas(c,petugasId);
            try(PreparedStatement p=c.prepareStatement("SELECT u.nama_lengkap,p.pinjaman_id,j.tanggal_jatuh_tempo,DATEDIFF(CURDATE(),j.tanggal_jatuh_tempo),j.pokok_angsuran+j.bunga_angsuran,j.denda FROM jadwal_angsuran j JOIN pinjaman p ON p.pinjaman_id=j.pinjaman_id JOIN users u ON u.user_id=p.nasabah_user_id JOIN nasabah n ON n.user_id=u.user_id WHERE p.status='Aktif' AND j.status_pembayaran<>'Lunas' AND DATEDIFF(CURDATE(),j.tanggal_jatuh_tempo)>=? AND LOCATE(?,CONCAT(p.pinjaman_id,' ',n.nik,' ',u.nama_lengkap))>0 ORDER BY j.tanggal_jatuh_tempo,p.pinjaman_id,j.angsuran_id")) {
                p.setInt(1,minimalHari);p.setString(2,cari);try(ResultSet r=p.executeQuery()) {
                    List<Object[]> rows=new ArrayList<>();java.math.BigDecimal total=java.math.BigDecimal.ZERO,denda=java.math.BigDecimal.ZERO;
                    while(r.next()) {var pokokBunga=r.getBigDecimal(5);var fine=r.getBigDecimal(6);rows.add(new Object[]{r.getString(1),r.getString(2),r.getDate(3),r.getInt(4),pokokBunga,fine});total=total.add(pokokBunga);denda=denda.add(fine);}
                    return new Tunggakan(rows,total,denda);
                }
            }
        }
    }
    private static String filter(String text) {
        if(text==null)return "";
        if(text.length()>200)throw new IllegalArgumentException("Pencarian maksimal 200 karakter.");
        return text.trim();
    }
}
