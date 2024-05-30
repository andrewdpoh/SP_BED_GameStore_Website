DROP DATABASE IF EXISTS `sp_games`;
CREATE DATABASE IF NOT EXISTS `sp_games`;
USE `sp_games`;

-- Table `user`
CREATE TABLE `user` (
  `userid` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(20) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `password` VARCHAR(20) NOT NULL,
  `type` VARCHAR(10) NOT NULL,
  `profile_pic_url` VARCHAR(200) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`userid`),
  UNIQUE KEY (`email`)
);
INSERT INTO user VALUES 
(1, 'pyoyjk','pyoyjk@gmail.com','secret','admin','https://i.scdn.co/image/ab67616d0000b2736266737e1e581a8e2a79d4f9','2023-06-07 12:47:20'), 
(2, 'gcmaximus', 'jeraldyeo10@gmail.com', 'Woodgrove', 'customer', 'https://yt3.googleusercontent.com/y3toCoS-IQakhd_at8kio5WG_2pJTFZxTt5FfqWNUoKgI_v7MKRP2XgGsgiseOMYHaolehlP=s176-c-k-c0x00ffffff-no-rj', '2023-06-07 12:49:12'),
(3, 'argi','denzekquekhuangxian@gmail.com','argi_numba_one','customer','https://m.media-amazon.com/images/I/61cQjE9HnjS.jpg','2023-06-07 12:55:25');

-- Table `category`
CREATE TABLE `category` (
  `categoryid` INT NOT NULL AUTO_INCREMENT,
  `catname` VARCHAR(50) NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`categoryid`),
  UNIQUE KEY (`catname`)
);
INSERT INTO category VALUES
(1, 'Sports', 'Simulating various sports, allowing players to compete in realistic or fantastical athletic events.'),
(2, 'Roguelike', 'A subgenre characterized by procedurally generated levels, permadeath, and random item drops, offering challenging and unpredictable gameplay experiences.'),
(3, 'Shooter', 'Intense gunfights and combat scenarios where players engage in thrilling battles and precise marksmanship.'),
(4, 'Sandbox', 'A relaxing experience where the player possesses the power to manipulate terrain and objects in the world, allowing them to build or destroy at will');
-- Table `platform`
CREATE TABLE `platform` (
  `platformid` INT NOT NULL AUTO_INCREMENT,
  `platform_name` VARCHAR(20) NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`platformid`),
  UNIQUE KEY (`platform_name`)
);
INSERT INTO platform VALUES
(1, 'PC', 'A versatile gaming platform with extensive customization options and a vast library of games.'),
(2, 'XBOX', "Microsoft's console offering immersive gaming experiences, online multiplayer, and a robust entertainment ecosystem."),
(3, 'Mobile', "A convenient way for casual players to play games on the go");

-- Table `game`
CREATE TABLE `game` (
  `gameid` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(50) NOT NULL,
  `description` VARCHAR(300) NOT NULL,
  `year` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`gameid`),
  UNIQUE KEY (`title`)
);
INSERT INTO game VALUES
(1, 'Rocket League', 'High-octane vehicular soccer game where players score goals with rocket-powered cars.', 2015, '2023-06-07 1:24:22'),
(2, 'Counter-Strike: Global Offensive', 'Competitive multiplayer shooter featuring intense team-based gameplay and strategic gunfights.', 2012, '2023-06-07 1:25:53'),
(3, 'Risk of Rain 2', 'Cooperative roguelike shooter with challenging levels, powerful loot, and relentless enemies.', 2018, '2023-06-07 1:26:15'),
(4, 'Terraria', '2D sandbox adventure game with exploration, crafting, and building in procedurally generated worlds.', 2011, '2023-06-07 1:27:12'),
(5, 'Minecraft', 'A blocky game where players have the freedom to mine and craft tools and weapons to slay their enemies', 2011, '2023-06-07 1:29:42');

