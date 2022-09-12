package edu.nlu.ogani_jsp.repository;

import edu.nlu.ogani_jsp.entity.Role;
import edu.nlu.ogani_jsp.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RoleDAO implements Repository<Role, Integer> {
    private static RoleDAO instance;

    private RoleDAO() {

    }

    // dở khi sử dụng trong multithread
    public static RoleDAO getInstance() {
        if (instance == null)
            instance = new RoleDAO();

        return instance;
    }

    @Override
    public Role save(Role role) {
        return null;
    }

    @Override
    public Role update(Role role) {
        return null;
    }

    @Override
    public Role findById(Integer id) {
        String sql = "SELECT * FROM role WHERE role_id = ?";

        try (Connection conn = DBUtil.makeConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    String name = rs.getString("name");

                    return new Role(id, name);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void delete(Integer integer) {

    }

    @Override
    public Iterable<Role> findAll() {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }
}
