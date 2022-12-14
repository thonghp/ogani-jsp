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

        boolean enabled = !(request.getParameter("enabled") == null);

        String photos;
        if (request.getParameter("photos").isEmpty()) {
            photos = null;
        } else {
            photos = request.getParameter("photos");
        }

        Role role = getRole(roleId);

        User existUser = userRepo.findByEmail(email);

        if (existUser != null) {
            String message = "Email " + email + " ???? t???n t???i!!!";
            request.setAttribute("message", message);

            User user = new User(email, password, fullName, enabled, photos, role);
            request.setAttribute("user", user);

            String createPage = "user_form.jsp";
            request.getRequestDispatcher(createPage).forward(request, response);
        } else {
            User newUser = new User(email, password, fullName, enabled, photos, role);
            userRepo.save(newUser);

            String message = "Nh??n vi??n " + fullName + " ???? ???????c th??m th??nh c??ng !";
            listUser(message);
        }
    }

    public void editUser() throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = userRepo.findById(id);

        String message;
        if (id == 1 || id == 2) {
            message = "????y l?? t??i kho???n admin kh??ng th??? ch???nh s???a.";
            request.setAttribute("message", message);
            listUser(message);

            return;
        }

        if (user == null) {
            message = "Kh??ng t??m th???y nh??n vi??n c?? id l?? " + id;
            listUser(message);
        } else {
            request.setAttribute("user", user);
            request.setAttribute("title", "Ch???nh s???a nh??n vi??n (ID: " + id + ")");

            String editPage = "user_form.jsp";
            request.getRequestDispatcher(editPage).forward(request, response);
        }
    }

    public void updateUser() throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Integer userId = Integer.valueOf(request.getParameter("userId"));
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Integer roleId = Integer.valueOf(request.getParameter("roleId"));

        boolean enabled = !(request.getParameter("enabled") == null);

        String photos;
        if (request.getParameter("photos").isEmpty()) {
            photos = null;
        } else {
            photos = request.getParameter("photos");
        }

        Role role = getRole(roleId);

        User userById = userRepo.findById(userId);
        User userByEmail = userRepo.findByEmail(email);

        String message;
        if (userByEmail != null && userByEmail.getUserId() != userById.getUserId()) {
            message = "Email " + email + " ???? t???n t???i!!!";
            request.setAttribute("message", message);

            request.setAttribute("user", userById);
            request.setAttribute("title", "Ch???nh s???a nh??n vi??n (ID: " + userById.getUserId() + ")");

            String updatePage = "user_form.jsp";
            request.getRequestDispatcher(updatePage).forward(request, response);
        } else {
            User user = new User(userId, email, password, fullName, enabled, photos, role);

            userRepo.update(user);

            message = "Nh??n vi??n " + fullName + " ???? ???????c c???p nh???t th??nh c??ng !";
            listUser(message);
        }
    }

    public void deleteUser() throws ServletException, IOException {
        Integer id = Integer.valueOf(request.getParameter("id"));
        User user = userRepo.findById(id);

        String message;

        if (id == 1 || id == 2) {
            message = "????y l?? t??i kho???n admin kh??ng th??? x??a.";
            request.setAttribute("message", message);
            listUser(message);

            return;
        }

        if (user == null) {
            message = "Kh??ng t??m th???y nh??n vi??n c?? id l?? " + id + " ho???c n?? c?? th??? ???? b??? x??a !";
        } else {
            userRepo.delete(id);
            message = "Nh??n vi??n c?? id l?? " + id + " ???? ???????c x??a th??nh c??ng !";
        }

        listUser(message);
    }
}
