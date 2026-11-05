package view;

import com.mycompany.caps_creedy.database.Koneksi;
import com.mycompany.caps_creedy.proses.UserSession;
import java.sql.*;
import java.util.concurrent.Callable;
import java.util.function.*;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class config {
    public static Connection configDB() throws SQLException { return Koneksi.getConnection(); }

    // Satu worker per jendela: cegah klik ganda dan abaikan hasil jendela yang sudah ditutup.
    public static <T> void run(JFrame frame, Callable<T> task, Consumer<T> success) {
        if (Boolean.TRUE.equals(frame.getRootPane().getClientProperty("busy"))) return;
        frame.getRootPane().putClientProperty("busy", true);
        frame.setCursor(java.awt.Cursor.getPredefinedCursor(java.awt.Cursor.WAIT_CURSOR));
        java.util.Map<java.awt.Component,Boolean> controls=new java.util.IdentityHashMap<>();
        controls(frame.getContentPane(),controls);
        new SwingWorker<T, Void>() {
            protected T doInBackground() throws Exception { return task.call(); }
            protected void done() {
                frame.getRootPane().putClientProperty("busy", false);
                frame.setCursor(java.awt.Cursor.getDefaultCursor());
                controls.forEach(java.awt.Component::setEnabled);
                if (!frame.isDisplayable()) return;
                try { success.accept(get()); }
                catch (InterruptedException e) { Thread.currentThread().interrupt(); }
                catch (Exception e) { error(frame, e); }
            }
        }.execute();
    }

    private static void controls(java.awt.Container container, java.util.Map<java.awt.Component,Boolean> states) {
        for(java.awt.Component component:container.getComponents()) {
            if(component instanceof java.awt.Container child)controls(child,states);
            if(component instanceof javax.swing.text.JTextComponent || component instanceof javax.swing.AbstractButton || component instanceof javax.swing.JComboBox<?> || component instanceof JTable) {
                states.put(component,component.isEnabled());component.setEnabled(false);
            }
        }
    }
    public static void error(JFrame frame, Throwable error) {
        while (error.getCause() != null) error = error.getCause();
        String message;
        if (error instanceof IllegalArgumentException || error instanceof IllegalStateException)
            message = error.getMessage();
        else {
            java.util.logging.Logger.getLogger(config.class.getName()).log(java.util.logging.Level.WARNING, "Operasi gagal", error);
            message = error instanceof SQLException
                ? "Operasi database gagal. Periksa koneksi Laragon, lalu muat ulang halaman sebelum mencoba lagi."
                : "Operasi belum berhasil. Silakan muat ulang halaman dan coba kembali.";
        }
        JOptionPane.showMessageDialog(frame, message, "Operasi belum berhasil", JOptionPane.WARNING_MESSAGE);
    }

    public static boolean pegawai(JFrame frame) {
        if(UserSession.getUserId()!=null && java.util.Set.of("Admin","Teller","Petugas Kredit").contains(java.util.Objects.toString(UserSession.getRole(),"")))return true;
        SwingUtilities.invokeLater(() -> open(frame,LoginView::new));return false;
    }

    public static boolean petugas(JFrame frame) {
        if (UserSession.getUserId()!=null && "Petugas Kredit".equals(UserSession.getRole())) return true;
        SwingUtilities.invokeLater(() -> open(frame,LoginView::new));
        return false;
    }

    public static void posisiCari(JFrame frame,JButton button,JButton duplikat) {
        duplikat.setVisible(false);
        frame.getContentPane().remove(button);
        frame.getContentPane().add(button,new org.netbeans.lib.awtextra.AbsoluteConstraints(850,20,150,28),0);
        button.setText("Cari / Muat Ulang");
    }

    public static void belumAktif(AbstractButton button) {
        button.setEnabled(false);
        button.setToolTipText("Fitur ini belum tersedia.");
    }

    public static boolean nasabah(JFrame frame) {
        if (UserSession.getUserId() != null && "Nasabah".equals(UserSession.getRole())) return true;
        SwingUtilities.invokeLater(() -> open(frame, LoginView::new));
        return false;
    }

    public static void open(JFrame from, Supplier<? extends JFrame> factory) {
        if (Boolean.TRUE.equals(from.getRootPane().getClientProperty("busy"))) return;
        try { JFrame next = factory.get(); next.setLocationRelativeTo(from); next.setVisible(true); from.dispose(); }
        catch (RuntimeException e) { error(from, e); }
    }

    public static void logout(JFrame frame) {
        if (Boolean.TRUE.equals(frame.getRootPane().getClientProperty("busy"))) return;
        UserSession.clear(); open(frame, LoginView::new);
    }

    // Informasi nasabah tidak menerima fokus/caret; urutan dan lebar kolom tetap.
    public static void kunciInformasi(java.awt.Container container) {
        for (java.awt.Component component : container.getComponents()) {
            if (component instanceof javax.swing.text.JTextComponent text && !text.isEditable()) {
                text.setFocusable(false);
                text.getCaret().setVisible(false);
                text.getCaret().setSelectionVisible(false);
                text.setCursor(java.awt.Cursor.getDefaultCursor());
            }
            if (component instanceof JTable table && table.getTableHeader() != null) {
                table.getTableHeader().setReorderingAllowed(false);
                table.getTableHeader().setResizingAllowed(false);
            }
            if (component instanceof java.awt.Container child) kunciInformasi(child);
        }
    }

    public static JButton jangkaWaktu(JTextField angka,JPanel parent) {
        JButton tombol=new JButton("Bulan ▾");tombol.putClientProperty("satuan","Bulan");
        JPanel kotak=new JPanel(new java.awt.BorderLayout());kotak.setBorder(angka.getBorder());kotak.setBackground(angka.getBackground());
        ((GroupLayout)parent.getLayout()).replace(angka,kotak);
        angka.setBorder(BorderFactory.createEmptyBorder(0,4,0,4));
        angka.getAccessibleContext().setAccessibleName("Angka jangka waktu");tombol.getAccessibleContext().setAccessibleName("Pilih satuan jangka waktu");
        kotak.add(angka,java.awt.BorderLayout.CENTER);kotak.add(tombol,java.awt.BorderLayout.LINE_END);
        ((javax.swing.text.AbstractDocument)angka.getDocument()).setDocumentFilter(new javax.swing.text.DocumentFilter() {
            public void insertString(FilterBypass fb,int offset,String text,javax.swing.text.AttributeSet attrs)throws javax.swing.text.BadLocationException{replace(fb,offset,0,text,attrs);}
            public void replace(FilterBypass fb,int offset,int length,String text,javax.swing.text.AttributeSet attrs)throws javax.swing.text.BadLocationException {
                String current=fb.getDocument().getText(0,fb.getDocument().getLength());
                String next=current.substring(0,offset)+java.util.Objects.toString(text,"")+current.substring(offset+length);
                if(next.matches("[0-9]{0,3}"))fb.replace(offset,length,text,attrs);
            }
        });
        JPopupMenu pilihan=new JPopupMenu();
        for(String unit:new String[]{"Tahun","Bulan"}) {
            JMenuItem item=new JMenuItem(unit);item.addActionListener(e -> {tombol.putClientProperty("satuan",unit);tombol.setText(unit+" ▾");angka.setToolTipText("Tahun".equals(unit)?"Isi 1–30 tahun; 1 tahun = 12 bulan.":"Isi 1–360 bulan.");});pilihan.add(item);
        }
        tombol.addActionListener(e -> pilihan.show(tombol,0,tombol.getHeight()));angka.setToolTipText("Isi 1–360 bulan.");return tombol;
    }
    public static String tenorBulan(String angka,String unit) {
        if(angka==null || !angka.matches("[0-9]{1,3}") || !("Tahun".equals(unit)||"Bulan".equals(unit)))throw new IllegalArgumentException("Isi angka jangka waktu, lalu pilih Bulan atau Tahun.");
        int nilai=Integer.parseInt(angka),batas="Tahun".equals(unit)?30:360;
        if(nilai<1 || nilai>batas)throw new IllegalArgumentException("Jangka waktu harus 1–"+batas+" "+unit.toLowerCase(java.util.Locale.ROOT)+".");
        return String.valueOf("Tahun".equals(unit)?nilai*12:nilai);
    }
    public static void resetTenor(JTextField angka,JButton tombol) {
        angka.setText("");angka.setToolTipText("Isi 1–360 bulan.");tombol.putClientProperty("satuan","Bulan");tombol.setText("Bulan ▾");
    }

    public static DefaultTableModel table(String[] headers, java.util.List<Object[]> rows) {
        return new DefaultTableModel(rows.toArray(Object[][]::new), headers) {
            public boolean isCellEditable(int row, int column) { return false; }
        };
    }
    public static String selected(JComboBox<String> combo) {
        if (combo.getSelectedItem() == null) throw new IllegalArgumentException("Pilihan belum tersedia. Pastikan Anda memiliki rekening atau pinjaman yang sesuai.");
        return combo.getSelectedItem().toString();
    }
    public static void combo(JComboBox<String> combo, java.util.List<String> values) {
        combo.setEnabled(!values.isEmpty());
        combo.setModel(new DefaultComboBoxModel<>(values.toArray(String[]::new)));
    }
    public static void info(JFrame frame, String text) { JOptionPane.showMessageDialog(frame, text); }

}
