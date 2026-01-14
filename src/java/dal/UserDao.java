/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.time.LocalDateTime;
import model.User;

/**
 *
 * @author vinhung
 */
public class UserDao extends DBContext {

    private final String GET_LOGIN_USER_SQL = "select * from Users \n"
            + "where Email = ? AND Password = ?";

    private final String REGISTER_NEW_STUDENT_SQL = "INSERT INTO Users (FullName, Email, Password, Role)\n"
            + "VALUES \n"
            + "(?, ?, ?, 'student');\n";

    private final String GET_NUM_USER = "SELECT COUNT(*) FROM USERS";
    
    
    public int getNumOfAllUser(){
        try {
            PreparedStatement stm = c.prepareStatement(GET_NUM_USER);
            ResultSet rs = stm.executeQuery();
            while(rs.next()){
                return rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
        
    }
    
    
    public User getLoginUser(String email, String password) {

        try {
            PreparedStatement stm = c.prepareStatement(GET_LOGIN_USER_SQL);
            stm.setString(1, email);
            stm.setString(2, password);
            ResultSet res = stm.executeQuery();
            if (res.next()) {
                return new User(res.getString("FullName"),
                        res.getString("Email"),
                        res.getString("Password"),
                        res.getString("Role"),
                        res.getTimestamp("CreatedAt").toLocalDateTime());
            } else {
                return null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    public boolean registerStudent(String name, String email, String pass) {

        try {
            PreparedStatement stm = c.prepareStatement(REGISTER_NEW_STUDENT_SQL);
            stm.setString(1, name);
            stm.setString(2, email);
            stm.setString(3, pass);
            int rows = stm.executeUpdate();
            if (rows > 0) {
                return true;
            }
        } catch (Exception e) {
            return false;

        }
        return false;
    }

    public static void main(String[] args) {
        UserDao dao = new UserDao();
//        System.out.println(dao.getLoginUser("a@example.com", "123456"));
        dao.registerStudent("itachi", "itachi@gmail.com", "12345");

//        System.out.println(dao.getNumOfAllUser());
    }

}
