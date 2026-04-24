-- =============================================================
-- --- VIEWS ---
-- =============================================================
 
  USE sistema_acc;
 
-- Horas totais validadas por aluno em cada curso
CREATE VIEW vw_horas_por_aluno AS
SELECT
    u.nome                                                      AS aluno,
    a.matricula,
    c.nome_curso,
    COALESCE(SUM(v.horas_validadas), 0)                        AS total_horas_validadas,
    c.carga_total_exigida,
    (c.carga_total_exigida - COALESCE(SUM(v.horas_validadas), 0)) AS horas_restantes
FROM Aluno a
JOIN Usuario u         ON a.id_usuario    = u.id_usuario
JOIN Matriculado_Em me ON a.id_usuario    = me.id_usuario_aluno
JOIN Curso c           ON me.id_curso     = c.id_curso
LEFT JOIN Certificado cert ON cert.id_usuario_aluno = a.id_usuario
LEFT JOIN Validacao v  ON v.id_certificado = cert.id_certificado
                       AND v.status = 'APROVADO'
GROUP BY a.id_usuario, c.id_curso;
 
-- -------------------------------------------------------------
 
-- Certificados pendentes de validação
CREATE VIEW vw_certificados_pendentes AS
SELECT
    u.nome                      AS aluno,
    a.matricula,
    cert.titulo_atividade,
    cert.carga_horaria_informada,
    cert.data_envio,
    aa.nome_area,
    v.status
FROM Certificado cert
JOIN Aluno a          ON cert.id_usuario_aluno = a.id_usuario
JOIN Usuario u        ON a.id_usuario           = u.id_usuario
JOIN Area_Atividade aa ON cert.id_area          = aa.id_area
JOIN Validacao v      ON v.id_certificado       = cert.id_certificado
WHERE v.status = 'PENDENTE';
 
-- -------------------------------------------------------------
 
-- Notificações recebidas por usuário
CREATE VIEW vw_notificacoes_usuario AS
SELECT
    u.nome          AS usuario,
    n.mensagem,
    n.canal,
    n.tipo,
    n.data_envio
FROM Recebe r
JOIN Usuario u      ON r.id_usuario      = u.id_usuario
JOIN Notificacao n  ON r.id_notificacao  = n.id_notificacao
ORDER BY n.data_envio DESC;