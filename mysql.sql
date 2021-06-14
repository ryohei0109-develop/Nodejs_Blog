-- ユーザ作成
CREATE USER 'user01'@'localhost' IDENTIFIED BY 'testpassword';

ALTER USER 'user01'@'localhost' IDENTIFIED WITH mysql_native_password BY 'testpassword';

-- DB作成
CREATE DATABASE nodejs_blog DEFAULT CHARACTER SET UTF8;

-- 権限付与
GRANT ALL on nodejs_blog.* to 'user01'@'localhost';

USE nodejs_blog

-- テーブル作成

CREATE TABLE `users`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `username` VARCHAR(32) NOT NULL,
    `email` VARCHAR(255) NOT NULL UNIQUE,
    `password` VARCHAR(255) NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE `articles`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(32) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `summary` TEXT NOT NULL,
    `content` TEXT NOT NULL,
    `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `updated_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- データ挿入
INSERT INTO `users` (
    `username`, `email`, `password`
) VALUES
('testuser', 'test@gmail.com', 'password');

INSERT INTO `articles` (
    `category`, `title`, `summary`, `content`
) VALUES
('all', '一般記事です', '概要です', '本文です'),
('limited', '限定記事です', '概要です', '本文です');
