-- =============================================================
-- --- TRIGGERS ---
-- =============================================================
 
  USE sistema_acc;
 
DELIMITER $$
 
-- Gera notificação automaticamente ao atualizar status da validação
CREATE TRIGGER trg_notificacao_apos_validacao
AFTER UPDATE ON Validacao
FOR EACH ROW
BEGIN
    IF NEW.status != OLD.status THEN
        INSERT INTO Notificacao (mensagem, canal, tipo, data_envio, id_validacao)
        VALUES (
            CONCAT('Seu certificado foi ', NEW.status),
            'SISTEMA',
            'VALIDACAO',
            NOW(),
            NEW.id_validacao
        );
    END IF;
END$$
 
-- -------------------------------------------------------------
 
-- Impede revalidação de um certificado já aprovado
CREATE TRIGGER trg_bloquear_revalidacao
BEFORE UPDATE ON Validacao
FOR EACH ROW
BEGIN
    IF OLD.status = 'APROVADO' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Validação já aprovada não pode ser alterada.';
    END IF;
END$$
 
-- -------------------------------------------------------------
 
-- Cria registro de Validacao automaticamente ao inserir Certificado
CREATE TRIGGER trg_criar_validacao_ao_inserir_certificado
AFTER INSERT ON Certificado
FOR EACH ROW
BEGIN
    INSERT INTO Validacao (status, id_certificado)
    VALUES ('PENDENTE', NEW.id_certificado);
END$$
 
DELIMITER ;