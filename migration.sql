
# DROP TABLE IF EXISTS ads_and_categories;
# DROP TABLE IF EXISTS ads;
# DROP TABLE IF EXISTS users;
# DROP TABLE IF EXISTS categories;
# USE adlister_db;
#
# select * from ads;
#
# DROP TABLE IF EXISTS ads;
# DROP TABLE IF EXISTS users;

CREATE TABLE users (
                       id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                       username VARCHAR(240) NOT NULL,
                       email VARCHAR(240) NOT NULL,
                       password VARCHAR(255) NOT NULL,
                       PRIMARY KEY (id)
);

CREATE TABLE ads (
                     id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                     user_id INT UNSIGNED NOT NULL,
                     title VARCHAR(240) NOT NULL,
                     description TEXT NOT NULL,
                     PRIMARY KEY (id),
                     FOREIGN KEY (user_id) REFERENCES users(id)
                         ON DELETE CASCADE
);

CREATE TABLE categories (
                            category_id INT UNSIGNED NOT NULL AUTO_INCREMENT,
                            category_description VARCHAR(240) NOT NULL,
                            PRIMARY KEY (category_id)
);
CREATE TABLE ads_and_categories (
                                    category_id INT UNSIGNED NOT NULL,
                                    ad_id INT UNSIGNED NOT NULL,
                                    FOREIGN KEY (category_id) REFERENCES categories(category_id)
                                        ON DELETE CASCADE,
                                    FOREIGN KEY (ad_id) REFERENCES ads(id)
                                        ON DELETE CASCADE
);

show tables;


