<<<<<<< Updated upstream
DROP TABLE IF EXISTS `user`

CREATE TABLE `user` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`first_name` varchar(255) NOT NULL,,
=======
DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
>>>>>>> Stashed changes
`player` boolean,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

<<<<<<< Updated upstream
INSERT INTO `user` (`first_name`, `player`) VALUES ('Kris', true), ('Shauna', true), ('Kasie', true), ('Carrie', true), ('Blake', true), ('Patrick', false);

---------------------------------------------------------------------

DROP TABLE IF EXISTS `planets`
=======
INSERT INTO `user` (`name`, `player`) VALUES ('Kris', true), ('Shauna', true), ('Kasie', true), ('Carrie', true), ('Blake', true), ('Patrick', false);


DROP TABLE IF EXISTS `planets`;
>>>>>>> Stashed changes

CREATE TABLE `planets` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `planets` (`name`) VALUES ('Naboo'), ('Hoth'), ('Tatooine'), ('Coruscant'), ('Dagobah'), ('Alderaan'), ('Bespin'), ('Yavin'), ('Kashyyyk');

<<<<<<< Updated upstream
---------------------------------------------------------------------

DROP TABLE IF EXISTS `race`
=======

DROP TABLE IF EXISTS `race`;
>>>>>>> Stashed changes

CREATE TABLE `race` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `race` (`name`) VALUES ('Wookie'), ('Sullustan'), ('Human'), ('Gamorrean'), ('Mon Calamari'), ('Chagrian');

<<<<<<< Updated upstream
---------------------------------------------------------------------

DROP TABLE IF EXISTS `player_character`
=======

DROP TABLE IF EXISTS `player_character`;
>>>>>>> Stashed changes

CREATE TABLE `player_character` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`first_name` varchar(255) NOT NULL,
`last_name` varchar(255),
`u_id` int(11),
`homeworld` int(11),
`race` int(11),
PRIMARY KEY (`id`),
CONSTRAINT FOREIGN KEY (`homeworld`) 
REFERENCES `planets` (`id`) 
ON DELETE SET NULL 
ON UPDATE CASCADE,
CONSTRAINT FOREIGN KEY (`u_id`)
REFERENCES `user` (`id`)
ON DELETE SET NULL
ON UPDATE CASCADE,
CONSTRAINT FOREIGN KEY (`race`)
REFERENCES `race` (`id`)
ON DELETE SET NULL
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

<<<<<<< Updated upstream
---------------------------------------------------------------------

DROP TABLE IF EXISTS `non_player_character`
=======

DROP TABLE IF EXISTS `non_player_character`;
>>>>>>> Stashed changes

CREATE TABLE `non_player_character` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`first_name` varchar(255) NOT NULL,
`last_name` varchar(255),
`homeworld` int(11),
`race` int(11),
PRIMARY KEY (`id`),
CONSTRAINT FOREIGN KEY (`homeworld`) 
REFERENCES `planets` (`id`) 
ON DELETE SET NULL 
ON UPDATE CASCADE,
CONSTRAINT FOREIGN KEY (`race`)
REFERENCES `race` (`id`)
ON DELETE SET NULL
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

<<<<<<< Updated upstream
---------------------------------------------------------------------
=======
>>>>>>> Stashed changes

/*DROP TABLE IF EXISTS `character_relationship`

CREATE TABLE `character_relationship` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`char1_id` int(11),
)
Not sure about this table. Want to log relationship between two characters, and identify pc/npc status for each one of each pair. Might need to reorganize other tables: merge non_player_character and player_character? Include boolean variable, is_player?
*/

<<<<<<< Updated upstream
---------------------------------------------------------------------

DROP TABLE IF EXISTS `game`
=======

DROP TABLE IF EXISTS `game`;
>>>>>>> Stashed changes

CREATE TABLE `game` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`start_date` datetime,
`open` boolean,
PRIMARY KEY (`id`)
) ENGINE=INNODB DEFAULT CHARSET=latin1;

<<<<<<< Updated upstream
---------------------------------------------------------------------

DROP TABLE IF EXISTS `player_game`
=======

DROP TABLE IF EXISTS `player_game`;
>>>>>>> Stashed changes

CREATE TABLE `player_game` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`game_id` int(11),
`pc_id` int(11),
PRIMARY KEY (`id`),
CONSTRAINT FOREIGN KEY (`game_id`) 
REFERENCES `game` (`id`) 
ON DELETE SET NULL 
ON UPDATE CASCADE,
CONSTRAINT FOREIGN KEY (`pc_id`) 
REFERENCES `user` (`id`) 
ON DELETE SET NULL 
<<<<<<< Updated upstream
ON UPDATE CASCADE,
) ENGINE=INNODB DEFAULT CHARSET=latin1;

---------------------------------------------------------------------

DROP TABLE IF EXISTS `attributes`
=======
ON UPDATE CASCADE
) ENGINE=INNODB DEFAULT CHARSET=latin1;


DROP TABLE IF EXISTS `attributes`;
>>>>>>> Stashed changes

CREATE TABLE `attributes` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(255) NOT NULL,
`description` varchar(255),
<<<<<<< Updated upstream
PRIMARY KEY (`id`),
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `attributes` (`name`, `description`) VALUES ('Dexterity', 'General hand-eye coordination'), ('Knowledge', 'Your understanding of the galaxy'), ('Mechanical', 'How well your character operates mechanical devices'), ('Perception', 'How observant your character is'), ('Strength', 'How physically strong and tough your character is'), ('Technical', 'Your character\'s ability to fix mechanical objects');
---------------------------------------------------------------------

