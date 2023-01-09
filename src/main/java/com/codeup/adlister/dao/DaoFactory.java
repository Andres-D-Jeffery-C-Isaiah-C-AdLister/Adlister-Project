package com.codeup.adlister.dao;



public class DaoFactory {
    private static Ads adsDao;
    private static Users usersDao;

    public static Ads getAdsDao() {
         Config config = new Config();
        if (adsDao == null) {
            adsDao = new MySQLAdsDao(config);
        }
        return adsDao;
    }

    public static Users getUsersDao() {
        if (usersDao == null) {
            usersDao = new MySQLUsersDao();
        }
        return usersDao;
    }
}