-- Table `review`
CREATE TABLE `review` (
  `reviewid` INT NOT NULL AUTO_INCREMENT,
  `userid` INT NOT NULL,
  `gameid` INT NOT NULL,
  `content` VARCHAR(1000) NOT NULL,
  `rating` INT NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewid`),
  FOREIGN KEY (`userid`) REFERENCES user (userid),
  FOREIGN KEY (`gameid`) REFERENCES game (gameid) ON DELETE CASCADE
);
ALTER TABLE `review` ADD UNIQUE `unique_review`(`userid`, `gameid`);
INSERT INTO review VALUES
(1, 3, 1, "RL delivers pure adrenaline-fueled fun, combining soccer with rocket-powered cars. It's fast, addictive, and offers thrilling multiplayer matches that keep you coming back for more. The controls are tight, the visuals are vibrant, and the competitive gameplay is exhilarating", 5, '2023-06-07 2:08:25'),
(2, 2, 1, "This game's learning curve can be frustrating, especially for newcomers. The occasional toxic behavior from some players can sour the experience. While fun, the lack of substantial single-player content limits long-term engagement.", 2, '2023-06-07 2:12:56'),
(3, 2, 2, "The game offers intense, skill-based multiplayer action. Its tactical gameplay make it a staple for competitive gamers. The balanced weapon mechanics and strategic map design create thrilling encounters, and the vibrant esports scene adds to its longevity", 4, '2023-06-07 2:18:05'),
(4, 3, 2, "A steep learning curve and high skill ceiling can be intimidating for newcomers. Additionally, the repetitive nature of the gameplay may not appeal to those seeking variety or single-player content.", 1, '2023-06-07 2:21:15'),
(5, 2, 3, "While Risk of Rain 2 is exciting, its difficulty can be punishing, leading to frustrating moments. The procedural generation, while adding variety, occasionally results in unbalanced levels. The lack of a clear progression system or story may not appeal to players seeking a more structured experience.", 3, '2023-06-07 2:31:12'),
(6, 1, 4, "Terraria is a charming and addictive sandbox adventure that combines exploration, crafting, and combat. Its pixelated art style and diverse biomes create a captivating and ever-expanding world to discover.With regular updates and a passionate community, Terraria is a gem of a game.", 5, '2023-06-07 2:51:12'),
(7, 2, 4, "The retro graphics may not appeal to everyone, and the lack of a clear tutorial can make it daunting for new players. The boss fights can feel repetitive and challenging for some, impacting the progression. The building mechanics, while robust, may require significant time investment for elaborate structures.", 3, '2023-06-07 2:52:42'),
(8, 3, 5, "MC is an incredibly immersive and creative game that captivates players of all ages. Its vast open world and endless possibilities for building, exploring, and collaborating make it a truly unique and enjoyable experience.", 5, '2023-06-07 2:55:42');

-- Table `game_and_category`
CREATE TABLE `game_and_category` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `gameid` INT NOT NULL,
    `categoryid` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`gameid`) REFERENCES game (gameid) ON DELETE CASCADE,
    FOREIGN KEY (`categoryid`) REFERENCES category (categoryid)
);
INSERT INTO game_and_category VALUES
(1,1,1),(2,2,3),(3,3,2),(4,3,3),(5,4,4),(6,5,4); 

-- Table `game_and_platform`
CREATE TABLE `game_and_platform` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `gameid` INT NOT NULL,
    `platformid` INT NOT NULL,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`gameid`) REFERENCES game (gameid) ON DELETE CASCADE,
    FOREIGN KEY (`platformid`) REFERENCES platform (platformid)
);
INSERT INTO game_and_platform VALUES
(1,1,1),(2,1,2),(3,2,1),(4,3,1),(5,4,3),(6,5,2),(7,5,3);

-- Table `price`
CREATE TABLE `price` (
	`priceid` INT NOT NULL AUTO_INCREMENT,
    `price` DECIMAL(5,2) NOT NULL,
    `gameid` INT NOT NULL,
    `platformid` INT NOT NULL,
    PRIMARY KEY (`priceid`),
    FOREIGN KEY (`gameid`) REFERENCES game (gameid) ON DELETE CASCADE,
    FOREIGN KEY (`platformid`) REFERENCES platform (platformid)
);
INSERT INTO price VALUES
(1,0.00,1,1),(2,5.00,1,2),(3,15.00,2,1),(4,22.00,3,1),(5,9.99,4,1),(6,5.99,4,3),(7,29.99,5,1),(8,19.99,5,2),(9,10.00,5,3);

-- Table `gameImage`
CREATE TABLE `gameImage` (
  `imageName` VARCHAR(50) NOT NULL,
  `gameid` INT NOT NULL,
  PRIMARY KEY (`gameid`),
  FOREIGN KEY (`gameid`) REFERENCES game (gameid) ON DELETE CASCADE
);
INSERT INTO gameImage VALUES
('1686653864421--rocketleague.jpg',1),('1686653864421--csgo.jpg',2),('1686653864421--riskofrain.jpg',3),('1686653864421--terraria.jpg',4),('1686653864421--minecraft.jpg',5);

SET SQL_SAFE_UPDATES = 0;
CREATE TABLE `cart` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `userid` INT NOT NULL,
    `gameid` INT NOT NULL,
    `platformid` INT NOT NULL,
    `price` DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (`id`),
	FOREIGN KEY (`userid`) REFERENCES user (userid),
    FOREIGN KEY (`gameid`) REFERENCES game (gameid) ON DELETE CASCADE,
    FOREIGN KEY (`platformid`) REFERENCES platform (platformid) ON DELETE CASCADE,
    UNIQUE KEY (`gameid`, `platformid`) 
);
CREATE TABLE `purchase` (
	`id` INT NOT NULL AUTO_INCREMENT,
    `userid` INT NOT NULL,
    `gameid` INT NOT NULL,
    `platformid` INT NOT NULL,
    `price` DECIMAL(5,2) NOT NULL,
	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (`id`),
	FOREIGN KEY (`userid`) REFERENCES user (userid),
    FOREIGN KEY (`gameid`) REFERENCES game (gameid) ON DELETE CASCADE,
    FOREIGN KEY (`platformid`) REFERENCES platform (platformid) ON DELETE CASCADE,
    UNIQUE KEY (`userid`, `gameid`, `platformid`) 
);