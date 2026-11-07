package main;

import view.LoginView;

public class Main {
    public static void main(String[] args) {
        try {
            // Memasang FlatLaf (tema modern) secara global
            com.formdev.flatlaf.FlatLightLaf.setup();
            
        } catch (Exception ex) {
            java.util.logging.Logger.getLogger(Main.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }

        // Membuka halaman pertama aplikasi (LoginView)
        java.awt.EventQueue.invokeLater(() -> {
            new LoginView().setVisible(true);
        });
    }
}
