package edu.nlu.ogani_jsp.repository;

public interface Repository<T, ID> {

    T save(T t);

    T update(T t);

    T findById(ID id);

    void delete(ID id);

    Iterable<T> findAll();

    long count();
}
