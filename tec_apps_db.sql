use tec_apps_db;

CREATE TABLE matriculas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    status VARCHAR(100) NOT NULL,
    estudante_id INT,
    turma_id INT
) ENGINE=INNODB;

CREATE TABLE turmas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    docente_id INT,
    nivel_id INT,
    data_inicio DATE,
    createdAt DATE,
    updatedAt DATE,
    matricula_id INT
) ENGINE=INNODB;

CREATE TABLE niveis(
    id INT AUTO_INCREMENT PRIMARY KEY,
    descr_nivel VARCHAR(100),
    nivel_id INT,
    createdAt DATE,
    updatedAt DATE
) ENGINE=INNODB;

CREATE TABLE pessoas(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    ativo BOOLEAN,
    email VARCHAR(50),
    role VARCHAR(50),
    docente_id INT,
    matriculas_id INT,
    createdAt DATE,
    updatedAt DATE
) ENGINE=INNODB;

INSERT INTO turmas (docente_id, nivel_id, data_inicio, createdAt, updatedAt, matricula_id)
VALUES (1, 1, STR_TO_DATE("10-17-2021", "%m-%d-%Y"), STR_TO_DATE("10-17-2021", "%m-%d-%Y"), STR_TO_DATE("10-17-2021", "%m-%d-%Y"), 1 );
