package edu.nlu.ogani_jsp.repository;

public interface Repository<T> {

    T save(T t);

    T update(T t);

    T findById(Object id);

    void delete(Object id);

    Iterable<T> findAll();

    long count();
}
