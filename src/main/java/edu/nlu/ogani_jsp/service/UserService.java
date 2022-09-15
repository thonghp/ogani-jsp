package edu.nlu.ogani_jsp.service;

import edu.nlu.ogani_jsp.entity.Role;
import edu.nlu.ogani_jsp.entity.User;
import edu.nlu.ogani_jsp.repository.RoleDAO;
import edu.nlu.ogani_jsp.repository.UserDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UserService {
    private static final Integer EMPLOYEE_ROLE_ID = 2;
    private UserDAO userRepo = UserDAO.getInstance();
    private RoleDAO roleRepo = RoleDAO.getInstance();

    public void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<User> users = userRepo.findAll();

        request.setAttribute("listUsers", users);

        String listPage = "users.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
        requestDispatcher.forward(request, response);
    }

    public Role getRole(Integer id) {
        return roleRepo.findById(id);
    }

    public User save(HttpServletRequest request) {
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean enabled;
        if (request.getParameter("enabled").equals("on")) {
            enabled = true;
        } else {
            enabled = false;
        }

        String photos;
        if (request.getParameter("photos").isEmpty()) {
            photos = null;
        } else {
            photos = request.getParameter("photos");
        }

        Role role = getRole(EMPLOYEE_ROLE_ID);

        User user = new User(email, password, fullName, enabled, photos, role);

        return userRepo.save(user);
    }
}
