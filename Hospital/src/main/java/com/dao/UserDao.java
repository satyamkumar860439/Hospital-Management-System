package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.entity.User;

public class UserDao {
    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    // Register a user
    public boolean registerUser(User u) {
        boolean isRegistered = false;
        try {
            String sql = "INSERT INTO user_d (fullName, email, passward) VALUES (?, ?, ?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, u.getFullName());
            ps.setString(2, u.getEmail());
            ps.setString(3, u.getPassward()); 
            int result = ps.executeUpdate();
            if (result == 1) {
                isRegistered = true;
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return isRegistered;
    }

    // Login user
    public User login(String email, String passward) {
        User u = null;
        try {
            String sql = "SELECT * FROM user_d WHERE email = ? AND passward = ?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, email);
			ps.setString(2, passward);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                u = new User();
                u.setId(rs.getInt("1"));
                u.setFullName(rs.getString("2"));
                u.setEmail(rs.getString("3"));
                u.setPassward(rs.getString("4"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return u;
    }
}
