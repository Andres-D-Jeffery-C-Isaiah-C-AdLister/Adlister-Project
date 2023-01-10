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
import java.util.List;

@WebServlet(name = "controllers.SearchAdsServlet", urlPatterns = "/search")
public class SearchAdsServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userSearch = request.getParameter("search").trim();
        if (userSearch.length() > 0){
            String userSearchWildcards = "%" + userSearch + "%";
            Config config = new Config();
            List<Ad> searchAdsMatch = new MySQLAdsDao(config).searchAds(userSearchWildcards);
            request.setAttribute("searchAds", searchAdsMatch);
        } else {
            request.setAttribute("searchAds", DaoFactory.getAdsDao().all());
        }
        request.getRequestDispatcher("/ads").forward(request, response);
    }
}
