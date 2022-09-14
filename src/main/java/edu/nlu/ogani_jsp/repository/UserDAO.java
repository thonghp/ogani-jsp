package edu.nlu.ogani_jsp.repository;

import edu.nlu.ogani_jsp.entity.Role;
import edu.nlu.ogani_jsp.entity.User;
import edu.nlu.ogani_jsp.util.DBUtil;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements Repository<User, Integer>, Serializable {
    private static UserDAO instance;

    private UserDAO() {

    }

    // không hay khi sử dụng trong multithread vì chỉ có 1 instance tồn tại
    public static UserDAO getInstance() {
        if (instance == null)
            instance = new UserDAO();

        return instance;
    }

    @Override
    public User save(User user) {
        String sql = "insert into user (email, password, full_name, enabled, photos, role_id) value(?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBUtil.makeConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, user.getEmail());
            stm.setString(2, user.getPassword());
            stm.setString(3, user.getFullName());
            stm.setBoolean(4, user.isEnabled());
            stm.setString(5, user.getPhotos());
            stm.setInt(6, user.getRole().getRoleId());

            if (stm.executeUpdate() > 0) return findByEmail(user.getEmail());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public User update(User user) {
        String sql = "update user set email = ?, password = ?, full_name = ?, enabled = ?, photos = ?, role_id = ? "
                + "where user_id = ?";

        try (Connection conn = DBUtil.makeConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setString(1, user.getEmail());
            stm.setString(2, user.getPassword());
            stm.setString(3, user.getFullName());
            stm.setBoolean(4, user.isEnabled());
            stm.setString(5, user.getPhotos());
            stm.setInt(6, user.getRole().getRoleId());
            stm.setInt(7, user.getUserId());

            if (stm.executeUpdate() > 0) return findByEmail(user.getEmail());
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    @Override
    public User findById(Integer id) {
        String sql = "select * from user u inner join role r on u.role_id = r.role_id where u.user_id = ?";

        try (Connection conn = DBUtil.makeConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, id);

            try (ResultSet rs = stm.executeQuery()) {
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
        String sql = "delete from user where user_id = ?";

        try (Connection conn = DBUtil.makeConnection();
             PreparedStatement stm = conn.prepareStatement(sql)) {
            stm.setInt(1, id);

            stm.execute();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public List<User> findAll() {
        List<User> users = new ArrayList<>();
        String sql = "select * from user u inner join role r on u.role_id = r.role_id";

        try (Connection conn = DBUtil.makeConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            try (ResultSet rs = preparedStatement.executeQuery()) {
                while (rs.next()) {
                    Integer id = rs.getInt("user_id");
                    String email = rs.getString("email");
                    String password = rs.getString("password");
                    String fullName = rs.getString("full_name");
                    boolean enabled = rs.getBoolean("enabled");
                    String photos = rs.getString("photos");
                    Role role = new Role(rs.getInt("role_id"), rs.getString("name"));

                    User user = new User(id, email, password, fullName, enabled, photos, role);

                    users.add(user);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return users;
    }

    @Override
    public long count() {
        return 0;
    }

    public User findByEmail(String email) {
        String sql = "select * from user u inner join role r on u.role_id = r.role_id where u.email = ?";

        try (Connection conn = DBUtil.makeConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(sql)) {
            preparedStatement.setString(1, email);

            try (ResultSet rs = preparedStatement.executeQuery()) {
                if (rs.next()) {
                    Integer id = rs.getInt("user_id");
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
}
