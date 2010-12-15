
create table category(
    categoryid VARCHAR(10) NOT NULL,
    name VARCHAR(25) NOT NULL,
    description VARCHAR(255) NOT NULL,
    imageurl VARCHAR(55),
    primary key (categoryid)
);

CREATE TABLE product (
 productid VARCHAR(10) NOT NULL,
 categoryid VARCHAR(10) NOT NULL,
 name VARCHAR(25) NOT NULL,
 description VARCHAR(255) NOT NULL,
 imageurl VARCHAR(55),
 primary key (productid),
 foreign key (categoryid) references category(categoryid)
);

CREATE TABLE Address (
 addressid VARCHAR(10) NOT NULL,
 street1 VARCHAR(55) NOT NULL,
 street2 VARCHAR(55),
 city VARCHAR(55) NOT NULL,
 state VARCHAR(25) NOT NULL,
 zip VARCHAR(5) NOT NULL,
 latitude DECIMAL(14,10) NOT NULL,
 longitude DECIMAL(14,10) NOT NULL,
 primary key (addressid)
);

CREATE TABLE SellerContactInfo (
 contactinfoid VARCHAR(10) NOT NULL,
 lastname VARCHAR(24) NOT NULL,
 firstname VARCHAR(24) NOT NULL,
 email VARCHAR(24) NOT NULL,
 primary key (contactinfoid)
);

CREATE TABLE item (
 itemid VARCHAR(10) NOT NULL,
 productid VARCHAR(10) NOT NULL,
 name VARCHAR(30) NOT NULL,
 description VARCHAR(500) NOT NULL,
 imageurl VARCHAR(55),
 imagethumburl VARCHAR(55),
 price DECIMAL(14,2) NOT NULL,
 address_addressid VARCHAR(10) NOT NULL,
 contactinfo_contactinfoid VARCHAR(10) NOT NULL,
 totalscore INTEGER NOT NULL,
 numberofvotes INTEGER NOT NULL,
 disabled INTEGER NOT NULL,
 primary key (itemid),
 foreign key (address_addressid) references Address(addressid),
 foreign key (productid) references product(productid),
 foreign key (contactinfo_contactinfoid) references SellerContactInfo(contactinfoid)
);

CREATE TABLE id_gen (
 gen_key VARCHAR(20) NOT NULL,
 gen_value INTEGER NOT NULL,
 primary key (gen_key)
);

CREATE TABLE ziplocation (
 zipcode INTEGER NOT NULL,
 city VARCHAR(30) NOT NULL,
 state VARCHAR(2) NOT NULL,
 primary key (zipcode)
);


create table tag(
    tagid INTEGER NOT NULL,
    tag VARCHAR(30) NOT NULL,
    refcount INTEGER NOT NULL,
    primary key (tagid),
    unique(tag)
);


create table tag_item(
    tagid INTEGER NOT NULL,
    itemid VARCHAR(10) NOT NULL,
    unique(tagid, itemid),
    foreign key (itemid) references item(itemid),
    foreign key (tagid) references tag(tagid)
);


INSERT INTO category VALUES('FORD', 'FORDCARS', 'Loving and finicky friends', 'cats_icon.gif');
INSERT INTO category VALUES('TOYOTA', 'TOYOTACARS', 'Loving and furry friends', 'dogs_icon.gif');
INSERT INTO category VALUES('AUDI/BMW', 'AUDI/BMWCARS', 'Loving and feathery friends', 'birds_icon.gif');
INSERT INTO category VALUES('JEEPS', 'JEEPCARS', 'Loving and scaly friends', 'reptiles_icon.gif');
INSERT INTO category VALUES('MERCEDES', 'MERCEDESBENZ', 'Loving aquatic friends', 'fish_icon.gif');

INSERT INTO product VALUES('feline01', 'FORD', 'ford sport', 'Great for reducing mouse populations', 'cat1.gif');
INSERT INTO product VALUES('feline02', 'FORD', 'ford family', 'Friendly house cat keeps you away from the vacuum', 'cat2.gif');
INSERT INTO product VALUES('canine01', 'TOYOTA', 'Toyota utility', 'Friendly dog from England', 'dog1.gif');
INSERT INTO product VALUES('canine02', 'TOYOTA', 'Toyota sport', 'Great companion dog to sit on your lap','dog2.gif');
INSERT INTO product VALUES('avian01', 'AUDI/BMW', 'AUDI', 'Friend for a lifetime.', 'bird1.gif');
INSERT INTO product VALUES('avian02', 'AUDI/BMW', 'BMW', 'Impress your friends with your colorful friend.','bird2.gif');
INSERT INTO product VALUES('fish01', 'MERCEDES', 'benz c class', 'Fits nicely in a small aquarium.','fish2.gif');
INSERT INTO product VALUES('fish02', 'MERCEDES', 'benz sport', 'Need a large aquarium.','fish3.gif');
INSERT INTO product VALUES('reptile01', 'JEEPS', 'jeep sport', 'Slides across the floor.','lizard1.gif');
INSERT INTO product VALUES('reptile02', 'JEEPS', 'jeep utility', 'Uses legs to move fast.','lizard2.gif');


