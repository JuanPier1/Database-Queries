/* Práctica de SQL con Películas */
create database movies;

use movies;

create table directores(
idDirector int primary key auto_increment,
nombre varchar (50) not null,
nacionalidad varchar(50),
correo varchar(50)
);

insert into directores(
nombre, nacionalidad, correo)
values 
("Christopher Nollan", "Britanico", "chrisnollan@gmail.com"),
("Guillermo Del Toro", "Mexicano", "DelToro@gmail.com"),
("Tim Burton", "Estadounidense", "BurtonTim@gmail.com");

create table companias(
idCompania int primary key auto_increment,
nombre varchar(50),
fundacion year,
pais varchar(50)
);

insert into companias
(nombre, fundacion, pais)
values
("Disney", "1923", "EEUU"),
("Warner Bros", "1923", "EEUU"),
("Netflix","1997", "EEUU"),
("Estudios Picasso","1994", "España"),
("Anima Studios", "2002", "México");

create table peliculas(
idPelicula int primary key auto_increment,
titulo varchar(50) not null,
genero varchar(25),
estreno date,
duracion int default 0,
sinopsis varchar(100),
companiaPelicula int,
foreign key(companiaPelicula)
references companias(idCompania)
);

alter table peliculas
add constraint check_duracion
check(duracion > 59);

insert into peliculas(
titulo, genero, estreno, duracion, sinopsis, companiaPelicula)
values
("El laberinto del Fauno", "Fantasia", "2010-10-11", 119, "Película hispano-mexicana", 
(select idCompania from companias where nombre = "Estudios Picasso")),
("Oppenheimer", "Biografía épica", "2023-07-21", 180, "Película que narra la vida de J. Robert Oppenheimer",
(select idCompania from companias where nombre = "Warner Bros"));

create table pelicula_director(
pelicula int,
director int,
foreign key (Pelicula)
references peliculas(idPelicula),
foreign key (director)
references directores(idDirector)
);

insert into pelicula_director(pelicula, director)
values
(( select idPelicula from peliculas where titulo = "Oppenheimer"),
( select idDirector from directores where nombre = "Christopher Nollan")),
(( select idPelicula from peliculas where titulo = "El laberinto del Fauno"),
( select idDirector from directores where nombre = "Guillermo Del Toro"));


select
idDirector as ID,
nombre as Director,
nacionalidad as Nacionalidad,
correo as Correo
from directores;

select
idCompania as ID,
nombre as Compañía,
fundacion as "Fecha Fundación",
pais as País
from companias;

select
idPelicula as ID,
titulo as "Título de la Película",
genero as Genero,
estreno as "Fecha Estreno",
TIME_FORMAT(SEC_TO_TIME(duracion * 60), '%H:%i') as Duración,
sinopsis as Sinopsis,
c.nombre as Compañia
from peliculas p
join companias c on companiaPelicula = idCompania;

select
p.titulo as Película,
d.nombre as Director
from pelicula_director pd
join peliculas p on pelicula = idPelicula
join directores d on director = idDirector;


