CREATE TABLE `Entries` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`date`	TEXT NOT NULL,
	`concept`	TEXT NOT NULL,
    `text`  TEXT,
    `moodId` INTEGER,
    FOREIGN KEY(`moodId`) REFERENCES `moods`(`id`)


);

CREATE TABLE `Moods` (
	`id`	INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
	`mood` TEXT NOT NULL

);