package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Config;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.dao.MySQLAdsDao;
import com.codeup.adlister.dao.MySQLUsersDao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "controllers.UpdateAdServlet", urlPatterns = "/ads/update")
public class UpdateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long adId = Long.valueOf(request.getParameter("updatead"));
        Config config = new Config();
        Ad updatedAd = new MySQLAdsDao(config).getAdById(adId).get(0);
        request.getSession().setAttribute("title", updatedAd.getTitle());
        request.getSession().setAttribute("description", updatedAd.getDescription());
        request.getSession().setAttribute("updateadid", adId);
        request.getRequestDispatcher("/WEB-INF/ads/update-ad.jsp")
                .forward(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long adId = (Long) request.getSession().getAttribute("updateadid");
        System.out.println(adId);
        Config config = new Config();
        Ad updatedAd = new MySQLAdsDao(config).getAdById(adId).get(0);


        String updatedTitle = request.getParameter("update-title");
        if (updatedTitle == null || updatedTitle.length() == 0) {
            updatedTitle = (String) request.getSession().getAttribute("title");
        }
        String updatedDesc = request.getParameter("update-description");
        if (updatedDesc == null || updatedDesc.length() == 0) {
            updatedDesc = (String) request.getSession().getAttribute("description");
        }


        boolean inputHasErrors = updatedTitle.isEmpty()
                || updatedDesc.isEmpty();


        if (inputHasErrors) {
            response.sendRedirect("/ads/update");
            return;
        }
        DaoFactory.getAdsDao().updateAd(updatedAd, updatedTitle, updatedDesc);

        response.sendRedirect("/profile");

    }
}