DROP TABLE IF EXISTS `skills`
=======
PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO `attributes` (`name`, `description`) VALUES ('Dexterity', 'General hand-eye coordination'), ('Knowledge', 'Your understanding of the galaxy'), ('Mechanical', 'How well your character operates mechanical devices'), ('Perception', 'How observant your character is'), ('Strength', 'How physically strong and tough your character is'), ('Technical', 'Your character\'s ability to fix mechanical objects');


DROP TABLE IF EXISTS `skills`;
>>>>>>> Stashed changes

CREATE TABLE `skills` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`att_id` int(11) NOT NULL,
`name` varchar(255) NOT NULL,
`description` varchar(255),
PRIMARY KEY (`id`),
CONSTRAINT FOREIGN KEY (`att_id`)
REFERENCES `attributes` (`id`)
<<<<<<< Updated upstream
ON DELETE SET NULL
=======
ON DELETE CASCADE
>>>>>>> Stashed changes
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

SET @dex := (SELECT `id` FROM `attributes` WHERE `name` = 'Dexterity');
SET @know := (SELECT `id` FROM `attributes` WHERE `name` = 'Knowledge');
SET @mech := (SELECT `id` FROM `attributes` WHERE `name` = 'Mechanical');
SET @perc := (SELECT `id` FROM `attributes` WHERE `name` = 'Perception');
SET @stre := (SELECT `id` FROM `attributes` WHERE `name` = 'Strength');
SET @tech := (SELECT `id` FROM `attributes` WHERE `name` = 'Technical');
INSERT INTO `skills` (`att_id`, `name`) VALUES (@dex, 'Archaic Guns'), (@dex, 'Blaster'), (@dex, 'Blaster Artillery'), (@dex, 'Bowcaster'), (@dex, 'Bows'), (@dex, 'Brawling Parry'), (@dex, 'Dodge'), (@dex, 'Firearms'), (@dex, 'Grenade'), (@dex, 'Lightsaber'), (@dex, 'Melee Combat'), (@dex, 'Melee Parry'), (@dex, 'Missle Weapons'), (@dex, 'Pick Pocket'), (@dex, 'Running'), (@dex, 'Thrown Weapons'), (@dex, 'Vehicle Blasters'), (@know, 'Alien Species'), (@know, 'Business'), (@know, 'Bureaucracy'), (@know, 'Cultures'), (@know, 'Intimidation'), (@know, 'Languages'), (@know, 'Law Enforcement'), (@know, 'Planetary Systems'), (@know, 'Streetwise'), (@know, 'Survival'), (@know, 'Value'), (@know, 'Willpower'), (@mech, 'Archaic Starship Piloting'), (@mech, 'Astrogation'), (@mech, 'Beast Riding'), (@mech, 'Capital Ship Gunnery'), (@mech, 'Capital Ship Piloting'), (@mech, 'Capital Ship Shields'), (@mech, 'Communications'), (@mech, 'Ground Vehicle Operation'), (@mech, 'Hover Vehicle Operation'), (@mech, 'Powersuit Operation'), (@mech, 'Repulsorlift Operation'), (@mech, 'Sensors'), (@mech, 'Space Transports'), (@mech, 'Starfighter Piloting'), (@mech, 'Starship Gunnery'), (@mech, 'Starship Shields'), (@mech, 'Swoop Operation'), (@mech, 'Walker Operation'), (@perc, 'Bargain'), (@perc, 'Command'), (@perc, 'Con'), (@perc, 'Forgery'), (@perc, 'Gambling'), (@perc, 'Hide'), (@perc, 'Investigation'), (@perc, 'Persuasion'), (@perc, 'Search'), (@perc, 'Sneak'), (@stre, 'Brawling'), (@stre, 'Climbing/Jumping'), (@stre, 'Lifting'), (@stre, 'Stamina'), (@stre, 'Swimming'), (@tech, 'Armor Repair'), (@tech, 'Blaster Repair'), (@tech, 'Capital Starship Repair'), (@tech, 'Capital Starship Weapon Repair'), (@tech, 'Demolition'), (@tech, 'Computer Programming/Repair'), (@tech, 'Droid Programming'), (@tech, 'Droid Repair'), (@tech, 'First Aid'), (@tech, 'Ground Vehicle Repair'), (@tech, 'Hover Vehicle Repair'), (@tech, '(A) Medicine'), (@tech, 'Repulsorlift Repair'), (@tech, 'Security'), (@tech, 'Space Transports Repair'), (@tech, 'Starfighter Repair'), (@tech, 'Starship Weapon Repair'), (@tech, 'Walker Repair'); 
<<<<<<< Updated upstream
---------------------------------------------------------------------

DROP TABLE IF EXISTS `character_skills`
=======


DROP TABLE IF EXISTS `character_skills`;
>>>>>>> Stashed changes

CREATE TABLE `character_skills` (
`id` int(11) NOT NULL AUTO_INCREMENT,
`pc_id` int(11),
`skill_id` int(11),
`points` int(11),
`nibs` int(11),
PRIMARY KEY (`id`),
CONSTRAINT FOREIGN KEY (`pc_id`) 
REFERENCES `player_character` (`id`) 
ON DELETE SET NULL 
ON UPDATE CASCADE,
CONSTRAINT FOREIGN KEY (`skill_id`)
REFERENCES `skills` (`id`)
ON DELETE SET NULL
<<<<<<< Updated upstream
ON UPDATE CASCADE,
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

---------------------------------------------------------------------
=======
ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

>>>>>>> Stashed changes
