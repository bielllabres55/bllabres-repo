drop database if exists rpg;
create database rpg charset utf8;
use rpg;

create table `User` (
	id int not null auto_increment,
	name varchar(100) not null,
	password varchar(100) not null,
	primary key (id)
);

create table Carta (
    id int not null auto_increment,
    name varchar(50) not null,
    race int not null,
    str int not null,
    modStr int not null,
    dex int not null,
    modDex int not null,
    con int not null,
    modCon int not null,
    intel int not null,
    modIntel int not null,
    sab int not null,
    modSab int not null,
    car int not null,
    modCar int not null,
    pv int not null,
    pm int not null,
    user_id int not null,
    primary key (id),
    foreign key (user_id) references `User`(id)
);
