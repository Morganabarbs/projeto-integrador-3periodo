package edu.br.senac.horascomplementares.service;

import edu.br.senac.horascomplementares.dto.ValidacaoRequestDTO;
import edu.br.senac.horascomplementares.entities.Certificado;
import edu.br.senac.horascomplementares.entities.Validacao;
import edu.br.senac.horascomplementares.repository.CertificadoRepository;
import edu.br.senac.horascomplementares.repository.ValidacaoRepository;
import org.springframework.stereotype.Service;
import java.time.LocalDate;

@Service
public class ValidacaoService {

    private final ValidacaoRepository validacaoRepo;
    private final CertificadoRepository certificadoRepo;

    public ValidacaoService(ValidacaoRepository validacaoRepo,
                             CertificadoRepository certificadoRepo) {
        this.validacaoRepo = validacaoRepo;
        this.certificadoRepo = certificadoRepo;
    }

    public Validacao validar(Integer idCertificado, ValidacaoRequestDTO dto) {
        Certificado cert = certificadoRepo.findById(idCertificado)
            .orElseThrow(() -> new RuntimeException("Certificado não encontrado"));

        if (validacaoRepo.findByCertificado_Id(idCertificado).isPresent()) {
            throw new RuntimeException("Este certificado já foi validado");
        }

        Validacao v = new Validacao();
        v.setCertificado(cert);
        v.setStatus(dto.getStatus());
        v.setObservacao(dto.getObservacao());
        v.setHorasValidadas(dto.getHorasValidadas());
        v.setDataValidacao(LocalDate.now());

        return validacaoRepo.save(v);
    }
}