package edu.nlu.ogani_jsp.service;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CategoryService {
    private HttpServletRequest request;
    private HttpServletResponse response;

    public CategoryService(HttpServletRequest request, HttpServletResponse response) {
        this.request = request;
        this.response = response;
    }

    public void listCategory(String message) throws ServletException, IOException {
        String listPage = "categories.jsp";
        request.setAttribute("message", message);
        request.getRequestDispatcher(listPage).forward(request, response);
    }

    public void listCategory() throws ServletException, IOException {
        listCategory(null);
    }
}
