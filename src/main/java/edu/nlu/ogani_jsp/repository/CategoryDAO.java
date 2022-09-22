package edu.nlu.ogani_jsp.repository;

import edu.nlu.ogani_jsp.entity.Category;

import java.io.Serializable;

public class CategoryDAO implements Repository<Category, Integer>, Serializable {
    private static CategoryDAO instance;

    private CategoryDAO() {

    }

    public static CategoryDAO getInstance() {
        if (instance == null)
            instance = new CategoryDAO();

        return instance;
    }

    @Override
    public Category save(Category category) {
        return null;
    }

    @Override
    public Category update(Category category) {
        return null;
    }

    @Override
    public Category findById(Integer integer) {
        return null;
    }

    @Override
    public void delete(Integer integer) {

    }

    @Override
    public Iterable<Category> findAll() {
        return null;
    }

    @Override
    public long count() {
        return 0;
    }
}
