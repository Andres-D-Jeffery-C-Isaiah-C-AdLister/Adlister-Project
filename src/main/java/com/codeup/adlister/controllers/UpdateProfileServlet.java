package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Config;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLUsersDao;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "controllers.UpdateProfileServlet", urlPatterns = "/profile/update")
public class UpdateProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long userId = (Long) request.getSession().getAttribute("userId");
        Config config = new Config();
        User user = new MySQLUsersDao(config).findById(userId);
        request.getSession().setAttribute("username", user.getUsername());
        request.getSession().setAttribute("email", user.getEmail());
        request.getRequestDispatcher("/WEB-INF/update-profile.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long userId = (Long) request.getSession().getAttribute("userId");
        Config config = new Config();
        User user = new MySQLUsersDao(config).findById(userId);
        String username = request.getParameter("username").trim();
        if (username.length() == 0){
            username = (String) request.getSession().getAttribute("username");
        }
        String email = request.getParameter("email").trim();
        if (email.length() == 0){
            email = (String) request.getSession().getAttribute("email");
        }
        String password = request.getParameter("password").trim();
        if (password.length() == 0){
            password = user.getPassword();
        }
        String passwordConfirmation = request.getParameter("confirm_password").trim();
        if (passwordConfirmation.length() == 0){
            passwordConfirmation = user.getPassword();
        }

        User checkUser = DaoFactory.getUsersDao().findByUsername(username);

        // validate input
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || password.isEmpty()
                || (! password.equals(passwordConfirmation)
                || checkUser != null);

        if (inputHasErrors) {
            response.sendRedirect("/profile/update");
            return;
        }

        // create and save a new user
        User updateUser = new User(userId, username, email, Password.hash(password));
        DaoFactory.getUsersDao().updateUser(updateUser);
        response.sendRedirect("/profile/update");
    }

}
