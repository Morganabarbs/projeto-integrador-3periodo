CREATE DATABASE sistema_acc;
USE sistema_acc;

-- =============================================
-- SCRIPT DE CRIAÇÃO DAS TABELAS - MYSQL
-- =============================================

-- Tabela Usuario (entidade pai de Aluno e Coordenador)
CREATE TABLE Usuario (
    id_usuario INT PRIMARY KEY AUTO_INCREMENT,
    senha VARCHAR(255) NOT NULL,
    nome VARCHAR(100) NOT NULL,
    perfil VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- Tabela Aluno (especialização de Usuario)
CREATE TABLE Aluno (
    id_usuario INT PRIMARY KEY,
    matricula VARCHAR(20) NOT NULL UNIQUE,
    periodo INT,
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Tabela Coordenador (especialização de Usuario)
CREATE TABLE Coordenador (
    id_usuario INT PRIMARY KEY,
    id_coordenador INT NOT NULL UNIQUE,
    departamento VARCHAR(100),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- Tabela Curso
CREATE TABLE Curso (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100) NOT NULL,
    carga_total_exigida DECIMAL(6,2) NOT NULL
);

-- Tabela Area_Atividade
CREATE TABLE Area_Atividade (
    id_area INT PRIMARY KEY AUTO_INCREMENT,
    nome_area VARCHAR(100) NOT NULL,
    limite_horas_area DECIMAL(6,2)
);

-- Tabela Regra
CREATE TABLE Regra (
    id_regra INT PRIMARY KEY AUTO_INCREMENT,
    descricao TEXT,
    limite_horas DECIMAL(6,2),
    tipo_atividade VARCHAR(100)
);

-- Tabela Certificado
CREATE TABLE Certificado (
    id_certificado INT PRIMARY KEY AUTO_INCREMENT,
    nome_ocr VARCHAR(255),
    arquivo_imagem VARCHAR(255),
    carga_horaria_informada DECIMAL(6,2),
    data_envio DATE,
    data_atividade DATE,
    titulo_atividade VARCHAR(255),
    data_ocr DATE,
    carga_horario_ocr DECIMAL(6,2),
    id_area INT NOT NULL,
    id_usuario_aluno INT NOT NULL,  -- quem enviou (Aluno)
    FOREIGN KEY (id_area) REFERENCES Area_Atividade(id_area),
    FOREIGN KEY (id_usuario_aluno) REFERENCES Aluno(id_usuario)
);

-- Tabela Validacao
CREATE TABLE Validacao (
    id_validacao INT PRIMARY KEY AUTO_INCREMENT,
    observacao TEXT,
    status VARCHAR(50) NOT NULL,
    data_validacao DATE,
    horas_validadas DECIMAL(6,2),
    id_certificado INT NOT NULL UNIQUE,  -- (1,1) com Certificado
    FOREIGN KEY (id_certificado) REFERENCES Certificado(id_certificado)
);

-- Tabela Notificacao
CREATE TABLE Notificacao (
    id_notificacao INT PRIMARY KEY AUTO_INCREMENT,
    mensagem TEXT,
    canal VARCHAR(50),
    tipo VARCHAR(50),
    data_envio DATETIME,
    id_validacao INT NOT NULL,  -- gerada por Validacao (1,1)
    FOREIGN KEY (id_validacao) REFERENCES Validacao(id_validacao)
);

-- =============================================
-- TABELAS DE RELACIONAMENTO (N:M)
-- =============================================

-- Aluno matriculado em Curso (N:M)
CREATE TABLE Matriculado_Em (
    id_usuario_aluno INT NOT NULL,
    id_curso INT NOT NULL,
    PRIMARY KEY (id_usuario_aluno, id_curso),
    FOREIGN KEY (id_usuario_aluno) REFERENCES Aluno(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Coordenador coordena Curso (N:M -> 0,n : 1,1)
CREATE TABLE Coordena (
    id_usuario_coordenador INT NOT NULL,
    id_curso INT NOT NULL,
    PRIMARY KEY (id_usuario_coordenador, id_curso),
    FOREIGN KEY (id_usuario_coordenador) REFERENCES Coordenador(id_usuario),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso)
);

-- Coordenador cadastra Regra (1,1 : 0,n -> FK na Regra)
ALTER TABLE Regra
    ADD COLUMN id_usuario_coordenador INT NOT NULL,
    ADD FOREIGN KEY (id_usuario_coordenador) REFERENCES Coordenador(id_usuario);

-- Curso aplica_se_a Regra (N:M)
CREATE TABLE Aplica_Se_A (
    id_curso INT NOT NULL,
    id_regra INT NOT NULL,
    PRIMARY KEY (id_curso, id_regra),
    FOREIGN KEY (id_curso) REFERENCES Curso(id_curso),
    FOREIGN KEY (id_regra) REFERENCES Regra(id_regra)
);

-- Regra pertence_a Area_Atividade (N:M -> 0,n : 1,1)
-- Como Area tem cardinalidade (1,1), a FK fica na Regra
ALTER TABLE Regra
    ADD COLUMN id_area INT NOT NULL,
    ADD FOREIGN KEY (id_area) REFERENCES Area_Atividade(id_area);

-- Usuario recebe Notificacao (N:M -> 0,n : 0,n)
CREATE TABLE Recebe (
    id_usuario INT NOT NULL,
    id_notificacao INT NOT NULL,
    PRIMARY KEY (id_usuario, id_notificacao),
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario),
    FOREIGN KEY (id_notificacao) REFERENCES Notificacao(id_notificacao)
);