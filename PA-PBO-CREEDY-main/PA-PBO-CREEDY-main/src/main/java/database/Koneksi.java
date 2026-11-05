package com.mycompany.caps_creedy.database;

import java.sql.*;

public class Koneksi {
    private Koneksi() {}
    // Set properti ini hanya untuk menjalankan database uji terpisah.
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(
            System.getProperty("creedy.db.url", "jdbc:mysql://127.0.0.1:3306/pa_creedy?connectTimeout=5000&socketTimeout=15000"),
            System.getProperty("creedy.db.user", "root"), System.getProperty("creedy.db.password", ""));
    }
}
