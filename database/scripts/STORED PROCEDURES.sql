-- =============================================================
-- --- STORED PROCEDURES ---
-- =============================================================
 
  USE sistema_acc;
 
DELIMITER $$
 
-- Verifica se aluno completou a carga horária exigida no curso
CREATE PROCEDURE sp_verificar_conclusao(
    IN p_id_aluno INT,
    IN p_id_curso INT
)
BEGIN
    DECLARE total_horas   DECIMAL(6,2) DEFAULT 0;
    DECLARE carga_exigida DECIMAL(6,2) DEFAULT 0;
 
    SELECT COALESCE(SUM(v.horas_validadas), 0) INTO total_horas
    FROM Certificado c
    JOIN Validacao v ON v.id_certificado = c.id_certificado
    WHERE c.id_usuario_aluno = p_id_aluno
      AND v.status = 'APROVADO';
 
    SELECT carga_total_exigida INTO carga_exigida
    FROM Curso
    WHERE id_curso = p_id_curso;
 
    IF total_horas >= carga_exigida THEN
        SELECT 'CONCLUÍDO - Carga horária completa!' AS resultado,
               total_horas,
               carga_exigida;
    ELSE
        SELECT 'PENDENTE - Horas insuficientes' AS resultado,
               total_horas,
               carga_exigida,
               (carga_exigida - total_horas) AS horas_faltando;
    END IF;
END$$
 
-- -------------------------------------------------------------
 
-- Lista todos os certificados de um aluno com seus status
CREATE PROCEDURE sp_certificados_aluno(
    IN p_id_aluno INT
)
BEGIN
    SELECT
        cert.id_certificado,
        cert.titulo_atividade,
        cert.carga_horaria_informada,
        cert.data_envio,
        aa.nome_area,
        v.status,
        v.horas_validadas,
        v.observacao
    FROM Certificado cert
    JOIN Area_Atividade aa ON cert.id_area         = aa.id_area
    JOIN Validacao v       ON v.id_certificado     = cert.id_certificado
    WHERE cert.id_usuario_aluno = p_id_aluno
    ORDER BY cert.data_envio DESC;
END$$
 
DELIMITER ;
 
-- =============================================================
-- FIM DO SCRIPT - sistema_acc
-- =============================================================