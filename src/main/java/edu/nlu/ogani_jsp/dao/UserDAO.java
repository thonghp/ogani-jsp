package edu.nlu.ogani_jsp.dao;

import edu.nlu.ogani_jsp.entity.User;
import jakarta.persistence.EntityManager;

import java.util.List;

public class UserDAO extends JpaDAO<User> implements GenericDAO<User> {

    public UserDAO(EntityManager entityManager) {
        super(entityManager);
    }

    @Override
    public User create(User user) {
        return super.create(user);
    }

    @Override
    public User update(User user) {
        return super.update(user);
    }

    @Override
    public User get(Object id) {
        return super.find(User.class, id);
    }

    @Override
    public void delete(Object id) {


    }

    @Override
    public List<User> listAll() {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }
}
