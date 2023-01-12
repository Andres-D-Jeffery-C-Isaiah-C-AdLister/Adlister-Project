package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Validate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //Removal of msg state (error msg) if the user returns to this page again
        request.getSession().removeAttribute("msg");

        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        User CheckUser = DaoFactory.getUsersDao().findByUsername(username);
        boolean inputHasErrors = username.isEmpty()
                || email.isEmpty()
                || (!Validate.checkValidEmail(email))
                || password.isEmpty()
                || (!password.equals(passwordConfirmation));
        // validate input
        if (CheckUser == null) {
            //Run this if/else statement if no pre-existing user is found
            try {
                if (!inputHasErrors) {
                    //If the form entries have no errors, build the new user, and push to the database. Then set the user
                    //attribute and redirect to the profile page
                    User user = new User(username, email, password);
                    DaoFactory.getUsersDao().insert(user);
                    User userRecheck = DaoFactory.getUsersDao().findByUsername(username);
                    request.getSession().setAttribute("user", userRecheck);
                    request.getSession().setAttribute("userId", userRecheck.getId());
                    response.sendRedirect("/login");
                } else {
                    //If the user inputs have an error, reload the page with an error msg
                    String msg = "Sorry, the entered passwords do not match.";
                    request.getSession().setAttribute("msg", msg);

                    request.getSession().setAttribute("email", email);
                    request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                }
            } catch (Exception e) {
                String msg = "Sorry, the email address is already in use.";
                request.getSession().setAttribute("msg", msg);

                request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
            }
        } else {
            //If a preexisting user is found to already exist, run this else statement which
            //reloads the page with the error msg
            String msg = "Sorry, this username is not available";
            request.getSession().setAttribute("msg", msg);

            request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
        }
    }
}
