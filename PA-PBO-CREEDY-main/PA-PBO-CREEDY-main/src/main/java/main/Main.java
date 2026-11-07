package main;

import view.LoginView;

public class Main {
    public static void main(String[] args) {
        try {
            // Memasang FlatLaf (tema modern) secara global
            com.formdev.flatlaf.FlatLightLaf.setup();
            
            // Tips: Jika lebih suka tampilan mode gelap (Dark Mode),
            // ganti baris di atas dengan:
            // com.formdev.flatlaf.FlatDarkLaf.setup();
            
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(Main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        // Membuka halaman pertama aplikasi (LoginView)
        java.awt.EventQueue.invokeLater(() -> {
            new LoginView().setVisible(true);
        });
    }
}