package edu.nlu.ogani_jsp.dao;

import edu.nlu.ogani_jsp.entity.Role;
import jakarta.persistence.EntityManager;

import java.util.List;

public class RoleDAO extends JpaDAO<Role> implements GenericDAO<Role> {
    public RoleDAO(EntityManager entityManager) {
        super(entityManager);
    }

    @Override
    public Role get(Object id) {
        return super.find(Role.class, id);
    }

    @Override
    public void delete(Object id) {

    }

    @Override
    public List<Role> listAll() {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }
}
