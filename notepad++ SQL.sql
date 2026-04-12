CREATE DATABASE creche_db

USE creche_db;

CREATE TABLE status_ferias_enum (
    valor VARCHAR(20) PRIMARY KEY
);

INSERT INTO status_ferias_enum (valor) VALUES 
('Agendado'), ('Cancelado'), ('Em_Andamento');


CREATE TABLE tb_endereco (
    pk_cep VARCHAR(20) PRIMARY KEY,
    numero INT NOT NULL,
    complemento VARCHAR(100)
);

CREATE TABLE tb_telefone (
    pk_id_telefone INT PRIMARY KEY AUTO_INCREMENT,
    pais VARCHAR(20) NOT NULL,
    ddd INT NOT NULL,
    numero VARCHAR(20) NOT NULL,
    tipo VARCHAR(30)
);

CREATE TABLE tb_responsavel1 (
    pk_cpf_responsavel VARCHAR(11) PRIMARY KEY,
    telefone VARCHAR(20) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    sexo INT NOT NULL,
    email VARCHAR(255) NOT NULL,
    grau_parentesco VARCHAR(50) NOT NULL
);

CREATE TABLE tb_responsavel2 (
    pk_cpf_responsavel VARCHAR(11) PRIMARY KEY,
    telefone VARCHAR(20) NOT NULL,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    sexo INT,
    email VARCHAR(255) NOT NULL,
    grau_parentesco VARCHAR(50) NOT NULL
);

CREATE TABLE tb_doencas (
    doencas_cid VARCHAR(20) PRIMARY KEY,
    nome_doenca VARCHAR(255) NOT NULL,
    tipo_doenca VARCHAR(100) NOT NULL,
    especialidade_doenca VARCHAR(50) NOT NULL,
    vacinas VARCHAR(255) NOT NULL
);


CREATE TABLE tb_aluno (
    pk_id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_nascimento DATE NOT NULL,
    raca INT,
    peso VARCHAR(20),
    fk_doencas_cid VARCHAR(20),
    cid_deficiencia VARCHAR(50),
    id_endereco VARCHAR(20) NOT NULL,
    fk_id_telefone INT NOT NULL,
    fk_sexo INT,
    fk_responsavel1 VARCHAR(11) NOT NULL,
    fk_responsavel2 VARCHAR(11)
);

CREATE TABLE tb_alunos_pcd (
    fk_id_aluno INT PRIMARY KEY,
    cid_deficiencia VARCHAR(50) NOT NULL,
    esp_deficiencia VARCHAR(100) NOT NULL,
    idade VARCHAR(20) NOT NULL,
    id_endereco VARCHAR(20) NOT NULL
);

CREATE TABLE tb_funcionarios (
    pk_id_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    pk_cpf_funcionario CHAR(11) NOT NULL UNIQUE,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(50) NOT NULL,
    data_nascimento DATE,
    email VARCHAR(100) NOT NULL,
    id_endereco VARCHAR(20) NOT NULL,
    fk_id_telefone INT NOT NULL,
    sexo INT
);

CREATE TABLE tb_turma (
    pk_id_disciplina INT PRIMARY KEY AUTO_INCREMENT,
    nome_disciplina VARCHAR(100) NOT NULL,
    id_professor INT NOT NULL,
    carga_horaria VARCHAR(50) NOT NULL,
    cor_sala VARCHAR(50) NOT NULL
);

CREATE TABLE tb_matricula (
    pk_id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_aluno INT NOT NULL,
    fk_id_disciplina INT NOT NULL,
    status VARCHAR(20),
    data_matricula DATE,
    turno VARCHAR(10),
    nota DECIMAL(4,2),
);

CREATE TABLE tb_frequencia_alunos (
    id_frequencia INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_aluno INT NOT NULL,
    id_matricula INT NOT NULL,
    id_disciplina INT NOT NULL,
    presenca VARCHAR(50) NOT NULL
);

CREATE TABLE tb_salarios (
    id_salario INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_funcionario INT NOT NULL,
    data_pagamento DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

CREATE TABLE tb_ferias_funcionarios (
    id_ferias INT PRIMARY KEY AUTO_INCREMENT,
    id_funcionario INT NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    data_retorno DATE NOT NULL,
    abono_ferias DECIMAL(10,2) NOT NULL,
    status VARCHAR(20) NOT NULL,
    FOREIGN KEY (status) REFERENCES status_ferias_enum(valor)
);

CREATE TABLE tb_frequencia_funcionarios (
    id_frequencia_funcionario INT PRIMARY KEY AUTO_INCREMENT,
    cpf_funcionario CHAR(11) NOT NULL,
    fk_id_funcionario INT NOT NULL,
    cargo_funcionario INT NOT NULL,
    turno_funcionario DATETIME NOT NULL,
    presenca VARCHAR(100) NOT NULL
);

CREATE TABLE tb_atestados (
    id_atestado INT PRIMARY KEY AUTO_INCREMENT,
    fk_id_aluno INT,
    fk_id_funcionario INT,
    data_entrega DATETIME NOT NULL,
    data_inicio DATE NOT NULL,
    data_fim DATE NOT NULL,
    nome_medico VARCHAR(100) NOT NULL,
    crm_medico VARCHAR(30) NOT NULL
);