--INSERT INTO Address VALUES('1', 'valhallavägan', '', 'Karlskrona','sweden','37141',56.181044,15.595773);
INSERT INTO Address VALUES('3', 'River Oaks Pky & Village Center Dr', '', 'San Jose','CA','95134',37.398259,-121.922367);
INSERT INTO Address VALUES('2','Galgamarken', '','Karlskrona', 'Sweden','37030',56.183101,15.601417);
INSERT INTO Address VALUES('4', 'S 1st St & W Santa Clara St', '', 'San Jose','CA','95113',37.336141,-121.890666);
INSERT INTO Address VALUES('5', '1st St & Market St ', '', 'San Francisco','CA','94105',37.791028,-122.399082);
INSERT INTO Address VALUES('6', 'Paseo Padre Pky & Fremont Blvd', '', 'Fremont','CA','94555',37.575035,-122.041273);
INSERT INTO Address VALUES('7', 'W el Camino Real & S Mary Ave', '', 'Sunnyvale','CA','94087',37.371641,-122.048772);
INSERT INTO Address VALUES('8', 'Bay Street and Columbus Ave ', '', 'San Francisco','CA','94133',37.805328,-122.416882);
INSERT INTO Address VALUES('9', 'El Camino Real & Scott Blvd', '', 'Santa Clara','CA','95050',37.352141 ,-121.959569);
INSERT INTO Address VALUES('10', 'W el Camino Real & Hollenbeck Ave', '', 'Sunnyvale','CA','94087',37.369941,-122.041271);
INSERT INTO Address VALUES('11', 'S Main St & Serra Way', '', 'Milpitas','CA','95035',37.428112,-121.906505);
INSERT INTO Address VALUES('12', 'Great Mall Pky & S Main St', '', 'Milpitas','CA','95035',37.414722,-121.902085);
INSERT INTO Address VALUES('13', 'Valencia St &  16th St', '', 'San Francisco','CA','94103',37.764985,-122.421886);
INSERT INTO Address VALUES('14', 'S 1st St & W Santa Clara St', '', 'San Jose','CA','95113',37.336141,-121.890666);
INSERT INTO Address VALUES('15', 'Bay Street and Columbus Ave ', '', 'San Francisco','CA','94133',37.805328,-122.416882);
INSERT INTO Address VALUES('16', 'El Camino Real & Scott Blvd', '', 'Santa Clara','CA','95050',37.352141 ,-121.959569);
INSERT INTO Address VALUES('17', 'Millbrae Ave &  Willow Ave', '', 'Millbrae ','CA','94030',37.596635,-122.391083);
INSERT INTO Address VALUES('18', 'Leavesley Rd & Monterey Rd', '', 'Gilroy','CA','95020',37.019447,-121.574953);
INSERT INTO Address VALUES('19', 'S Main St & Serra Way', '', 'Milpitas','CA','95035',37.428112,-121.906505);
INSERT INTO Address VALUES('20', '24th St &  Dolores St', '', 'San Francisco','CA','94114',37.75183,-122.424982);
INSERT INTO Address VALUES('21', 'Great Mall Pky & S Main St', '', 'Milpitas','CA','95035',37.414722,-121.902085);
INSERT INTO Address VALUES('22', 'Grant Rd & South Dr ', '', 'Mountain view','CA','94040',37.366941,-122.078073);
INSERT INTO Address VALUES('23', '25th St &  Dolores St', '', 'San Francisco','CA','94114',37.75013,-122.424782);
INSERT INTO Address VALUES('24', 'Ellis St & National Ave', '', 'Mountain view','CA','94043',37.40094,-122.052272);
INSERT INTO Address VALUES('25', '1st St & Market St ', '', 'San Francisco','CA','94105',37.791028,-122.399082);
INSERT INTO Address VALUES('26', 'San Antonio Rd & Middlefield Rd', '', 'Palo Alto','CA','94303',37.416239,-122.103474);
INSERT INTO Address VALUES('27', '20th St &  Dolores St', '', 'San Francisco','CA','94114',37.75823,-122.425582);
INSERT INTO Address VALUES('28', 'River Oaks Pky & Village Center Dr', '', 'San Jose','CA','95134',37.398259,-121.922367);
INSERT INTO Address VALUES('29', 'Dolores St &  San Jose Ave', '', 'San Francisco','CA','94110',37.74023,-122.423782);
INSERT INTO Address VALUES('30', 'Leavesley Rd & Monterey Rd', '', 'Gilroy','CA','95020',37.019447,-121.574953);
INSERT INTO Address VALUES('31', 'Palm Dr & Arboretum Rd', '', 'Stanford','CA','94305',37.437838,-122.166975);
INSERT INTO Address VALUES('32', 'Millbrae Ave &  Willow Ave', '', 'Millbrae ','CA','94030',37.596635,-122.391083);
INSERT INTO Address VALUES('33', 'Cesar Chavez St & Sanchez', '', 'San Francisco','CA','94131',37.74753,-122.428982);
INSERT INTO Address VALUES('34', 'University Ave & Middlefield Rd', '', 'Palo Alto','CA','94301',37.450638,-122.156975);
INSERT INTO Address VALUES('35', 'Bay Street and Columbus Ave ', '', 'San Francisco','CA','94133',37.805328,-122.416882);
INSERT INTO Address VALUES('36', 'Telegraph Ave & Bancroft Way', '', 'Berkeley','CA','94704',37.868825,-122.25978);
INSERT INTO Address VALUES('37', '1st St & Market St ', '', 'San Francisco','CA','94105',37.791028,-122.399082);
INSERT INTO Address VALUES('38', 'San Antonio Rd & Middlefield Rd', '', 'Palo Alto','CA','94303',37.416239,-122.103474);
INSERT INTO Address VALUES('39', '20th St &  Dolores St', '', 'San Francisco','CA','94114',37.75823,-122.425582);
INSERT INTO Address VALUES('40', 'River Oaks Pky & Village Center Dr', '', 'San Jose','CA','95134',37.398259,-121.922367);
INSERT INTO Address VALUES('41', 'Dolores St &  San Jose Ave', '', 'San Francisco','CA','94110',37.74023,-122.423782);
INSERT INTO Address VALUES('42', '4th St & Howard St', '', 'San Francisco','CA','94103',37.783229,-122.402582);
INSERT INTO Address VALUES('43', 'Palm Dr & Arboretum Rd', '', 'Stanford','CA','94305',37.437838,-122.166975);
INSERT INTO Address VALUES('44', 'Campbell St & Riverside Ave', '', 'Santa Cruz','CA','95060',36.96985,-122.019473);
INSERT INTO Address VALUES('45', 'Cesar Chavez St & Sanchez', '', 'San Francisco','CA','94131',37.74753,-122.428982);
INSERT INTO Address VALUES('46', 'University Ave & Middlefield Rd', '', 'Palo Alto','CA','94301',37.450638,-122.156975);
INSERT INTO Address VALUES('47', 'W el Camino Real & S Mary Ave', '', 'Sunnyvale','CA','94087',37.371641,-122.048772);
INSERT INTO Address VALUES('48', 'Telegraph Ave & Bancroft Way', '', 'Berkeley','CA','94704',37.868825,-122.25978);
INSERT INTO Address VALUES('49', '1st St & Market St ', '', 'San Francisco','CA','94105',37.791028,-122.399082);
INSERT INTO Address VALUES('50', 'San Antonio Rd & Middlefield Rd', '', 'Palo Alto','CA','94303',37.416239,-122.103474);
INSERT INTO Address VALUES('51', '20th St &  Dolores St', '', 'San Francisco','CA','94114',37.75823,-122.425582);
INSERT INTO Address VALUES('52', 'River Oaks Pky & Village Center Dr', '', 'San Jose','CA','95134',37.398259,-121.922367);
INSERT INTO Address VALUES('53', 'Dolores St &  San Jose Ave', '', 'San Francisco','CA','94110',37.74023,-122.423782);
INSERT INTO Address VALUES('54', '4th St & Howard St', '', 'San Francisco','CA','94103',37.783229,-122.402582);
INSERT INTO Address VALUES('55', 'Palm Dr & Arboretum Rd', '', 'Stanford','CA','94305',37.437838,-122.166975);
INSERT INTO Address VALUES('56', 'W el Camino Real & S Mary Ave', '', 'Sunnyvale','CA','94087',37.371641,-122.048772);
INSERT INTO Address VALUES('57', 'Campbell St & Riverside Ave', '', 'Santa Cruz','CA','95060',36.96985,-122.019473);
INSERT INTO Address VALUES('58', 'University Ave & Middlefield Rd', '', 'Palo Alto','CA','94301',37.450638,-122.156975);
INSERT INTO Address VALUES('59', 'Bay Street and Columbus Ave ', '', 'San Francisco','CA','94133',37.805328,-122.416882);
INSERT INTO Address VALUES('60', 'Telegraph Ave & Bancroft Way', '', 'Berkeley','CA','94704',37.868825,-122.25978);
INSERT INTO Address VALUES('61', 'San Antonio Rd & Middlefield Rd', '', 'Palo Alto','CA','94303',37.416239,-122.103474);
INSERT INTO Address VALUES('62', '20th St &  Dolores St', '', 'San Francisco','CA','94114',37.75823,-122.425582);
INSERT INTO Address VALUES('63', 'River Oaks Pky & Village Center Dr', '', 'San Jose','CA','95134',37.398259,-121.922367);
INSERT INTO Address VALUES('64', 'Dolores St &  San Jose Ave', '', 'San Francisco','CA','94110',37.74023,-122.423782);
INSERT INTO Address VALUES('65', 'W el Camino Real & S Mary Ave', '', 'Sunnyvale','CA','94087',37.371641,-122.048772);
INSERT INTO Address VALUES('66', 'Palm Dr & Arboretum Rd', '', 'Stanford','CA','94305',37.437838,-122.166975);
INSERT INTO Address VALUES('67', 'Millbrae Ave &  Willow Ave', '', 'Millbrae ','CA','94030',37.596635,-122.391083);
INSERT INTO Address VALUES('68', 'Cesar Chavez St & Sanchez', '', 'San Francisco','CA','94131',37.74753,-122.428982);
INSERT INTO Address VALUES('69', 'University Ave & Middlefield Rd', '', 'Palo Alto','CA','94301',37.450638,-122.156975);
INSERT INTO Address VALUES('70', 'Bay Street and Columbus Ave ', '', 'San Francisco','CA','94133',37.805328,-122.416882);
INSERT INTO Address VALUES('71', 'Leavesley Rd & Monterey Rd', '', 'Gilroy','CA','95020',37.019447,-121.574953);
INSERT INTO Address VALUES('72', 'Campbell St & Riverside Ave', '', 'Santa Cruz','CA','95060',36.96985,-122.019473);
INSERT INTO Address VALUES('73', '20th St &  Dolores St', '', 'San Francisco','CA','94114',37.75823,-122.425582);
INSERT INTO Address VALUES('74', 'River Oaks Pky & Village Center Dr', '', 'San Jose','CA','95134',37.398259,-121.922367);
INSERT INTO Address VALUES('75', 'Dolores St &  San Jose Ave', '', 'San Francisco','CA','94110',37.74023,-122.423782);
INSERT INTO Address VALUES('76', '4th St & Howard St', '', 'San Francisco','CA','94103',37.783229,-122.402582);
INSERT INTO Address VALUES('77', 'Palm Dr & Arboretum Rd', '', 'Stanford','CA','94305',37.437838,-122.166975);
INSERT INTO Address VALUES('78', 'Millbrae Ave &  Willow Ave', '', 'Millbrae ','CA','94030',37.596635,-122.391083);
INSERT INTO Address VALUES('79', 'Campbell St & Riverside Ave', '', 'Santa Cruz','CA','95060',36.96985,-122.019473);
INSERT INTO Address VALUES('80', 'University Ave & Middlefield Rd', '', 'Palo Alto','CA','94301',37.450638,-122.156975);
INSERT INTO Address VALUES('81', 'Grant Rd & South Dr ', '', 'Mountain view','CA','94040',37.366941,-122.078073);
INSERT INTO Address VALUES('82', 'Telegraph Ave & Bancroft Way', '', 'Berkeley','CA','94704',37.868825,-122.25978);
INSERT INTO Address VALUES('83', 'San Antonio Rd & Middlefield Rd', '', 'Palo Alto','CA','94303',37.416239,-122.103474);
INSERT INTO Address VALUES('84', '20th St &  Dolores St', '', 'San Francisco','CA','94114',37.75823,-122.425582);
INSERT INTO Address VALUES('85', 'River Oaks Pky & Village Center Dr', '', 'San Jose','CA','95134',37.398259,-121.922367);
INSERT INTO Address VALUES('86', 'Dolores St &  San Jose Ave', '', 'San Francisco','CA','94110',37.74023,-122.423782);
INSERT INTO Address VALUES('87', '4th St & Howard St', '', 'San Francisco','CA','94103',37.783229,-122.402582);
INSERT INTO Address VALUES('88', 'Palm Dr & Arboretum Rd', '', 'Stanford','CA','94305',37.437838,-122.166975);
INSERT INTO Address VALUES('89', 'Millbrae Ave &  Willow Ave', '', 'Millbrae ','CA','94030',37.596635,-122.391083);
INSERT INTO Address VALUES('90', 'Paseo Padre Pky & Fremont Blvd', '', 'Fremont','CA','94555',37.575035,-122.041273);
INSERT INTO Address VALUES('91', 'University Ave & Middlefield Rd', '', 'Palo Alto','CA','94301',37.450638,-122.156975);
INSERT INTO Address VALUES('92', 'El Camino Real & Scott Blvd', '', 'Santa Clara','CA','95050',37.352141 ,-121.959569);
INSERT INTO Address VALUES('93', 'Telegraph Ave & Bancroft Way', '', 'Berkeley','CA','94704',37.868825,-122.25978);
INSERT INTO Address VALUES('94', 'San Antonio Rd & Middlefield Rd', '', 'Palo Alto','CA','94303',37.416239,-122.103474);
INSERT INTO Address VALUES('95', '20th St &  Dolores St', '', 'San Francisco','CA','94114',37.75823,-122.425582);
INSERT INTO Address VALUES('96', 'River Oaks Pky & Village Center Dr', '', 'San Jose','CA','95134',37.398259,-121.922367);
INSERT INTO Address VALUES('97', 'Dolores St &  San Jose Ave', '', 'San Francisco','CA','94110',37.74023,-122.423782);
INSERT INTO Address VALUES('98', 'Campbell St & Riverside Ave', '', 'Santa Cruz','CA','95060',36.96985,-122.019473);
INSERT INTO Address VALUES('99', 'Palm Dr & Arboretum Rd', '', 'Stanford','CA','94305',37.437838,-122.166975);
INSERT INTO Address VALUES('100', 'Leavesley Rd & Monterey Rd', '', 'Gilroy','CA','95020',37.019447,-121.574953);
INSERT INTO Address VALUES('101', 'Cesar Chavez St & Sanchez', '', 'San Francisco','CA','94131',37.74753,-122.428982);
INSERT INTO Address VALUES('102', 'University Ave & Middlefield Rd', '', 'Palo Alto','CA','94301',37.450638,-122.156975);
INSERT INTO Address VALUES('103', 'W elcome to Belkinge', '', 'Blekinge institute of tekniska','Sweden','37179',56.160816,15.586714);
INSERT INTO Address VALUES('104', 'valhallavägan', '', 'Karlskrona','Sweden','37141',56.181044,15.595773);
INSERT INTO Address VALUES('1', 'Annebo', '','Karlskrona', 'Sweden','37030',56.174864,15.596091);


