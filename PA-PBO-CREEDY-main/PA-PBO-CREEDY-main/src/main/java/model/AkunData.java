package com.mycompany.caps_creedy.model;

public class AkunData {
    private String userId;
    private String email;
    private String nama;
    private String role;

    public AkunData(String userId, String email, String nama, String role) {
        this.userId = userId;
        this.email = email;
        this.nama = nama;
        this.role = role;
    }

    public String getUserId() { return userId; }
    public String getEmail() { return email; }
    public String getNama() { return nama; }
    public String getRole() { return role; }
}