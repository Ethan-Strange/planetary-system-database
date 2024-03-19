CREATE DATABASE IF NOT EXISTS PLANETARY_SYSTEM;
use planetary_system;
create table planet(
id int primary key,
name varchar(50) not null,
orbital_radius int not null,
detection_method varchar(50) not null,
no_of_moon int not null,
distance int not null);

create table solar_system(
id int primary key,
no_of_planet int not null,
distance int not null);

create table constellation(
name varchar(50) primary key,
no_of_star int not null);
create table star(
id int primary key,
name varchar(50) not null,
type varchar(50) not null,
age int not null,
constellation_name varchar(50) not null,
constraint foreign key(constellation_name) references constellation(name)
on update cascade on delete cascade);


 create table galaxy(
 id int primary key,
 type varchar(30) not null,
 name varchar(50) not null,
 diameter int not null,
 distance int not null);
 
 
 create table resources(
 id int primary key,
 name varchar(30) not null,
 symbol varchar(10) not null,
 atomic_number int not null);
 
 create table black_hole(
 id int primary key,
 gravitational_pull int not null,
 size int not null,
 age int not null);
 
 create table galaxy_planet_relation(
 planet_id int not null,
 galaxy_id int not null,
 constraint foreign key(planet_id) references planet(id) on update cascade on delete cascade,
 foreign key(galaxy_id) references galaxy(id) on update cascade on delete cascade);
 
 create table galaxy_star_relation(
 star_id int not null,
 galaxy_id int not null,
 constraint foreign key(star_id) references star(id) on update cascade on delete cascade,
 foreign key(galaxy_id) references galaxy(id) on update cascade on delete cascade);
 
 create table galaxy_solar_system_relation(
 solar_system_id int not null,
 galaxy_id int not null,
 constraint foreign key(solar_system_id) references solar_system(id) on update cascade on delete cascade,
 foreign key(galaxy_id) references galaxy(id) on update cascade on delete cascade);
 
 create table galaxy_black_hole_relation(
 black_hole_id int not null,
 galaxy_id int not null,
 constraint foreign key(black_hole_id) references black_hole(id) on update cascade on delete cascade,
 foreign key(galaxy_id) references galaxy(id) on update cascade on delete cascade);
 
 create table solar_system_planet_relation(
 planet_id int not null,
 solar_system_id int not null,
 constraint foreign key(planet_id) references planet(id) on update cascade on delete cascade,
 foreign key(solar_system_id) references solar_system(id) on update cascade on delete cascade);
 
 create table solar_system_star_relation(
 star_id int not null,
 solar_system_id int not null,
 constraint foreign key(star_id) references star(id) on update cascade on delete cascade,
 foreign key(solar_system_id) references solar_system(id) on update cascade on delete cascade);
 create table planet_resource_relation(
 planet_id int not null,
 resource_id int not null,
 constraint foreign key(planet_id) references planet(id) on update cascade on delete cascade,
 foreign key(resource_id) references resources(id) on update cascade on delete cascade);
 
 
 



