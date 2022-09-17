package edu.nlu.ogani_jsp.service;

import edu.nlu.ogani_jsp.entity.Role;
import edu.nlu.ogani_jsp.entity.User;
import edu.nlu.ogani_jsp.repository.RoleDAO;
import edu.nlu.ogani_jsp.repository.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class UserService {
    private UserDAO userRepo = UserDAO.getInstance();
    private RoleDAO roleRepo = RoleDAO.getInstance();
    private HttpServletRequest request;
    private HttpServletResponse response;

    public UserService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public Role getRole(Integer id) {
        return roleRepo.findById(id);
    }

    public void listUser(String message) throws ServletException, IOException {
        List<User> users = userRepo.findAll();

        request.setAttribute("listUsers", users);

        if (message != null)
            request.setAttribute("message", message);

        String listPage = "users.jsp";
        request.getRequestDispatcher(listPage).forward(request, response);
    }

    public void listUser() throws ServletException, IOException {
        listUser(null);
    }

    public void save() throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Integer roleId = Integer.valueOf(request.getParameter("roleId"));

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

        Role role = getRole(roleId);

        User existUser = userRepo.findByEmail(email);

        if (existUser != null) {
            String message = "Email " + email + " đã tồn tại!!!";
            request.setAttribute("message", message);

            User user = new User(email, password, fullName, enabled, photos, role);
            request.setAttribute("user", user);

            String createPage = "user_form.jsp";
            request.getRequestDispatcher(createPage).forward(request, response);
        } else {
            User newUser = new User(email, password, fullName, enabled, photos, role);
            userRepo.save(newUser);

            String message = "Nhân viên " + fullName + " đã được thêm thành công !";
            listUser(message);
        }
    }

    public void editUser() throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = userRepo.findById(id);

        request.setAttribute("user", user);
        request.setAttribute("title", "Chỉnh sửa nhân viên (ID: " + id + ")");

        String editPage = "user_form.jsp";
        request.getRequestDispatcher(editPage).forward(request, response);
    }

    public void updateUser() throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Integer userId = Integer.valueOf(request.getParameter("userId"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Integer roleId = Integer.valueOf(request.getParameter("roleId"));

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

        Role role = getRole(roleId);

        User userById = userRepo.findById(userId);
        User userByEmail = userRepo.findByEmail(email);

        if (userByEmail != null && userByEmail.getUserId() != userById.getUserId()) {
            String message = "Email " + email + " đã tồn tại!!!";
            request.setAttribute("message", message);

            request.setAttribute("user", userById);
            request.setAttribute("title", "Chỉnh sửa nhân viên (ID: " + userById.getUserId() + ")");

            String createPage = "user_form.jsp";
            request.getRequestDispatcher(createPage).forward(request, response);
        } else {
            User user = new User(userId, email, password, fullName, enabled, photos, role);

            userRepo.update(user);

            String message = "Nhân viên " + fullName + " đã được cập nhật thành công !";
            listUser(message);
        }
    }
}
