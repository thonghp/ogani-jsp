package edu.nlu.ogani_jsp.repository;

import edu.nlu.ogani_jsp.entity.Role;
import edu.nlu.ogani_jsp.entity.User;
import edu.nlu.ogani_jsp.util.DBUtil;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO implements Repository<User, Integer>, Serializable {
    private static UserDAO instance;

    private UserDAO() {

    }

    // dở khi sử dụng trong multithread
    public static UserDAO getInstance() {
        if (instance == null)
            instance = new UserDAO();

        return instance;
    }

    @Override
    public User save(User user) {
        return null;
    }

    @Override
    public User update(User user) {
        return null;
    }

    @Override
    public User findById(Integer id) {
        String sql = "select * from user u inner join role r on u.role_id = r.role_id where u.user_id = ?";

        try (Connection conn = DBUtil.makeConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setInt(1, id);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String fullName = rs.getString("full_name");
                    boolean enabled = rs.getBoolean("enabled");
                    String photos = rs.getString("photos");
                    Role role = new Role(rs.getInt("role_id"), rs.getString("name"));

                    return new User(id, email, password, fullName, enabled, photos, role);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public void delete(Integer id) {

    }

    @Override
    public Iterable<User> findAll() {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }
}
