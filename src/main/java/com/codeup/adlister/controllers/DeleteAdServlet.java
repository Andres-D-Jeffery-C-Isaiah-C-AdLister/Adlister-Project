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

@WebServlet(name = "controllers.DeleteAdServlet", urlPatterns = "/ads/delete-ad")
public class DeleteAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long adId = Long.valueOf(request.getParameter("deletead"));
        System.out.println(adId);
        Config config = new Config();
        Ad deleteAd = new MySQLAdsDao(config).getAdById(adId).get(0);
         DaoFactory.getAdsDao().delete(deleteAd);


        response.sendRedirect("/profile");
    }
}