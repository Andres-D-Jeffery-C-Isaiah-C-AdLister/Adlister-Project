package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import org.mindrot.jbcrypt.BCrypt;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //removal of msg state (error msg) if the user returns to this page again
        request.getSession().removeAttribute("msg");
        request.getSession().removeAttribute("username");
        if (request.getSession().getAttribute("user") != null) {
            response.sendRedirect("/profile");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        User user = DaoFactory.getUsersDao().findByUsername(username);

        //error messages are different if the user is found vs not found.
        if (user != null) {
            //created a boolean that sets true if the user's entered password and found user's hashed password match
            boolean validAttempt = BCrypt.checkpw(password, user.getPassword());
            //if a user is found by the above if statement and passwords match, send to /profile
            if (validAttempt) {
                request.getSession().setAttribute("user", user);
                request.getSession().setAttribute("userId", user.getId());
                response.sendRedirect("/profile");
            } else {
                //if the password it wrong, we reload the page with this error msg
                String msg = "Sorry, your password is incorrect. Please try again.";
                request.getSession().setAttribute("msg", msg);
                request.getSession().setAttribute("username", username);
                request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
            }

        } else {
            //if the entered user is not found, we reload page with this error page.
            String msg = "Sorry, this user is not yet registered.";
            request.getSession().setAttribute("msg", msg);
            request.getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
        }
    }
}
