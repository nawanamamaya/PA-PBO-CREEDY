package com.mycompany.caps_creedy.model;

public class Pegawai {
    private String nip;
    private String nama;
    private String jabatan;
    private String status;

    public Pegawai(String nip, String nama, String jabatan, String status) {
        this.nip = nip;
        this.nama = nama;
        this.jabatan = jabatan;
        this.status = status;
    }

    public String getNip() { return nip; }
    public String getNama() { return nama; }
    public String getJabatan() { return jabatan; }
    public String getStatus() { return status; }
}