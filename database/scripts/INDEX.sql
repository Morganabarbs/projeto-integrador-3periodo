-- =============================================================
-- --- ÍNDICES ---
-- =============================================================
 
CREATE INDEX idx_certificado_aluno   ON Certificado(id_usuario_aluno);
CREATE INDEX idx_certificado_area    ON Certificado(id_area);
CREATE INDEX idx_validacao_status    ON Validacao(status);
CREATE INDEX idx_notificacao_data    ON Notificacao(data_envio);
CREATE INDEX idx_usuario_email       ON Usuario(email);
CREATE INDEX idx_regra_coordenador   ON Regra(id_usuario_coordenador);
CREATE INDEX idx_regra_area          ON Regra(id_area);