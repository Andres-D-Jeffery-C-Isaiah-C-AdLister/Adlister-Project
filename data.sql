use adlister_db;

DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS ads;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS ads_and_categories;

use adlister_db;

# select * from users;
# DELETE FROM users WHERE id = 1;
# select * from users;

# inserting users
INSERT INTO users (id, username, email, password)
VALUES (1,'joe','joe@gmail.com','123'),
       (2,'jill','jill@gmail.com','123');

select * from users;

# inserting ads
INSERT INTO ads (id, user_id, title, description)
VALUES (1,1,'silk rug', 'new'),
       (2,1,'cashmere', 'used');

INSERT INTO ads (id, user_id, title, description)
VALUES (3,2,'wool','old');

describe ads;
select * from ads;

# inserting categories
INSERT INTO categories (category_description)
VALUES ('wool'),('silk'),('cotton');

describe categories;
select * from categories;


describe ads_and_categories;
select * from ads_and_categories;
