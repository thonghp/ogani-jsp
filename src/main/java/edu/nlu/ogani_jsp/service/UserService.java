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
    private HttpServletRequest request;
    private HttpServletResponse response;

    public UserService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public void listUser() throws ServletException, IOException {
        listUser(null);
    }

    public void listUser(String message) throws ServletException, IOException {
        List<User> users = userRepo.findAll();

        request.setAttribute("listUsers", users);

        if (message != null)
            request.setAttribute("message", message);

        String listPage = "users.jsp";
        RequestDispatcher requestDispatcher = request.getRequestDispatcher(listPage);
        requestDispatcher.forward(request, response);
    }

    public Role getRole(Integer id) {
        return roleRepo.findById(id);
    }

    public User save() throws ServletException, IOException {
        User user;
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        boolean enabled;
        if (!(request.getParameter("enabled") == null)) {
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

        User existUser = userRepo.findByEmail(email);

        if (existUser != null) {
            String message = "Không thể thêm mới nhân viên vì email " + email + " đã tồn tại!!!";
            request.setAttribute("message", message);
            request.getRequestDispatcher("user_form.jsp").forward(request, response);

            user = null;
        } else {
            User newUser = new User(email, password, fullName, enabled, photos, role);
            user = userRepo.save(newUser);
            listUser("Nhân viên đã được thêm thành công !");
        }

        return user;
    }
}
