package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Config;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.dao.MySQLUsersDao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "controllers.SingleAdServlet", urlPatterns = "/ads/ad-details")
public class SingleAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String adId = request.getParameter("ad.id");
        System.out.println(adId);
        Config config = new Config();
        Ad newAd = new MySQLAdsDao(config).getAdById(Long.parseLong(adId)).get(0);
        String title = newAd.getTitle();
        String description = newAd.getDescription();
        String ad_id = String.valueOf(newAd.getId());

        Long user_id = newAd.getUserId();
        User adCreator = new MySQLUsersDao(config).findById(user_id);
        String adCreatorUsername = adCreator.getUsername();

        request.setAttribute("title", title);
        request.setAttribute("getUserId", adCreatorUsername);
        request.setAttribute("getDescription", description);
        request.setAttribute("ad_id", ad_id);

        request.getRequestDispatcher("/WEB-INF/ads/single-ad.jsp").forward(request, response);
    }
}

