import { useState, useEffect, useCallback } from 'react';
import { listarCertificadosDoAluno, enviarCertificado, listarTodosCertificados } from '../services/certificado.service';

export function useCertificados(idAluno) {
  const [certificados, setCertificados] = useState([]);
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState(null);

  const carregarCertificados = useCallback(async () => {
    if (!idAluno) return;
    setLoading(true);
    try {
      const data = await listarCertificadosDoAluno(idAluno);
      setCertificados(data);
    } catch (err) {
      setError('Erro ao carregar certificados');
      console.error(err);
    } finally {
      setLoading(false);
    }
  }, [idAluno]);

  const carregarTodosCertificados = useCallback(async () => {
    setLoading(true);
    try {
      const data = await listarTodosCertificados();
      setCertificados(data);
    } catch (err) {
      setError('Erro ao carregar todos os certificados');
      console.error(err);
    } finally {
      setLoading(false);
    }
  }, []);

  const enviar = async (dados, arquivo) => {
    if (!idAluno) return;
    setLoading(true);
    try {
      const novo = await enviarCertificado(idAluno, dados, arquivo);
      setCertificados((prev) => [novo, ...prev]);
      return novo;
    } catch (err) {
      setError('Erro ao enviar certificado');
      throw err;
    } finally {
      setLoading(false);
    }
  };

  useEffect(() => {
    if (idAluno) carregarCertificados();
  }, [idAluno, carregarCertificados]);

  return {
    certificados,
    loading,
    error,
    enviar,
    carregarCertificados,
    carregarTodosCertificados
  };
}
