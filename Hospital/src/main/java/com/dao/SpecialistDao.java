package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.Specialist;

public class SpecialistDao {
    private Connection conn;

    public SpecialistDao(Connection conn) {
        this.conn = conn;
    }

    public boolean addSpecialist(String spac) {
        boolean f = false;
        try {
            String sql = "INSERT INTO  specialist(spac_name) VALUES(?)";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, spac); // Set the value of the placeholder
            int i = ps.executeUpdate();
            if (i > 0) {
                f = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }
    public List<Specialist> getAllSpecialist() {
        List<Specialist> list = new ArrayList<>();
        String sql = "SELECT * FROM specialist";
        try (PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Specialist s = new Specialist();  // fixed class name
                s.setId(rs.getInt(1));
                s.setSpecialistName(rs.getString(2));
                list.add(s);
            }
        } catch (Exception e) {
            e.printStackTrace();  // consider replacing with logging
        }
        return list;
    }

}
