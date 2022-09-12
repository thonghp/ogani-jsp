package edu.nlu.ogani_jsp.dao;

import edu.nlu.ogani_jsp.entity.User;
import edu.nlu.ogani_jsp.repository.UserDAO;
import org.junit.Test;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNull;

public class UserDAOTest {

    private UserDAO userDAO = UserDAO.getInstance();

    @Test
    public void testFindById() {
        Integer id = 1;

        User user = userDAO.findById(id);

        assertEquals("email", "admin1@gmail.com", user.getEmail());
        assertEquals("role_name", "admin", user.getRole().getName());
    }

    @Test
    public void testNotFindById() {
        Integer id = 999;

        User user = userDAO.findById(id);

        assertNull(user);
    }
}