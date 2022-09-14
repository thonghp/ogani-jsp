package edu.nlu.ogani_jsp.dao;

import edu.nlu.ogani_jsp.entity.User;
import edu.nlu.ogani_jsp.repository.RoleDAO;
import edu.nlu.ogani_jsp.repository.UserDAO;
import org.junit.Test;

import java.util.List;

import static org.junit.Assert.*;

public class UserDAOTest {

    private UserDAO userDAO = UserDAO.getInstance();
    private RoleDAO roleDAO = RoleDAO.getInstance();

    @Test
    public void testCreateUser() {
        User user = new User();
        user.setEmail("admin1@gmail.com");
        user.setPassword("admin123");
        user.setFullName("admin1");
        user.setEnabled(true);
        user.setRole(roleDAO.findById(1));

        user = userDAO.save(user);

        assertTrue(user.getUserId() > 0);
    }

    @Test
    public void testFindUserById() {
        Integer id = 1;

        User user = userDAO.findById(id);

        assertEquals("test email", "admin1@gmail.com", user.getEmail());
        assertEquals("test role name", "admin", user.getRole().getName());
    }

    @Test
    public void testNotFindUserById() {
        Integer id = 999;

        User user = userDAO.findById(id);

        assertNull(user);
    }

    @Test
    public void testFindUserByEmail() {
        String email = "admin1@gmail.com";

        User user = userDAO.findByEmail(email);

        assertNotNull(user);
    }

    @Test
    public void testNotFindUserByEmail() {
        String email = "hello@gmail.com";

        User user = userDAO.findByEmail(email);

        assertNull(user);
    }

    @Test
    public void testListAllUsers() {
        List<User> users = userDAO.findAll();

        assertTrue(users.size() > 0);
    }

    @Test
    public void testUpdateUser() {
        User user = userDAO.findById(2);
        user.setEmail("admin2@gmail.com");

        user = userDAO.update(user);

        assertEquals("admin2@gmail.com", user.getEmail());
    }

    @Test
    public void testDeleteUser() {
        Integer id = 1;

        userDAO.delete(id);

        User user = userDAO.findById(id);

        assertNull(user);
    }
}