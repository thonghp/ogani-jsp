package edu.nlu.ogani_jsp.service;

import edu.nlu.ogani_jsp.entity.User;
import edu.nlu.ogani_jsp.repository.UserDAO;

import java.util.List;

public class UserService {
    private UserDAO repository = UserDAO.getInstance();

    public List<User> listUser() {
        return repository.findAll();
    }
}
