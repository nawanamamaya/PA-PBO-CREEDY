package com.mycompany.caps_creedy.proses;

import com.mycompany.caps_creedy.dao.AutentikasiDAO;
import com.mycompany.caps_creedy.model.AkunData;
import java.sql.SQLException;
import java.util.*;

public class Autentikasi {
    private record Percobaan(int jumlah,long mulai) {}
    private static final Map<String,Percobaan> attempts=new HashMap<>();
    private static int total;
    private static long awal=System.nanoTime();
    private static final long MENIT=60_000_000_000L;

    // Pembatasan lokal dibagi oleh semua jendela login selama proses aplikasi hidup.
    private static synchronized void batasi(String key) {
        long now=System.nanoTime();
        attempts.entrySet().removeIf(e -> now-e.getValue().mulai()>=MENIT);
        if(now-awal>=MENIT){total=0;awal=now;}
        Percobaan p=attempts.get(key);
        if(total>=30 || (p!=null && p.jumlah()>=5))throw new IllegalStateException("Terlalu banyak percobaan login. Tunggu hingga satu menit, lalu coba lagi.");
        total++;
        attempts.put(key,new Percobaan(p==null?1:p.jumlah()+1,p==null?now:p.mulai()));
    }
    public AkunData login(String identifier,String password,String role)throws SQLException {
        if(identifier==null || identifier.isBlank() || identifier.trim().length()>50 || password==null || password.isEmpty() || password.length()>255)
            throw new IllegalArgumentException("Isi identitas akun (maksimal 50 karakter) dan password (maksimal 255 karakter).");
        String key=identifier.trim().toLowerCase(Locale.ROOT);
        batasi(key);
        AkunData akun=new AutentikasiDAO().autentikasi(identifier.trim(),password,role);
        if(akun!=null)synchronized(Autentikasi.class){attempts.remove(key);}
        return akun;
    }
    public boolean prosesLogin(String identifier,String password,String role)throws SQLException {
        AkunData akun=login(identifier,password,role);
        if(akun==null)return false;
        UserSession.setSession(akun.getUserId(),akun.getEmail(),akun.getNama(),akun.getRole());return true;
    }
}
