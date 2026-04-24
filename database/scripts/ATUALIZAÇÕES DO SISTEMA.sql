-- =============================================================
-- SISTEMA DE ATIVIDADES COMPLEMENTARES - sistema_acc
-- Script de ATUALIZAÇÃO para cumprir os requisitos do PI - ADS-3
-- Executar após o script principal: sistema_acc.sql
-- =============================================================

USE sistema_acc;

-- =============================================================
-- --- ALTER TABLES ---
-- =============================================================

-- Adiciona tipo de arquivo ao Certificado (PDF ou IMAGEM)
ALTER TABLE Certificado
    ADD COLUMN tipo_arquivo ENUM('PDF', 'IMAGEM') NOT NULL DEFAULT 'IMAGEM'
    AFTER arquivo_imagem;

-- -------------------------------------------------------------

-- Torna campos críticos do Certificado obrigatórios (NOT NULL)
-- conforme requisito: "formulário obrigatório para preenchimento de dados críticos"
ALTER TABLE Certificado
    MODIFY titulo_atividade       VARCHAR(255)   NOT NULL,
    MODIFY data_atividade         DATE           NOT NULL,
    MODIFY carga_horaria_informada DECIMAL(6,2)  NOT NULL,
    MODIFY data_envio             DATE           NOT NULL DEFAULT (CURRENT_DATE);

-- =============================================================
-- --- NOVA TABELA: LOG DE AÇÕES ---
-- =============================================================

-- Requisito não funcional: "Registro de logs de ações relevantes"
CREATE TABLE IF NOT EXISTS Log_Acao (
    id_log      INT PRIMARY KEY AUTO_INCREMENT,
    id_usuario  INT          NOT NULL,
    acao        VARCHAR(100) NOT NULL,   -- ex: 'VALIDOU_CERTIFICADO', 'LOGIN', 'CADASTROU_CURSO'
    descricao   TEXT,
    data_hora   DATETIME     NOT NULL DEFAULT NOW(),
    ip_origem   VARCHAR(45),             -- suporta IPv4 e IPv6
    FOREIGN KEY (id_usuario) REFERENCES Usuario(id_usuario)
);

-- -------------------------------------------------------------

CREATE INDEX idx_log_usuario   ON Log_Acao(id_usuario);
CREATE INDEX idx_log_data_hora ON Log_Acao(data_hora);
CREATE INDEX idx_log_acao      ON Log_Acao(acao);

-- =============================================================
-- --- TRIGGERS ---
-- =============================================================

DELIMITER $$

-- Registra log automaticamente ao alterar status de uma validação
CREATE TRIGGER trg_log_validacao
AFTER UPDATE ON Validacao
FOR EACH ROW
BEGIN
    IF NEW.status != OLD.status THEN
        INSERT INTO Log_Acao (id_usuario, acao, descricao, data_hora)
        SELECT
            cert.id_usuario_aluno,
            CONCAT('VALIDACAO_', NEW.status),
            CONCAT(
                'Certificado ID ', NEW.id_certificado,
                ' (', cert.titulo_atividade, ')',
                ' teve status alterado de ', OLD.status,
                ' para ', NEW.status,
                '. Horas validadas: ', COALESCE(NEW.horas_validadas, 0)
            ),
            NOW()
        FROM Certificado cert
        WHERE cert.id_certificado = NEW.id_certificado;
    END IF;
END$$

-- -------------------------------------------------------------

-- Registra log automaticamente ao inserir novo certificado
CREATE TRIGGER trg_log_novo_certificado
AFTER INSERT ON Certificado
FOR EACH ROW
BEGIN
    INSERT INTO Log_Acao (id_usuario, acao, descricao, data_hora)
    VALUES (
        NEW.id_usuario_aluno,
        'ENVIO_CERTIFICADO',
        CONCAT(
            'Certificado enviado: "', NEW.titulo_atividade, '"',
            ' | Carga informada: ', NEW.carga_horaria_informada, 'h',
            ' | Tipo: ', NEW.tipo_arquivo
        ),
        NOW()
    );
END$$

-- -------------------------------------------------------------

-- Registra log ao cadastrar novo usuário
CREATE TRIGGER trg_log_novo_usuario
AFTER INSERT ON Usuario
FOR EACH ROW
BEGIN
    INSERT INTO Log_Acao (id_usuario, acao, descricao, data_hora)
    VALUES (
        NEW.id_usuario,
        'CADASTRO_USUARIO',
        CONCAT('Novo usuário cadastrado: ', NEW.nome, ' | Perfil: ', NEW.perfil),
        NOW()
    );
END$$

DELIMITER ;

-- =============================================================
-- --- VIEWS ---
-- =============================================================

-- Controle de acesso: coordenador visualiza apenas dados do seu curso
-- Requisito: "coordenadores visualizem apenas dados de seus cursos"
CREATE VIEW vw_certificados_por_coordenador AS
SELECT
    coord.id_usuario                AS id_coordenador,
    u_coord.nome                    AS nome_coordenador,
    c.id_curso,
    c.nome_curso,
    u_aluno.nome                    AS aluno,
    a.matricula,
    cert.id_certificado,
    cert.titulo_atividade,
    cert.carga_horaria_informada,
    cert.tipo_arquivo,
    cert.data_envio,
    cert.data_atividade,
    aa.nome_area,
    v.status,
    v.horas_validadas,
    v.observacao,
    v.data_validacao