INSERT INTO SellerContactInfo VALUES('1', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('2', 'Singh', 'Inderjeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('3', 'Basler', 'Mark', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('4', 'Yoshida', 'Yutaka', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('5', 'Kangath', 'Smitha', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('6', 'Freeman', 'Larry', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('7', 'Kaul', 'Jeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('8', 'Burns', 'Ed', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('9', 'McClanahan', 'Craig', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('10', 'Murray', 'Greg', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('11', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('12', 'Singh', 'Inderjeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('13', 'Basler', 'Mark', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('14', 'Yoshida', 'Yutaka', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('15', 'Kangath', 'Smitha', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('16', 'Freeman', 'Larry', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('17', 'Kaul', 'Jeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('18', 'Burns', 'Ed', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('19', 'McClanahan', 'Craig', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('20', 'Murray', 'Greg', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('21', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('22', 'Singh', 'Inderjeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('23', 'Basler', 'Mark', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('24', 'Yoshida', 'Yutaka', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('25', 'Kangath', 'Smitha', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('26', 'Freeman', 'Larry', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('27', 'Kaul', 'Jeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('28', 'Burns', 'Ed', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('29', 'McClanahan', 'Craig', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('30', 'Murray', 'Greg', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('31', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('32', 'Singh', 'Inderjeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('33', 'Basler', 'Mark', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('34', 'Yoshida', 'Yutaka', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('35', 'Kangath', 'Smitha', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('36', 'Freeman', 'Larry', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('37', 'Kaul', 'Jeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('38', 'Burns', 'Ed', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('39', 'McClanahan', 'Craig', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('40', 'Murray', 'Greg', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('41', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('42', 'Singh', 'Inderjeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('43', 'Basler', 'Mark', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('44', 'Yoshida', 'Yutaka', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('45', 'Kangath', 'Smitha', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('46', 'Freeman', 'Larry', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('47', 'Kaul', 'Jeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('48', 'Burns', 'Ed', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('49', 'McClanahan', 'Craig', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('50', 'Murray', 'Greg', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('51', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('52', 'Singh', 'Inderjeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('53', 'Basler', 'Mark', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('54', 'Yoshida', 'Yutaka', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('55', 'Kangath', 'Smitha', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('56', 'Freeman', 'Larry', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('57', 'Kaul', 'Jeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('58', 'Burns', 'Ed', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('59', 'McClanahan', 'Craig', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('60', 'Murray', 'Greg', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('61', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('62', 'Singh', 'Inderjeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('63', 'Basler', 'Mark', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('64', 'Yoshida', 'Yutaka', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('65', 'Kangath', 'Smitha', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('66', 'Freeman', 'Larry', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('67', 'Kaul', 'Jeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('68', 'Burns', 'Ed', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('69', 'McClanahan', 'Craig', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('70', 'Murray', 'Greg', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('71', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('72', 'Singh', 'Inderjeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('73', 'Basler', 'Mark', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('74', 'Yoshida', 'Yutaka', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('75', 'Kangath', 'Smitha', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('76', 'Freeman', 'Larry', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('77', 'Kaul', 'Jeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('78', 'Burns', 'Ed', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('79', 'McClanahan', 'Craig', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('80', 'Murray', 'Greg', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('81', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('82', 'Singh', 'Inderjeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('83', 'Basler', 'Mark', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('84', 'Yoshida', 'Yutaka', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('85', 'Kangath', 'Smitha', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('86', 'Freeman', 'Larry', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('87', 'Kaul', 'Jeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('88', 'Burns', 'Ed', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('89', 'McClanahan', 'Craig', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('90', 'Murray', 'Greg', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('91', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('92', 'Singh', 'Inderjeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('93', 'Basler', 'Mark', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('94', 'Yoshida', 'Yutaka', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('95', 'Kangath', 'Smitha', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('96', 'Freeman', 'Larry', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('97', 'Kaul', 'Jeet', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('98', 'Burns', 'Ed', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('99', 'McClanahan', 'Craig', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('100', 'Murray', 'Greg', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('101', 'Brydon', 'Sean', 'abc@abc.xyz');
INSERT INTO SellerContactInfo VALUES('102', 'Singh', 'Inderjeet', 'abc@abc.xyz');

INSERT INTO item VALUES('1', 'feline01', 'ford E350', 'This is a white car with extraordinary features,AM/FM stereo,cruise control,power windows,2010 xlt 4D pass van. ', 'images/anthony.jpg','images/anthony-s.jpg', 19000,'1','1', 15, 3, 0);
INSERT INTO item VALUES('2', 'feline01', 'ford escape', 'A big car with large base line and high speed engine,leather seats ,sunroof,cruise control,20008 limited 4d utility.', 'images/bailey.jpg','images/bailey-s.jpg', 16998,'2','2', 15, 5, 0);
INSERT INTO item VALUES('3', 'feline02', 'ford Escape', 'A big car with tan Exterior,leather seats, 4WD/AWD, dvd video system,cruise control,2007 Xls 4D sport utility. ', 'images/bob.jpg','images/bob-s.jpg', 19999,'3','3', 15, 7, 0);
INSERT INTO item VALUES('4', 'feline02', 'ford Escort', 'A black color exterior and interior,2WD drive,Automatic transmission,air conditioning,2003 ZX2 coupe ', 'images/chantelle.jpg','images/chantelle-s.jpg', 23456,'4','4', 15, 5, 0);
INSERT INTO item VALUES('5', 'feline01', 'ford jagger', 'A great old pet retired from duty in the circus. This fully-trained tiger is looking for a place to retire. Loves to roam free and loves to eat other animals.', 'images/charlie.jpg','images/charlie-s.jpg', 30700,'5','5', 15, 5, 0);
INSERT INTO item VALUES('6', 'feline02', 'ford edge', 'A new model white car with navigation system,dvd video system,automatic transmission,interior tan leather,2007 sel 4D sport utility.', 'images/elkie.jpg','images/elkie-s.jpg', 21999,'6','6', 15, 5, 0);
INSERT INTO item VALUES('7', 'feline01', 'ford edge', 'a black car with premium package ,leather seats, cruise control,2007 sel plus 4d sport utility. ', 'images/faith.jpg','images/faith-s.jpg', 22998,'7','7', 15, 5, 0);
INSERT INTO item VALUES('8', 'feline01', 'ford Explorer', 'white big car,tow hitch ,cruise control,4wd/awd,tan cloth,2007 xlt 4d sport utility.', 'images/gaetano.jpg','images/gaetano-s.jpg', 16998,'8','8', 15, 15, 0);
INSERT INTO item VALUES('9', 'feline02', 'ford F150', 'This is white color car with grey interior,AM/FM streo,cruise control,power windows,automatic transmission,2006 4D extended cab.', 'images/harmony.jpg','images/harmony-s.jpg', 17999,'9','9', 15, 3, 0);
INSERT INTO item VALUES('10', 'feline02', 'ford F250', 'ford f250 black with grey leather seats, automatic transmission,AM/FM stereo,2009 lariat 4D crew cab.', 'images/katzen.jpg','images/katzen-s.jpg', 34555,'10','10', 15, 5, 0);
INSERT INTO item VALUES('11', 'feline02', 'ford F150', 'Fast car with burgundy exterior and brown interior AM/FM stereo,leather seats,sun roof,2009 king RANCH 4D crew cab.', 'images/mario.jpg','images/mario-s.jpg', 41666,'11','11', 15, 10, 0);
INSERT INTO item VALUES('12', 'feline01', 'ford F250', 'This is stylish car with black and yellow mixed ,nice looking,high speed engine ,power sliding doors ,4 seater ,black interior with black leather seats.2004 mlt sport utility', 'images/mimi.jpg','images/mimi-s.jpg', 16000,'12','12', 15, 4, 0);
INSERT INTO item VALUES('13', 'feline01', 'ford F250', 'A  black colored crew cab,AM/FM stereo,leather seats,automatic transmission,2009 lariat 4d crew cab.', 'images/monique.jpg','images/monique-s.jpg', 34000,'13','13', 15, 8, 0);
INSERT INTO item VALUES('14', 'feline01', 'ford free style', 'A burgundy color car with leather seats,3rd rear seat ,sun roof,2005 limited 4D utility.', 'images/olie.jpg','images/olie-s.jpg', 15998,'14','14', 15, 3, 0);
INSERT INTO item VALUES('15', 'feline01', 'ford Mustang', 'a black car with manual transmission ,rear spoiler,air conditioning,interior gray cloth,2008 2D coupe..', 'images/paris.jpg','images/paris-s.jpg', 16599,'15','15', 15, 4, 0);
INSERT INTO item VALUES('16', 'feline01', 'ford Ranger', 'RED car with AM/FM stereo,power windows,air conditioning,grey cloth,5 spped manual transmission.2008 2D regular cab', 'images/princess.jpg','images/princess-s.jpg', 12000,'16','16', 15, 5, 0);
INSERT INTO item VALUES('17', 'feline02', 'ford Expedition', 'WithRed exterior and tan leather interior,2WD drive, 3rd rear seat , navigation system,2007 EL EDDIE BAUER 4D sport utility .', 'images/simba.jpg','images/simba-s.jpg', 28000,'17','17', 15, 3, 0);
INSERT INTO item VALUES('18', 'feline02', 'ford FIVEHUNDRED', 'this is a black car with tan interior,leather seats, front seat heaters ,sun roof ,2007 LIMITED 4D sedan.', 'images/thaicat.jpg','images/thaicat-s.jpg', 14000,'18','18', 15, 5, 0);
INSERT INTO item VALUES('19', 'feline01', 'ford crawler', 'this is a big car with extra power engine,easily moves on hills.special for hill racing, AM/Fm stereo,automatic transmission,2009 sport utility', 'images/cat1.gif','images/cat1.gif', 25999,'19','19', 15, 6, 0);
INSERT INTO item VALUES('20', 'feline01', 'ford sport', 'This is a sport car , specially designed for racing ,5000 hp engine,2010 new release.', 'images/cat2.gif','images/cat2.gif', 50000,'20','20', 15, 3, 0);
INSERT INTO item VALUES('21', 'feline01', 'ford cube', 'This is a new model car specially for cab and work place,smooth drive,leather seats ,power steering,2010 3D cab utility', 'images/cat3.gif','images/cat3.gif', 25000,'21','21', 15, 3, 0);
INSERT INTO item VALUES('22', 'feline01', 'ford NEW Ranger', 'This is new ford ranger with red color,automatic transmission,2 seat car, red interior,power sliding doors,2009 2d sport regular cab.', 'images/cat4.gif','images/cat4.gif', 18777,'22','22', 15, 9, 0);
INSERT INTO item VALUES('23', 'feline01', 'ford Expedition', 'U will love to drive this.3rd rear seat ,dvd video system,blue,automatic transmission,Eddie Bauer 4D sport.', 'images/cat5.gif','images/cat5.gif', 28000, '23','23', 15, 5, 0);
INSERT INTO item VALUES('24', 'feline02', 'ford FOCUS', 'Wth red exterior and black leather interior ,leather seats ,sunroof, airconditioning,2009 ses 4D sedan.', 'images/cat7.gif','images/cat7.gif', 12000, '24','24', 15, 3, 0);
INSERT INTO item VALUES('25', 'feline02', 'ford HARLEYDAVIDSON', 'Buy this car ... it has black exterior and interior,4WD drive, Automatic trnsmission,leather seats,sunroof,2007 limited 4D sport utility ', 'images/cat8.gif', 'images/cat8.gif', 24000,'25','25', 15, 8, 0);
INSERT INTO item VALUES('26', 'feline02', 'ford MUSTANG', 'grey interior clothand exterior,manual 5 speed transmission,rear spoiler,air conditioning,2WD drive,2008 2D coupe.', 'images/cat9.gif','images/cat9.gif', 15000,'26','26', 15, 14, 0);
INSERT INTO item VALUES('27', 'feline02', 'ford FUSION', 'BUY THIS...grey exterior black cloth interior,automatic transmittion ,air condition,cruise control,2007 SE 4D sedan', 'images/cat10.gif', 'images/cat10.gif', 22555,'27','27', 15, 14, 0);
INSERT INTO item VALUES('28', 'feline02', 'ford MUSTANGSHELLBY', 'black color car with two tone ,manual six speed transmission,leather seats ,rear spoiler,2007 GT500 2D coupe', 'images/cat11.gif', 'images/cat11.gif', 33000,'28','28', 15, 5, 0);
INSERT INTO item VALUES('29', 'feline02', 'ford ESCAPE', 'Grey exterior and tan cloth interior,sun roof ,cruise control,air condition,2005 4D sport utility .', 'images/cat12.gif', 'images/cat12.gif', 10000,'29','29', 15, 5, 0);

INSERT INTO item VALUES('100', 'canine02', 'TOYOTA MR2 SPYDER', 'buy this yellow car.. black color interior, manual 5 speed transmission, air conditioning, ABS brakes, 2WD Drive, 2000 2D Convertible.', 'images/biscuit.jpg','images/biscuit-s.jpg', 12000,'30','30', 15, 3, 0);
INSERT INTO item VALUES('101', 'canine01', 'TOYOTA MATRIX', 'A blue color car with internal Black cloth,sunroof,Airconditioning, cruise control, automatic transmission, 2WD Drive, 2008 XR 4D Wagon.', 'images/harrison.jpg','images/harrison-s.jpg', 15000,'31','31', 15, 5, 0);
INSERT INTO item VALUES('102', 'canine01', 'TOYOTA PRIUS', 'A Wihte Color Car with Gray cloth Interior, Air Conditioning, Cruise Control, Automatic Transmission, Dirve 2WD, 2008 4D Hatchback.', 'images/honey.jpg','images/honey-s.jpg', 16599,'32','32', 20, 5, 0);
INSERT INTO item VALUES('103', 'canine01', 'TOYOTA RAV4', 'A Big Blue Color Car Cruise Control, Air Conditioning, ABS Brakes, Automatic Transmission, Gray Cloth Interior, 2WD Drive, 2007 4D Sport Utility.', 'images/hunter.jpg','images/hunter-s.jpg', 18998,'33','33', 15, 5, 0);
INSERT INTO item VALUES('104', 'canine02', 'TOYOTA TACOMA', 'A Black Color Car with Gray Interior, AM/Fm Stereo, Air Conditioning, Bed Liner, Manual 5 Speed Transmission, 2WD Drive, 2007 2D Regural Cab.', 'images/jack.jpg','images/jack-s.jpg', 12215,'34','34', 15, 7, 0);
INSERT INTO item VALUES('105', 'canine01', 'TOYOTA SEQUOIA', 'a Gray Color Car with Gray Leather Interior, Leather Seats, 3rd Rear Seat, Sunroof, Automatic Transmission, 2WD Drive, 2006 SR5 4D Sport Utility.', 'images/lady.jpg','images/lady-s.jpg', 22000,'35','35', 15, 5, 0);
INSERT INTO item VALUES('106', 'canine01', 'TOYOTA FJ CRUISER', 'A good looking blue color car with black interior, cruise control, 4WD/AWD, Air conditioning, Automatic Transmission, 4WD Drive, 2007 2D Sport Utility.', 'images/maggie.jpg','images/maggie-s.jpg', 22000,'36','36', 15, 3, 0);
INSERT INTO item VALUES('107', 'canine01', 'TOYOTA HIGHLANDER', 'A Black Color Car with Interior Tan Cloth, Automatic TRansmission, Navigator, 2WD Drive, 2008 4D Sport Utility.', 'images/marianna.jpg','images/marianna-s.jpg', 22500,'37','37', 15, 7, 0);
INSERT INTO item VALUES('108', 'canine02', 'TOYOTA FJ CRUISER ', 'A Good looking Yellow Color Car with interior black cloth, cruise control, air conditioning, ABS brakes, automatic transmission, 2WD Dirve, 2007 2D sport utility.', 'images/puppup.jpg','images/puppup-s.jpg', 18999,'38','38', 15, 6, 0);
INSERT INTO item VALUES('109', 'canine01', 'TOYOTA COROLLA', 'A Good running car with Red color Exterior, Inerorior Gray Cloth, Air Conditioning, Cruise Control, Automatic Transmission, 2WD Drive, 2010 LE 4D Sedan.', 'images/rita.jpg','images/rita-s.jpg', 14425,'39','39', 15, 9, 0);
INSERT INTO item VALUES('110', 'canine02', 'TOYOTA FJ CRUISER', 'A Black Color Car with interior black, Tow Hitch, cruise control, air conditioning, automatic transmission, 2WD Drive, 2007 2D Sport Utility.', 'images/sabrina.jpg','images/sabrina-s.jpg', 19979,'40','40', 15, 5, 0);
INSERT INTO item VALUES('111', 'canine01', 'TOYOTA PRIUS', 'A Green color car with tan leather interior, automatic transmisssion, tooring package, air conditioning, cruise control, 2008 4D hatchback.', 'images/thaidog.jpg','images/thaidog-s.jpg', 17000,'41','41', 15, 3, 0);
INSERT INTO item VALUES('112', 'canine01', 'TOYOTA YARIS', 'BUY THIS NEW CAR.. black color exterior, automatic transmission, black leather seats, front heaters, air conditioning, 2011 2D Sport utility.', 'images/dog1.gif','images/dog1.gif', 22200,'42','42', 15, 9, 0);
INSERT INTO item VALUES('113', 'canine01', 'TOYOTA 4RUNNER', 'This is new car with extraordinary features. automatic transmission, red color exterior, black color interior, ABS brakes, AM/Fm Sterio, 2011 4D Sport Utility.', 'images/dog2.gif','images/dog2.gif', 30070,'43','43', 15, 11, 0);
INSERT INTO item VALUES('114', 'canine01', 'TOYOTA VENZA', 'A Blue Color Car with Black Leather cloth interior, Automatic Transmission, ABS Brakes, front heater, DVD compatible, Sunroof, 2011 2d Convertible.', 'images/dog3.gif','images/dog3.gif', 27301,'44','44', 15, 5, 0);
INSERT INTO item VALUES('115', 'canine02', 'TOYOTA CAMRY', 'A Blue color car with leather seats, automatic transmisssion, AM/FM Stereo, DVD Compatible, ABS Brakes, 2010 2D Convertible.', 'images/dog4.gif','images/dog4.gif', 14010,'45','45', 15, 5, 0);
INSERT INTO item VALUES('116', 'canine02', 'TOYOTA PRIUS 10', 'A new releasing car with great features and good performance. airconditioning, white color car with black interior, leather seats, automatic transmission, ABS brakes, 2011 4D Sport Utility', 'images/dog5.gif', 'images/dog5.gif', 20200,'46','46', 15, 3, 0);
INSERT INTO item VALUES('117', 'canine02', 'TOYOTA RAV4', 'A Silver Color Car with Automatic Transmission, Air Conditioning, Black LEather Seats, Cruise Control, ABS Brakes, 2011 4D Sport Utility', 'images/dog6.gif', 'images/dog6.gif', 22200,'47','47', 15, 5, 0);

INSERT INTO item VALUES('201', 'avian01', 'AUDI A4', 'Exterior black,Interior Black leather,Premium backage,Leather seats,Sun roofs,Automatic transmission, 2WD drive,2007 2.0T 4D sedan.', 'images/parrot-popcorn.jpg', 'images/parrot-popcorn-s.jpg', 22600,'48','48', 15, 5, 0);
INSERT INTO item VALUES('202', 'avian01', 'AUDI A4', 'PREMIUM PACKAGE,Exterior REd color,white interior ,Leather seats,Sunroofs,Automatic Transmition,2 WD drive,2007 2.0T 4D sedan,!', 'images/eclectus-female-med.jpg', 'images/eclectus-female-thumb.jpg', 19000,'49','49', 15, 5, 0);
INSERT INTO item VALUES('203', 'avian01', 'AUDI A3', 'Exterior Black,Interior Black Leather,Leather seats,Front seat heaters ,Bose sound system,Automatic transmition,4WD drive,2006 3.2 s-line4D HATCHBACK.', 'images/galah-parrot-med.jpg', 'images/galah-parrot-thumb.jpg', 22900,'50','50', 15, 3, 0);
INSERT INTO item VALUES('204', 'avian02', 'BMW M3', 'Black Exterior and Black Leather interior,Leather seats , Air conditioning,ABS breaks,Automatic transmision,2WD drive,2004 2D convertible', 'images/kookaburra-med.jpg', 'images/kookaburra-thumb.jpg', 26100,'51','51', 15, 5, 0);
INSERT INTO item VALUES('205', 'avian02', 'BMW 335 I', 'Exterior Blue color and interior Brown leather ,Premium Package,cold weather package,sunroof,Automatic transmission,2WD drive,2007 4D sedan.', 'images/lovebird-med.jpg', 'images/lovebird-thumb.jpg', 25575,'52','52', 15, 7, 0);
INSERT INTO item VALUES('206', 'avian02', 'BMW Z4', 'Exterior Silver color Interior Black Leather ,Manual Transmission 6 speed,Air conditioning,ABS breaks,2WD drive,2007 3.0i 2D convertible.', 'images/peacock-blue-med.jpg', 'images/peacock-blue-thumb.jpg', 21600,'53','53', 15, 10, 0);
INSERT INTO item VALUES('207', 'avian02', 'BMW 328 I', 'Exterior Black color Interior Gray leather ,sports package,Sunroofs,Leather seats,Automatic Transmission,2WD drive,2007 4D sedan', 'images/peacock-med.jpg', 'images/peacock-thumb.jpg', 20665,'54','54', 15, 5, 0);
INSERT INTO item VALUES('208', 'avian02', 'BMW 335 I', 'Exterior Black colorand interior  Tan leather ,sun roofs satellite radio ready,Automatic transmission,2WD drive... 2007 4D sedan.', 'images/peakcock-white-med.jpg', 'images/peacock-white-thumb.jpg', 24195,'55','55', 15, 3, 0);
INSERT INTO item VALUES('209', 'avian02', 'BMW 525 XI', 'Color! Color! Color!Exterior black color ,Interior Black leather ,premium package,cold weather package,Navigation system,Automaatic transmission,4WD drive,2007 4D sedan ', 'images/rainbow-lorikeet-med.jpg', 'images/rainbow-lorikeet-thumb.jpg', 29900,'56','56', 15, 5, 0);
INSERT INTO item VALUES('210', 'avian02', 'BMW 328 I','My BMW car with EXTERIOR BLACK,interior RED ,Premium package,leather seats,front seat heaters,Automatic transmission,2WD drive,2008 2D convertible.', 'images/eagle-stone-med.jpg', 'images/eagle-stone-thumb.jpg', 28800,'57','57', 15, 10, 0);
INSERT INTO item VALUES('211', 'avian02', 'BMW X5', 'Look at this BMW SILVER color car,Interior Black leather ,premium package ,technology packagee ,leather seats ,automatic transmission,4WD drive,2007 3.0si 4D sport utility.', 'images/macaw.jpg', 'images/macaw-thumb.jpg', 33800,'58','58', 15, 3, 0);
INSERT INTO item VALUES('212', 'avian01', 'AUDI Q7', 'Exterior Beige color,Interior TAN leather ,Technology Package,convinence package, leather seats,Automatic Transmission,4WD drive,2007 3.6 4D sport utility.', 'images/CIMG9127.jpg', 'images/CIMG9127-s.jpg', 30350,'59','59', 15, 7, 0);
INSERT INTO item VALUES('213', 'avian01', 'AUDI A5',' Exterior gray,interior Black,Navigation system,Front seat heaters,Manual 6 speed Transmission,4WD drive,2009 3.2 2D coupe' ,'images/CIMG9104.jpg', 'images/CIMG9104-s.jpg', 39999,'60','60', 15, 5, 0);
INSERT INTO item VALUES('214', 'avian02', 'BMW 335 I', 'REDexterior color ,interior black leather ,sports package,premium package,Navigation system,Automatic transmission,2WD drive,2008 2D convertable!', 'images/CIMG9109.jpg', 'images/CIMG9109-s.jpg', 32527,'61','61', 15, 7, 0);
INSERT INTO item VALUES('215', 'avian02', 'BMW X5', 'WHITE exterior color ,interior WHITE leather ,CRUISE CONTROL,premium package,FRONT SEAT HEATER,Navigation system,Automatic transmission,4WD drive,2009 4D SPORT UTILITY!.', 'images/BMWX5.jpg', 'images/BMWX5-s.jpg', 41000,'62','62', 15, 5, 0);
INSERT INTO item VALUES('216', 'avian02', 'BMW 323 I', 'BURGENDY exterior color ,interior GRAY leather ,sports package,premium package,cold weather,sun roof,Automatic transmission,2WD drive,2000 4D saden.', 'images/BMWI.jpg', 'images/BMWI-s.jpg', 11150,'63','63', 15, 3, 0);
INSERT INTO item VALUES('217', 'avian02', 'BMW Z4', 'SPORTS MODEL CAR!wow...Exterior red color,interior black color,Automatic transmission,Air conditioning,ABS breaks,2D drive,2007 3.0i 2D convertible', 'images/CIMG9084.jpg','images/CIMG9084-s.jpg', 23527,'64','64', 15, 5, 0);
INSERT INTO item VALUES('218', 'avian02', 'BMW 330 CI', 'black exterior color ,interior black leather ,sports package,premium package,LEATHER SEATS,COLD weather package,MANUAL 5 speed transmission,2WD drive,2002 2D convertible', 'images/BMWCI.jpg','images/BMWCI-s.jpg', 15000,'65','65', 15, 3, 0);
INSERT INTO item VALUES('219', 'avian02', 'BMW 328 I', 'PREMIUM PACKAGE,Exterior black color,interior white,leather seats ,front seat heater Automatic transmition,2WD drive ,2008 2D convertible.', 'images/CIMG9088.jpg','images/CIMG9088-s.jpg', 34527,'66','66', 15, 10, 0);
INSERT INTO item VALUES('220', 'avian02', 'BMW 650 I', 'BLACK exterior color ,interior black leather ,sports package,premium package,LEATHER SSEATS,Navigation system,Automatic transmission,2WD drive,2010 2D convertable!.', 'images/650i.jpg','images/650i-s.jpg', 65327,'67','67', 15, 5, 0);
INSERT INTO item VALUES('221', 'avian02', 'BMW 528 i ', 'Exterior Black color,Interior Tan color,Premium color ,sun roofs,leather sseats,Automatic transmission 2WD drive,2008 4Dsedan.', 'images/CIMG9129.jpg', 'images/CIMG9129-s.jpg', 30200,'68','68', 15, 5, 0);

INSERT INTO item VALUES('301', 'fish02', 'Mercedes-Benz SLK320', 'Good car with automatic transmission, Silver Color, Leather Seats, Front Seat Heaters, BOSE Sound System, 2003 2D Convertible', 'images/spotted-jellyfish-med.jpg','images/spotted-jellyfish-thumb.jpg', 13998,'69','69', 15, 5, 0);
INSERT INTO item VALUES('302', 'fish01', 'Mercedes-Benz C230', 'A White Color Luxurious car with Automatic Transmission, Sunroof(s), Front Seat Heaters, Cruise Control,2007 4D Sedan', 'images/sea-nettle-jellyfish-med.jpg','images/sea-nettle-jellyfish-thumb.jpg', 32998,'70','70', 15, 5, 0);
INSERT INTO item VALUES('303', 'fish02', 'Mercedes-Benz ML500', 'A Big Black Color Car with 4D Sport Utility, 4WD, 8 cylinders, Automatic, Silver, 14/19 MPG, 2006 4D Sport Utility', 'images/rockfish-med.jpg','images/rockfish-thumb.jpg', 28998,'71','71', 15, 5, 0);
INSERT INTO item VALUES('304', 'fish02', 'Mercedes-Benz CLK350', 'A Silver Color car with Leather Seats, Front Seat Heaters, Automatic Transmission, Gray Interior, Silver Exterior,2009 2D Convertible', 'images/purple-jellyfish-med.jpg','images/purple-jellyfish-thumb.jpg',24998 ,'72','72', 15, 5, 0);
INSERT INTO item VALUES('305', 'fish02', 'Mercedes-Benz E320', 'Buy this car..Sunroof(s), Leather Seats, Automatic Transmission, Blue Exterior, Tan Leather Interior, 2005 4D Sedan', 'images/octopus-white-med.jpg','images/octopus-white-thumb.jpg', 21998,'73','73', 15, 5, 0);
INSERT INTO item VALUES('306', 'fish02', 'Mercedes-Benz CLK320', 'A Black Color car with power sliding doors, Automatic Transmission, Tan Leather Interior,2204 2D Convertible', 'images/octopus-red-med.jpg','images/octopus-red-thumb.jpg', 23599,'74','74', 15, 5, 0);
INSERT INTO item VALUES('307', 'fish02', 'Mercedes-Benz SLK280', 'A Gray color car with automatic transmission, Silver Exterior, Leather Seats, Front Seat Heaters, Satellite Radio Ready, 2006 2D Convertible', 'images/koi-med.jpg','images/koi-thumb.jpg', 22998,'75','75', 15, 5, 0);
INSERT INTO item VALUES('308', 'fish02', 'Mercedes-Benz C230', 'A Gray Color Car with Automatic Transmission,Sunroof(s), Front Seat Heaters, Rear Spoiler,2007 4D Sedan.', 'images/glassfish-colored-med.jpg','images/glassfish-colored-thumb.jpg', 22998,'76','76', 15, 5, 0);
INSERT INTO item VALUES('309', 'fish01', 'Mercedes-Benz SL500', 'A good looking silver color car with Adjustable Suspension, Leather Seats, Navigation System, Automatic Transmission, 2003 2D Convertible', 'images/cuttlefish-med.jpg','images/cuttlefish-thumb.jpg', 32998,'77','77', 15, 5, 0);
INSERT INTO item VALUES('310', 'fish01', 'Silver Carp Car', 'You will never believe the car I caught!', 'images/carp-car-med.jpg','images/carp-car-thumb.jpg', 11998,'78','78', 15, 5, 0);
INSERT INTO item VALUES('311', 'fish02', 'Mercedes-Benz R500', 'Buy This Gold Color Car with Tan Leather Interior, Automatic Transmission,Navigation System, Leather Seats, 3rd Rear Seat, 2006 4D Sport Utility', 'images/moon-jelly-med.jpg','images/moon-jelly-thumb.jpg', 25998,'79','79', 15, 5, 0);
INSERT INTO item VALUES('312', 'fish01', 'Mercedes-Benz C280', 'A White Color Car with Sunroof(s), Front Seat Heaters, Automatic Transmission,2006 4D Sedan', 'images/sea-anemone-med.jpg','images/sea-anemone-thumb.jpg', 23998,'80','80', 15, 5, 0);
INSERT INTO item VALUES('313', 'fish01', 'Mercedes-Benz CLK350', 'A good looking Red Color Car with Leather Seats, Front Seat Heaters, Satellite Radio Ready, Automatic Transmission, 2006 2D Convertible', 'images/fish2.gif','images/fish2.gif', 20998,'81','81', 15, 5, 0);
INSERT INTO item VALUES('314', 'fish01', 'Mercedes-Benz C280', 'A silver color car with black Interior, Automatic Transmission, Sunroof(s), Front Seat Heaters, Satellite Radio Ready, 2007 4D Sedan', 'images/fish3.gif','images/fish3.gif', 16998,'82','82', 15, 5, 0);
INSERT INTO item VALUES('315', 'fish02', 'Mercedes-Benz SLK280', 'A good looking Red Color Car with Black Leather interior,Premium Package, Leather Seats, Front Seat Heaters, Automatic Transmission', 'images/fish4.gif','images/fish4.gif', 28998,'83','83', 15, 5, 0);

INSERT INTO item VALUES('401', 'reptile02', 'JEEP COMMANDER', 'This is a high speed jeep with black exterior and gray leather interior color,leather seats ,3rd rear seat,sunroof,automatic transmission,2WD drive,2007 LIMITED 4D support utility', 'images/hawaiian-lizard-med.jpg','images/hawaiian-lizard-thumb.jpg', 22222,'84','84', 15, 5, 0);
INSERT INTO item VALUES('402', 'reptile02', 'JEEP GRAND CHEROKEE', 'good condition car with exterior red and interior grey leather,leather seats sun roofs,automatic transmition,4WD drive,2005 limited 4D sport utility. ', 'images/african-spurred-tortoise.jpg','images/african-spurred-tortoise-thumb.jpg', 24230,'85','85', 15, 3, 0);
INSERT INTO item VALUES('403', 'reptile02', 'JEEP COMPASS LIMITED', 'SILVER exterior with grey interior colors, leather seats , sun roofs, cruise control,manual 5 Speed transmition, 2WD drive,2007 4D sport utility', 'images/box-turtle.jpg','images/box-turtle-thumb.jpg', 15000,'86','86', 15, 4, 0);
INSERT INTO item VALUES('404', 'reptile02', 'JEEP LIBERTY SPORT', 'GOOD LOOKING AND GOOD CONDITION CAR,white exterior and interior gray cloth, cruise control,air conditioning,automatic transmission, 4WD drive,2008 4D sport utility', 'images/mexican-redkneed-tarantula.jpg','images/mexican-redkneed-tarantula-thumb.jpg', 18530,'87','87', 15, 5, 0);
INSERT INTO item VALUES('405', 'reptile02', 'JEEP COMPASS SPORT', 'Tan color exterior and interior,air conditioning,ABS breaks, automatic transmition, ,2WD drive 2009 4D sport utility.', 'images/box-turtle2.jpg','images/box-turtle2-thumb.jpg', 14500,'88','88', 15, 4, 0);
INSERT INTO item VALUES('406', 'reptile02', 'JEEP PATRIOT SPORT', 'RED color jeep with TAN cloth interior ,good air condition,NEW ABS breaks ,AUtomatic transmition,2WD drive,2007 4D sport utility .', 'images/california-desert-tortoise.jpg','images/california-desert-tortoise-thumb.jpg', 12599,'89','89', 15, 3, 0);
INSERT INTO item VALUES('407', 'reptile01', 'JEEP COMPASS SPORT', 'This is a sports jeep with blue exterior color and gray interior color,air conditioning,ABS breaks,automatic transmition,2 WD drive,2007 4D sport utility', 'images/florida-king-snake.jpg','images/florida-king-snake-thumb.jpg', 15000,'90','90', 15, 6, 0);
INSERT INTO item VALUES('408', 'reptile01', 'JEEP WRANGLER', 'yellow color exterior and grey cloth interior jeep,tow hitch,4WD/AWD,air conditioning,automatic transmition,with good condition,2006 X 2D sport utility.', 'images/leopard-gecko.jpg','images/leopard-gecko-thumb.jpg', 16899,'91','91', 15, 3, 0);
INSERT INTO item VALUES('409', 'reptile02', 'JEEP WRANGLER RUBICON', 'GOOD LOOKING with exterior black color and interior blue cloth,tow hitch,cruise control,4WD/AWD,automatic transmittion,drive 4WD,2005 2D sport utility.', 'images/prehensile-tailed-skink.jpg','images/prehensile-tailed-skink-thumb.jpg', 18999,'92','92', 15, 6, 0);
INSERT INTO item VALUES('410', 'reptile02', 'JEEP GRAND CHEROKEE LAREDO', 'WOW GRWAT DEAL ,This is a BEIGE EXTERIOR COLOR and TAN clothinterior,cruise controlling,air conditioning,ABS breaks,Automatic Transmition,2D drive,2007 4D sport utility', 'images/african-spurred-tortoise2.jpg','images/african-spurred-tortoise2-thumb.jpg', 14299,'93','93', 15, 5, 0);
INSERT INTO item VALUES('411', 'reptile02', 'JEEP PATRIOT SPORT', 'Exterior maroon and interior grey,Automatic transmition,2WD drive,2007 4D sport utility.', 'images/box-turtle3.jpg','images/box-turtle3-thumb.jpg', 90000,'94','94', 15, 5, 0);
INSERT INTO item VALUES('412', 'reptile01', 'JEEP COMPASS SPORT', 'HAVE A GREAT DEAL < SO BUY IT> good running jeep,white jeep with white interior ,cruise control, ABS breaks ,air conditioning,Automatic transmition ,2WD drive,2007 4D sport utility ', 'images/prehensile-tailed-skink2.jpg','images/prehensile-tailed-skink2-thumb.jpg', 10000,'95','95', 15, 3, 0);
INSERT INTO item VALUES('413', 'reptile01', 'JEEP LIBERTY', 'beige exterior and interior color jeep,cruise control,airconditioning, ABS breaks,automatic transmission,2WD drive,2006 RENEGADE 4D sport utility.', 'images/leopard-gecko2.jpg','images/leopard-gecko-thumb2.jpg', 15000,'96','96', 15, 4, 0);
INSERT INTO item VALUES('414', 'reptile01', 'JEEP LIBERTY SPORT', 'Oh WHAT  a DEAL ....EXTERIOR white color ,interior white leather seats,sunroofs , cruise control,AIR conditioning,Automatic transmition,2WD drive,2005 4D sport utility. ', 'images/guinea-pig.jpg','images/guinea-pig-thumb.jpg', 10000,'97','97', 15, 4, 0);
INSERT INTO item VALUES('415', 'reptile01', 'JEEP WRANGLER ', 'RUNNING BOARDS, BURGENDY color exteriorand TAUPE interior,4WD/AWD,air conditioning,automatic transmition,2007 X 2D sport utility', 'images/dragon-iron-med.jpg','images/dragon-iron-thumb.jpg', 18000,'98','98', 15, 3, 0);
INSERT INTO item VALUES('416', 'reptile01', 'JEEP WRANGLER SPORT', 'TTHIS IS GRAND NEW JEEP 2011 TO BE RELEASED,NATURELL GREEN EXTERIOR BLACK CLOTH INTERIOR,CRUISE CONTROLLER ,AIR CONDITIONING,MANUAL 6 SPEED TRANSMITTION,4WD DRIVE,NEW 2011 2D SPORT UTILITY.', 'images/lizard3.gif','images/lizard3.gif', 23000,'99','99', 15, 4, 0);
INSERT INTO item VALUES('417', 'reptile02', 'JEEP GRAND CHEROKEELAREDO', 'THIS IS GRAND NEW JEEP TO BE RELEASED ,WHITE EXTERIOR STONE WHITE INTERIOR DKGRYSTN/MDGRYSTN CLOTH,CRUISE CONTROL AIR CONDITIONING AUTOMATIC TRANSMITION<4WD DRIVE,NEW2011 4D SPORT UTILITY...', 'images/lizard1.gif','images/lizard1.gif', 31000,'100','100', 15, 5, 0);
INSERT INTO item VALUES('418', 'reptile02', 'JEEP GRAND CHEROKEELAREDO', 'THIS IS GRAND NEW JEEP TO BE RELEASED ,BRILLANT BLACK EXTERIOR BLACK LEATHER INTERIOR ,LEATHER SEATS,CRUISE CONTROL AIR CONDITIONING AUTOMATIC TRANSMITION,2WD DRIVE,NEW2011 4D SPORT UTILITY..', 'images/lizard2.gif','images/lizard2.gif', 33000,'101','101', 15, 5, 0);
INSERT INTO item VALUES('419', 'reptile02', 'JEEP PATRIOT SPORT', 'THIS is a green color jeep with interior white coating,cruise control ,ABS breaks,Air conditioning,auto matic transmission,2WD drive,2008 4D sport utility.', 'images/frog1.gif','images/frog1.gif', 15000,'102','102', 15, 3, 0);

INSERT INTO tag VALUES(1,'awesome',5);
INSERT INTO tag VALUES(2,'interesting',2);
INSERT INTO tag VALUES(3,'cool',10);
INSERT INTO tag VALUES(4,'excellent',20);
INSERT INTO tag VALUES(5,'fun',20);
INSERT INTO tag VALUES(6,'worthless',4);
INSERT INTO tag VALUES(7,'superior',10);
INSERT INTO tag VALUES(8,'inferior',4);

INSERT INTO tag_item VALUES(1, '1');
INSERT INTO tag_item VALUES(1, '2');
INSERT INTO tag_item VALUES(1, '3');
INSERT INTO tag_item VALUES(1, '4');
INSERT INTO tag_item VALUES(1, '5');
INSERT INTO tag_item VALUES(2, '1');
INSERT INTO tag_item VALUES(2, '2');
INSERT INTO tag_item VALUES(3, '1');
INSERT INTO tag_item VALUES(3, '2');
INSERT INTO tag_item VALUES(3, '3');
INSERT INTO tag_item VALUES(3, '4');
INSERT INTO tag_item VALUES(3, '5');
INSERT INTO tag_item VALUES(3, '6');
INSERT INTO tag_item VALUES(3, '7');
INSERT INTO tag_item VALUES(3, '8');
INSERT INTO tag_item VALUES(3, '9');
INSERT INTO tag_item VALUES(3, '10');
INSERT INTO tag_item VALUES(4, '8');
INSERT INTO tag_item VALUES(4, '9');
INSERT INTO tag_item VALUES(4, '10');
INSERT INTO tag_item VALUES(4, '11');
INSERT INTO tag_item VALUES(4, '12');
INSERT INTO tag_item VALUES(4, '13');
INSERT INTO tag_item VALUES(4, '14');
INSERT INTO tag_item VALUES(4, '15');
INSERT INTO tag_item VALUES(4, '16');
INSERT INTO tag_item VALUES(4, '17');
INSERT INTO tag_item VALUES(4, '18');
INSERT INTO tag_item VALUES(4, '19');
INSERT INTO tag_item VALUES(4, '20');
INSERT INTO tag_item VALUES(4, '21');
INSERT INTO tag_item VALUES(4, '22');
INSERT INTO tag_item VALUES(4, '23');
INSERT INTO tag_item VALUES(4, '24');
INSERT INTO tag_item VALUES(4, '25');
INSERT INTO tag_item VALUES(4, '26');
INSERT INTO tag_item VALUES(4, '27');
INSERT INTO tag_item VALUES(5, '28');
INSERT INTO tag_item VALUES(5, '29');
INSERT INTO tag_item VALUES(5, '100');
INSERT INTO tag_item VALUES(5, '101');
INSERT INTO tag_item VALUES(5, '102');
INSERT INTO tag_item VALUES(5, '103');
INSERT INTO tag_item VALUES(5, '104');
INSERT INTO tag_item VALUES(5, '105');
INSERT INTO tag_item VALUES(5, '106');
INSERT INTO tag_item VALUES(5, '107');
INSERT INTO tag_item VALUES(5, '108');
INSERT INTO tag_item VALUES(5, '109');
INSERT INTO tag_item VALUES(5, '110');
INSERT INTO tag_item VALUES(5, '111');
INSERT INTO tag_item VALUES(5, '112');
INSERT INTO tag_item VALUES(5, '113');
INSERT INTO tag_item VALUES(5, '114');
INSERT INTO tag_item VALUES(5, '115');
INSERT INTO tag_item VALUES(5, '116');
INSERT INTO tag_item VALUES(5, '117');
INSERT INTO tag_item VALUES(6, '401');
INSERT INTO tag_item VALUES(6, '402');
INSERT INTO tag_item VALUES(6, '403');
INSERT INTO tag_item VALUES(6, '404');
INSERT INTO tag_item VALUES(7, '405');
INSERT INTO tag_item VALUES(7, '406');
INSERT INTO tag_item VALUES(7, '407');
INSERT INTO tag_item VALUES(7, '408');
INSERT INTO tag_item VALUES(7, '409');
INSERT INTO tag_item VALUES(7, '410');
INSERT INTO tag_item VALUES(7, '411');
INSERT INTO tag_item VALUES(7, '412');
INSERT INTO tag_item VALUES(7, '413');
INSERT INTO tag_item VALUES(7, '414');
INSERT INTO tag_item VALUES(8, '415');
INSERT INTO tag_item VALUES(8, '416');
INSERT INTO tag_item VALUES(8, '417');
INSERT INTO tag_item VALUES(8, '418');


INSERT INTO id_gen VALUES('ITEM_ID',419);
INSERT INTO id_gen VALUES('ADDRESS_ID',102);
INSERT INTO id_gen VALUES('CONTACT_INFO_ID',102);
INSERT INTO id_gen VALUES('TAG_ID',8);

