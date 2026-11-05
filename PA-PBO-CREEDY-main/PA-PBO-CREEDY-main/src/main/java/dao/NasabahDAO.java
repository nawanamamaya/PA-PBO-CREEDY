package com.mycompany.caps_creedy.dao;

import com.mycompany.caps_creedy.database.Koneksi;
import java.sql.*;
import java.math.BigDecimal;
import java.util.*;

public class NasabahDAO {
    public record Rekening(String nomor, String jenis, BigDecimal saldo, String status) {}
    public record Ringkasan(List<Rekening> rekening, int pinjamanAktif) {}

    public static void aktif(Connection c, String userId) throws SQLException {
        try (PreparedStatement p = c.prepareStatement("SELECT n.user_id FROM nasabah n JOIN users u ON u.user_id=n.user_id WHERE n.user_id=? AND u.status='Aktif' AND u.user_type='Nasabah'")) {
            p.setString(1, userId);
            try (ResultSet r = p.executeQuery()) {
                if (!r.next()) throw new IllegalStateException("Sesi nasabah tidak valid atau akun tidak aktif. Silakan login kembali.");
            }
        }
    }
    public List<Rekening> rekening(String userId, boolean aktifSaja) throws SQLException {
        try (Connection c = Koneksi.getConnection()) {
            aktif(c, userId);
            try (PreparedStatement p = c.prepareStatement("SELECT nomor_rekening,jenis_rekening,saldo,status_rekening FROM rekening WHERE nasabah_user_id=?" + (aktifSaja ? " AND status_rekening='Aktif'" : "") + " ORDER BY nomor_rekening")) {
                p.setString(1, userId);
                try (ResultSet r = p.executeQuery()) {
                    List<Rekening> rows = new ArrayList<>();
                    while (r.next()) rows.add(new Rekening(r.getString(1),r.getString(2),r.getBigDecimal(3),r.getString(4)));
                    return rows;
                }
            }
        }
    }
    public Ringkasan ringkasan(String userId) throws SQLException {
        List<Rekening> rows = rekening(userId, false);
        try (Connection c = Koneksi.getConnection(); PreparedStatement p = c.prepareStatement("SELECT COUNT(*) FROM pinjaman WHERE nasabah_user_id=? AND status='Aktif'")) {
            p.setString(1,userId);
            try (ResultSet r = p.executeQuery()) { r.next(); return new Ringkasan(rows,r.getInt(1)); }
        }
    }
    public List<String> nomorRekening(String userId) throws SQLException {
        return rekening(userId,true).stream().map(Rekening::nomor).toList();
    }
    public String[] profil(String userId) throws SQLException {
        try (Connection c=Koneksi.getConnection()) {
            aktif(c,userId);
            try (PreparedStatement p=c.prepareStatement("SELECT n.no_telepon,u.user_id,n.nik,n.npwp,u.nama_lengkap,n.alamat,n.tipe_nasabah,n.tanggal_daftar FROM nasabah n JOIN users u ON u.user_id=n.user_id WHERE n.user_id=?")) {
                p.setString(1,userId);
                try(ResultSet r=p.executeQuery()) { r.next(); String[] data=new String[8]; for(int i=0;i<8;i++) data[i]=Objects.toString(r.getString(i+1),"-"); return data; }
            }
        }
    }
}
