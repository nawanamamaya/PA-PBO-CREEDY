package com.mycompany.caps_creedy.dao;

import com.mycompany.caps_creedy.database.Koneksi;
import com.mycompany.caps_creedy.model.AkunData;
import java.sql.*;
import java.util.Set;

public class AutentikasiDAO {
    public AkunData autentikasi(String identifier,String password,String role)throws SQLException {
        if(!Set.of("Nasabah","Admin","Teller","Petugas Kredit").contains(role))throw new IllegalArgumentException("Pilih peran yang tersedia.");
        String sql="Nasabah".equals(role)
            ? "SELECT u.user_id,u.email,u.nama_lengkap FROM users u JOIN nasabah n ON n.user_id=u.user_id WHERE (u.email=? OR n.nik=?) AND CAST(u.password AS BINARY)=CAST(? AS BINARY) AND u.status='Aktif' AND u.user_type='Nasabah'"
            : "SELECT u.user_id,u.email,u.nama_lengkap FROM users u JOIN pegawai p ON p.user_id=u.user_id WHERE (u.email=? OR p.nip=?) AND CAST(u.password AS BINARY)=CAST(? AS BINARY) AND u.status='Aktif' AND u.user_type='Pegawai' AND p.jabatan=?";
        try(Connection c=Koneksi.getConnection();PreparedStatement p=c.prepareStatement(sql)) {
            p.setString(1,identifier);p.setString(2,identifier);p.setString(3,password);if(!"Nasabah".equals(role))p.setString(4,role);
            try(ResultSet r=p.executeQuery()) {
                if(!r.next())return null;
                AkunData akun=new AkunData(r.getString(1),r.getString(2),r.getString(3),role);
                if(r.next())throw new IllegalStateException("Identitas akun tidak unik. Hubungi admin.");
                return akun;
            }
        }
    }
}
