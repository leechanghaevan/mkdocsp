-- F9 to execute
CREATE TABLE tb_test (
    uid INT NOT NULL PRIMARY KEY AUTO_INCREMENT COMMENT 'primary key',
    created_time DATETIME COMMENT 'created time',
    updated_time DATETIME COMMENT 'updated time',
    name VARCHAR (255) COMMENT '',
    age INT COMMENT ''
) DEFAULT CHARSET utf8 COMMENT ''