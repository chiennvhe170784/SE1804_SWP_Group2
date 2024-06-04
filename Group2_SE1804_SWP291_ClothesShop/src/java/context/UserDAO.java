/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package context;

import model.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Putaa
 */
public class UserDAO extends DBContext {
    
    public User findByUsername(String username) throws SQLException {
        String query = "SELECT User.id AS id, fullName, phone, address, email, username, password, dob, gender, Role.name AS role "
                + "FROM User "
                + "JOIN Role ON Users.role = Roles.id "
                + "WHERE username = ?";

        PreparedStatement ps = null;
        ResultSet rs = null;
        Connection conn = null;

        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, username);

            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("id"),
                        rs.getString("fullName"),
                        rs.getString("phone"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getDate("dob"),
                        rs.getBoolean("gender"),
                        rs.getInt("rid")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return null;
    }
    
     public User add(String fullName, String phone, String address, String email, String username, String password, Date dob, boolean gender, int rid) throws SQLException {
        PreparedStatement ps = null;
        Connection conn = null;
        try {

            String query = "INSERT INTO Users fullName, phone, address, email, username, password, dob, gender, rid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = connection.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, phone);
            ps.setString(3, address);
            ps.setString(4, email);
            ps.setString(5, username);
            ps.setString(6, password);
            ps.setDate(7, (java.sql.Date) dob);
            ps.setBoolean(8, gender);
            ps.setInt(9, rid);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (ps != null) {
                ps.close();
            }
            if (conn != null) {
                conn.close();
            }
        }

        return null;
    }
     
     public static User login(String username, String password) throws SQLException {
        UserDAO users = new UserDAO();
        User user = users.findByUsername(username);
        if (user == null) {
            return null;
        }

        else {
            return user;
        }
    }
}
