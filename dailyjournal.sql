CREATE TABLE `Entries` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date`	TEXT NOT NULL,
	`concept`	TEXT NOT NULL,
    `text`  TEXT,
    `moodId` INTEGER,
    FOREIGN KEY(`mood_id`) REFERENCES `moods`(`id`)


);

CREATE TABLE `Moods` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`mood` TEXT NOT NULL

);



SELECT * FROM Entries

INSERT INTO `Moods` VALUES (null, "Happy");
INSERT INTO `Moods` VALUES (null, "Relaxed");
INSERT INTO `Moods` VALUES (null, "Confused");
INSERT INTO `Moods` VALUES (null, "Sad");


INSERT INTO `Entries` VALUES (null, '2021-03-16', 'React', 'React is hard', 3)
INSERT INTO `Entries` VALUES (null, '2021-03-22', 'Capstone', 'This is hard',3)



