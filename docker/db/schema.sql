CREATE TABLE IF NOT EXISTS `users`
(
    `id`                  BIGINT(20) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    `name`                VARCHAR(256) NOT NULL,
    `created_at`          DATETIME DEFAULT CURRENT_TIMESTAMP, 
    `updated_at`          DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4;


CREATE TABLE IF NOT EXISTS `characters_master`
(
    `id`                  BIGINT(20) UNSIGNED PRIMARY KEY,
    `name`                VARCHAR(50) NOT NULL
) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4;

-- Insert the default data.
INSERT INTO characters_master (id, name) VALUES (1, "Python");
INSERT INTO characters_master (id, name) VALUES (2, "Golang");
INSERT INTO characters_master (id, name) VALUES (3, "Jupyter");
INSERT INTO characters_master (id, name) VALUES (4, "C#");
INSERT INTO characters_master (id, name) VALUES (5, "JavaScript");


CREATE TABLE IF NOT EXISTS `characters_lottery_rate`
(
    `id`                  BIGINT(20) UNSIGNED PRIMARY KEY,
    `character_id`        BIGINT(20) UNSIGNED NOT NULL,
    `lottery_rate`        FLOAT NOT NULL DEFAULT 0.0,
    FOREIGN KEY(character_id) REFERENCES characters_master(id)
) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4;

-- Insert the default data.
INSERT INTO characters_lottery_rate (id, character_id, lottery_rate) VALUES (1, 1, 0.3);
INSERT INTO characters_lottery_rate (id, character_id, lottery_rate) VALUES (2, 2, 0.4);
INSERT INTO characters_lottery_rate (id, character_id, lottery_rate) VALUES (3, 3, 0.1);
INSERT INTO characters_lottery_rate (id, character_id, lottery_rate) VALUES (4, 4, 0.2);
INSERT INTO characters_lottery_rate (id, character_id, lottery_rate) VALUES (5, 5, 0.1);

CREATE TABLE IF NOT EXISTS `characters_lottery_rate_description`
(
    `characters_lottery_rate_id` BIGINT(20) UNSIGNED NOT NULL,
    `description`                VARCHAR(255),
    FOREIGN KEY(characters_lottery_rate_id) REFERENCES characters_lottery_rate(id)
) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4;

-- Insert the default data.
INSERT INTO characters_lottery_rate_description (characters_lottery_rate_id, description) VALUES (1, "Python's rate group is 0.3");
INSERT INTO characters_lottery_rate_description (characters_lottery_rate_id, description) VALUES (2, "Golang rate group is 0.4");
INSERT INTO characters_lottery_rate_description (characters_lottery_rate_id, description) VALUES (3, "Jupyter rate group is 0.1");
INSERT INTO characters_lottery_rate_description (characters_lottery_rate_id, description) VALUES (4, "C# rate group is 0.2");
INSERT INTO characters_lottery_rate_description (characters_lottery_rate_id, description) VALUES (5, "JS rate group is 0.1");

CREATE TABLE IF NOT EXISTS `possession_characters`
(
    `user_id`       BIGINT(20) UNSIGNED NOT NULL,
    `character_id`  BIGINT(20) UNSIGNED NOT NULL,
    `character_seq` BIGINT(20) UNSIGNED NOT NULL,
    FOREIGN KEY(user_id) REFERENCES users(id),
    FOREIGN KEY(character_id) REFERENCES characters_master(id)
) ENGINE = InnoDB
    DEFAULT CHARSET = utf8mb4;