FROM Coordenador coord
JOIN Usuario u_coord    ON u_coord.id_usuario         = coord.id_usuario
JOIN Coordena co        ON co.id_usuario_coordenador  = coord.id_usuario
JOIN Curso c            ON c.id_curso                 = co.id_curso
JOIN Matriculado_Em me  ON me.id_curso                = c.id_curso
JOIN Aluno a            ON a.id_usuario               = me.id_usuario_aluno
JOIN Usuario u_aluno    ON u_aluno.id_usuario         = a.id_usuario
JOIN Certificado cert   ON cert.id_usuario_aluno      = a.id_usuario
JOIN Area_Atividade aa  ON aa.id_area                 = cert.id_area
JOIN Validacao v        ON v.id_certificado           = cert.id_certificado;

-- -------------------------------------------------------------

-- Dashboard de métricas por área para o coordenador
-- Requisito: "Dashboard com métricas por curso e por área"
CREATE VIEW vw_dashboard_metricas_area AS
SELECT
    c.id_curso,
    c.nome_curso,
    aa.nome_area,
    aa.limite_horas_area,
    COUNT(cert.id_certificado)                              AS total_certificados,
    SUM(CASE WHEN v.status = 'PENDENTE'  THEN 1 ELSE 0 END) AS pendentes,
    SUM(CASE WHEN v.status = 'APROVADO'  THEN 1 ELSE 0 END) AS aprovados,
    SUM(CASE WHEN v.status = 'REPROVADO' THEN 1 ELSE 0 END) AS reprovados,
    COALESCE(SUM(CASE WHEN v.status = 'APROVADO' THEN v.horas_validadas END), 0) AS total_horas_aprovadas,
    ROUND(
        (SUM(CASE WHEN v.status = 'APROVADO' THEN 1 ELSE 0 END) /
         NULLIF(COUNT(cert.id_certificado), 0)) * 100, 2
    )                                                        AS taxa_aprovacao_pct
FROM Curso c
JOIN Matriculado_Em me  ON me.id_curso        = c.id_curso
JOIN Aluno a            ON a.id_usuario       = me.id_usuario_aluno
JOIN Certificado cert   ON cert.id_usuario_aluno = a.id_usuario
JOIN Area_Atividade aa  ON aa.id_area         = cert.id_area
JOIN Validacao v        ON v.id_certificado   = cert.id_certificado
GROUP BY c.id_curso, aa.id_area;

-- -------------------------------------------------------------

-- Log de ações com nome do usuário (facilita auditoria)
CREATE VIEW vw_log_completo AS
SELECT
    l.id_log,
    u.nome          AS usuario,
    u.perfil,
    l.acao,
    l.descricao,
    l.data_hora,
    l.ip_origem
FROM Log_Acao l
JOIN Usuario u ON u.id_usuario = l.id_usuario
ORDER BY l.data_hora DESC;

-- =============================================================
-- --- STORED PROCEDURES ---
-- =============================================================

DELIMITER $$

-- Registra login do usuário nos logs (chamada pela aplicação)
CREATE PROCEDURE sp_registrar_login(
    IN p_id_usuario INT,
    IN p_ip         VARCHAR(45)
)
BEGIN
    INSERT INTO Log_Acao (id_usuario, acao, descricao, ip_origem, data_hora)
    VALUES (
        p_id_usuario,
        'LOGIN',
        'Usuário realizou login no sistema',
        p_ip,
        NOW()
    );
END$$

-- -------------------------------------------------------------

-- Retorna o dashboard de métricas de um coordenador específico
CREATE PROCEDURE sp_dashboard_coordenador(
    IN p_id_coordenador INT
)
BEGIN
    SELECT
        c.nome_curso,
        aa.nome_area,
        COUNT(cert.id_certificado)                                AS total_certificados,
        SUM(CASE WHEN v.status = 'PENDENTE'  THEN 1 ELSE 0 END)  AS pendentes,
        SUM(CASE WHEN v.status = 'APROVADO'  THEN 1 ELSE 0 END)  AS aprovados,
        SUM(CASE WHEN v.status = 'REPROVADO' THEN 1 ELSE 0 END)  AS reprovados,
        COALESCE(SUM(CASE WHEN v.status = 'APROVADO' THEN v.horas_validadas END), 0) AS horas_aprovadas
    FROM Coordena co
    JOIN Curso c            ON c.id_curso            = co.id_curso
    JOIN Matriculado_Em me  ON me.id_curso            = c.id_curso
    JOIN Certificado cert   ON cert.id_usuario_aluno  = me.id_usuario_aluno
    JOIN Area_Atividade aa  ON aa.id_area             = cert.id_area
    JOIN Validacao v        ON v.id_certificado       = cert.id_certificado
    WHERE co.id_usuario_coordenador = p_id_coordenador
    GROUP BY c.id_curso, aa.id_area
    ORDER BY c.nome_curso, aa.nome_area;
END$$

-- -------------------------------------------------------------

-- Lista logs de um usuário específico com filtro opcional de ação
CREATE PROCEDURE sp_logs_usuario(
    IN p_id_usuario INT,
    IN p_acao       VARCHAR(100)   -- NULL para trazer todos
)
BEGIN
    SELECT
        l.acao,
        l.descricao,
        l.data_hora,
        l.ip_origem
    FROM Log_Acao l
    WHERE l.id_usuario = p_id_usuario
      AND (p_acao IS NULL OR l.acao = p_acao)
    ORDER BY l.data_hora DESC;
END$$

DELIMITER ;

-- =============================================================
-- FIM DO SCRIPT DE ATUALIZAÇÃO - sistema_acc_update.sql
-- =============================================================