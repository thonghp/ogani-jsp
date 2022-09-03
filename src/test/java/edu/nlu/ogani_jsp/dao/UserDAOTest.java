package edu.nlu.ogani_jsp.dao;

import edu.nlu.ogani_jsp.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import jakarta.persistence.PersistenceException;
import org.junit.AfterClass;
import org.junit.BeforeClass;
import org.junit.Test;

import static org.junit.Assert.*;

public class UserDAOTest {

    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;
    private static UserDAO userDAO;
    private static RoleDAO roleDAO;

    @BeforeClass
    public static void beforeAll() {
        entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
        entityManager = entityManagerFactory.createEntityManager();

        userDAO = new UserDAO(entityManager);
        roleDAO = new RoleDAO(entityManager);
    }

    @Test
    public void testCreateUser() {
        User user = new User();
        user.setEmail("thong@gmail.com");
        user.setPassword("thong123");
        user.setFullName("hoàng phạm thông");
        user.setEnabled(true);
        user.setRole(roleDAO.get(2));

        user = userDAO.create(user);

        assertTrue(user.getUserId() > 0);
    }

    @Test(expected = PersistenceException.class)
    public void testCreateUserFieldsNotSet() {
        User user = new User();
        userDAO.create(user);
    }

    @Test(expected = PersistenceException.class)
    public void testCreateUserWithMissingField() {
        User user = new User();
        user.setEmail("admin1@gmail.com");
        user.setPassword("admin123");
//        user.setFullName("admin"); assumption is missing
        user.setEnabled(true);
        user.setRole(roleDAO.get(1));

        userDAO.create(user);
    }

    @Test(expected = PersistenceException.class)
    public void testCreateUserWithDuplicateEmail() {
        User user = new User();
        user.setEmail("thong@gmail.com");
        user.setPassword("thong123");
        user.setFullName("hoàng phạm thái");
        user.setEnabled(true);
        user.setRole(roleDAO.get(2));

        userDAO.create(user);
    }

    @Test
    public void testFindByUser() {
        Integer userId = 1;
        User user = userDAO.get(userId);
        assertNotNull(user);
    }

    @Test(expected = IllegalArgumentException.class)
    public void testUserNotFound() {
        Integer userId = 99999;
        User user = userDAO.get(userId);
        assertNull(user);
    }

    @Test
    public void testUpdateUser() {
        Integer userId = 3;
        User user = userDAO.get(userId);
        user.setFullName("hoàng thông");
        user = userDAO.update(user);

        assertEquals("hoàng thông", user.getFullName());
    }

    @Test(expected = IllegalArgumentException.class)
    public void testUpdateUserWithAnInvalidId() {
        Integer userId = 99999;
        User user = userDAO.get(userId);
        user.setFullName("admin");
        user = userDAO.update(user);
    }

    @AfterClass
    public static void afterAll() {
        entityManager.close();
        entityManagerFactory.close();
    }
}