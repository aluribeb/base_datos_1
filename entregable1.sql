-- USERS

create table users (
	id  serial primary key,
	first_name varchar(50),
	last_name varchar(50),
	email varchar(100)
);

insert into users (first_name, last_name, email) values
('Cabito', 'Uribe', 'cabo@gmail.com'),
('Camila', 'Flores', 'hola@gmail.com'),
('Juan', 'Espinosa', 'juan@gmail.com');

-- POSTS

create table posts (
	id serial primary key, 
	creator_id int references users(id),
	title varchar(100),
	text varchar(500)
);

insert into posts (creator_id, title, text) values
(1, 'Titulo1', 'Loremp Ipsum1'),
(2, 'Titulo2', 'Loremp Ipsum2'),
(3, 'Titulo3', 'Loremp Ipsum3'),
(1, 'Titulo4', 'Loremp Ipsum4'),
(2, 'Titulo5', 'Loremp Ipsum5');

-- LIKES

create table likes (
	id serial primary key, 
	user_id int references users(id),
	post_id int references posts(id)
);

insert into likes (user_id, post_id) values
(1, 2),
(2, 1),
(1, 3),
(3, 1),
(2, 5);

-- las visualizaciones, traer todos los posts y la info del usuario del campo creator_id
select * from posts inner join users
on posts.id = posts.creator_id;

-- las visualizaciones 2, Trae todos los posts, con la información de los usuarios que les dieron like.
select * from posts inner join likes
on posts.id = likes.user_id inner join users
on users.id = likes.user_id;

