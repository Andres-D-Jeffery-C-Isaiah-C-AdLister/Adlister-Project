use adlister_db;

# inserting users
INSERT INTO users (username, email, password)
VALUES ('joe','joe@gmail.com','123'),
       ('jill','jill@gmail.com','123');

select * from users;

# inserting ads
INSERT INTO ads (user_id, title, description)
VALUES (1,'silk rug', 'new'),
       (1,'cashmere', 'used'),
       (2,'wool','old');

select * from ads;

# inserting categories
INSERT INTO categories (category_description)
VALUES ('wool'),('silk'),('cotton');

describe categories;
select * from categories;


INSERT INTO ads_and_categories (category_id, ad_id)
VALUES (2, 1),
       (1, 3);
select * from ads_and_categories;


select * from users;
select * from ads;