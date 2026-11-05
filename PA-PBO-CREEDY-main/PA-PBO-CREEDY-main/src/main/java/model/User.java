package com.mycompany.caps_creedy.model;

public class User {
    private String idUser;
    private String email;
    private String password;
    private String nik;
    private String nip;

    public User(String idUser, String email, String password, String nik, String nip) {
        this.idUser = idUser;
        this.email = email;
        this.password = password;
        this.nik = nik;
        this.nip = nip;
    }

    public String getIdUser() { return idUser; }
    public String getEmail() { return email; }
    public String getPassword() { return password; }
    public String getNik() { return nik; }
    public String getNip() { return nip; }
}