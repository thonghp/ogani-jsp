CREATE
    DATABASE `bookstoredb`;

USE
    `bookstoredb`;

CREATE TABLE `role`
(
    `role_id` int         NOT NULL AUTO_INCREMENT,
    `name`    varchar(40) NOT NULL,
    PRIMARY KEY (`role_id`),
    UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;

CREATE TABLE `user`
(
    `user_id`   int                             NOT NULL AUTO_INCREMENT,
    `email`     varchar(128) CHARACTER SET utf8 NOT NULL,
    `password`  varchar(64) CHARACTER SET utf8  NOT NULL,
    `full_name` varchar(150) CHARACTER SET utf8 NOT NULL,
    `enabled`   bit(1)                          NOT NULL,
    `photos`    varchar(64) DEFAULT NULL,
    `role_id`   int                             NOT NULL,
    PRIMARY KEY (`user_id`),
    UNIQUE KEY `email_UNIQUE` (`email`),
    KEY `role_fk_idx` (`role_id`),
    CONSTRAINT `role_fk` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB
  AUTO_INCREMENT = 3
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
  

CREATE TABLE `category`
(
    `category_id` int                             NOT NULL AUTO_INCREMENT,
    `name`        varchar(128) CHARACTER SET utf8 NOT NULL,
    `alias`       varchar(256) CHARACTER SET utf8 NOT NULL,
    `enabled`     bit(1)                          NOT NULL,
    PRIMARY KEY (`category_id`),
    UNIQUE KEY `category_id_UNIQUE` (`category_id`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 11
  DEFAULT CHARSET = utf8mb4
  COLLATE = utf8mb4_0900_ai_ci;
  