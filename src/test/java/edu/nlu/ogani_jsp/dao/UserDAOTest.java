package edu.nlu.ogani_jsp.dao;

import edu.nlu.ogani_jsp.entity.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

class UserDAOTest {

    private static EntityManagerFactory entityManagerFactory;
    private static EntityManager entityManager;
    private static UserDAO userDAO;

    @BeforeAll
    static void beforeAll() {
        entityManagerFactory = Persistence.createEntityManagerFactory("BookStoreWebsite");
        entityManager = entityManagerFactory.createEntityManager();

        userDAO = new UserDAO(entityManager);
    }

    @Test
    void create() {
        User user = new User();
        user.setEmail("admin2@gmail.com");
        user.setPassword("admin123");
        user.setFullName("admin");
        user.setEnabled(true);

        user = userDAO.create(user);

        assertTrue(user.getUserId() > 0);
    }

    @Test
    void update() {
        User user = new User();
        user.setUserId(1);
        user.setEmail("admin1@gmail.com");
        user.setPassword("admin123");
        user.setFullName("admin");
        user.setEnabled(true);

        user = userDAO.update(user);

        assertEquals("admin1@gmail.com", user.getEmail());
    }

    @AfterAll
    static void afterAll() {
        entityManager.close();
        entityManagerFactory.close();
    }
}