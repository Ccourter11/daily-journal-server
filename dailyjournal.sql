CREATE TABLE `Entries` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date`	TEXT NOT NULL,
	`concept` TEXT NOT NULL,
	`text` TEXT NOT NULL,
    `moodId` INTEGER,
    FOREIGN KEY(`mood_id`) REFERENCES `moods`(`id`)


);

CREATE TABLE `Moods` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`mood` TEXT NOT NULL

);



SELECT * FROM Entries

INSERT INTO `Entries` VALUES (null, "2021-04-15", "SQL", "databases are deep", 1);
INSERT INTO `Entries` VALUES (null, "2021-04-22", "SQLite", "I have much to learn", 9);
INSERT INTO `Entries` VALUES (null, "2021-04-20", "SQLite", "oh boy", 3);

INSERT INTO `Moods` VALUES (null, "Happy");
INSERT INTO `Moods` VALUES (null, "Relaxed");
INSERT INTO `Moods` VALUES (null, "Confused");
INSERT INTO `Moods` VALUES (null, "Sad");
INSERT INTO `Moods` VALUES (null, "Stressed");
INSERT INTO `Moods` VALUES (null, "Sad");
INSERT INTO `Moods` VALUES (null, "Anxious");
INSERT INTO `Moods` VALUES (null, "Angry");
INSERT INTO `Moods` VALUES (null, "Eager");


SELECT
	e.id,
	e.date,
	e.text,
	e.concept,
	e.moodId,
	m.mood mood
FROM Entries e	
LEFT JOIN Moods m
	ON m.id = e.moodId