package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Config;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        Long userId = (Long) request.getSession().getAttribute("userId");
        Config config = new Config();
        List<Ad> userAds = new MySQLAdsDao(config).userAds(userId);
        String html = "";
        for (int i = 0; i < userAds.size(); i++){
            html += "<h2> Ad ID: " + userAds.get(i).getId() + "</h2>" +
                    "<h2> Ad Title" + userAds.get(i).getTitle() + "</h2>" +
                    "<h2> Ad Description" + userAds.get(i).getDescription() + "</h2><br>";
        }

        request.setAttribute("userAds", (String) html);

        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }
}




