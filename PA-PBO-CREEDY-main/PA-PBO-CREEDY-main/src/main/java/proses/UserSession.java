package com.mycompany.caps_creedy.proses;

public class UserSession {
    private static String userId;
    private static String email;
    private static String nama;
    private static String role;

    public static void setSession(String uId, String em, String nm, String rl) {
        userId = uId;
        email = em;
        nama = nm;
        role = rl;
    }

    public static String getUserId() { return userId; }
    public static String getEmail() { return email; }
    public static String getNama() { return nama; }
    public static String getRole() { return role; }

    public static void clear() {
        userId = null;
        email = null;
        nama = null;
        role = null;
    }
}