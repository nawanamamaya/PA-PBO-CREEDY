package com.mycompany.caps_creedy.model;

public class Nasabah {
    private String nik;
    private String nama;
    private String noRekening;
    private double saldo;

    public Nasabah(String nik, String nama, String noRekening, double saldo) {
        this.nik = nik;
        this.nama = nama;
        this.noRekening = noRekening;
        this.saldo = saldo;
    }

    public String getNik() { return nik; }
    public String getNama() { return nama; }
    public String getNoRekening() { return noRekening; }
    public double getSaldo() { return saldo; }
}