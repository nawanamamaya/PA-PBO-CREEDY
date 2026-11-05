package model;

public final class UserSession {
    private UserSession() {}
    public static String getUserId(){return com.mycompany.caps_creedy.proses.UserSession.getUserId();}
    public static String getNamaUser(){return com.mycompany.caps_creedy.proses.UserSession.getNama();}
    public static String getRole(){return com.mycompany.caps_creedy.proses.UserSession.getRole();}
    public static void setUserId(String id){com.mycompany.caps_creedy.proses.UserSession.setSession(id,com.mycompany.caps_creedy.proses.UserSession.getEmail(),getNamaUser(),getRole());}
    public static void setNamaUser(String nama){com.mycompany.caps_creedy.proses.UserSession.setSession(getUserId(),com.mycompany.caps_creedy.proses.UserSession.getEmail(),nama,getRole());}
    public static void setRole(String role){com.mycompany.caps_creedy.proses.UserSession.setSession(getUserId(),com.mycompany.caps_creedy.proses.UserSession.getEmail(),getNamaUser(),role);}
    public static void clearSession(){com.mycompany.caps_creedy.proses.UserSession.clear();}
    
    public static void clear(){clearSession();}
}