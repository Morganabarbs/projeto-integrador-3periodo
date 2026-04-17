package edu.br.senac.horascomplementares.service;

import edu.br.senac.horascomplementares.dto.CertificadoRequestDTO;
import edu.br.senac.horascomplementares.dto.CertificadoResponseDTO;
import edu.br.senac.horascomplementares.entities.Aluno;
import edu.br.senac.horascomplementares.entities.AreaAtividade;
import edu.br.senac.horascomplementares.entities.Certificado;
import edu.br.senac.horascomplementares.repository.AlunoRepository;
import edu.br.senac.horascomplementares.repository.AreaAtividadeRepository;
import edu.br.senac.horascomplementares.repository.CertificadoRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class CertificadoService {

    private final CertificadoRepository certificadoRepo;
    private final AlunoRepository alunoRepo;
    private final AreaAtividadeRepository areaRepo;

    public CertificadoService(CertificadoRepository certificadoRepo,
                               AlunoRepository alunoRepo,
                               AreaAtividadeRepository areaRepo) {
        this.certificadoRepo = certificadoRepo;
        this.alunoRepo = alunoRepo;
        this.areaRepo = areaRepo;
    }

    public CertificadoResponseDTO enviar(
            Integer idAluno,
            CertificadoRequestDTO dto,
            MultipartFile arquivo) throws IOException {

        Aluno aluno = alunoRepo.findById(idAluno)
            .orElseThrow(() -> new RuntimeException("Aluno não encontrado"));

        AreaAtividade area = areaRepo.findById(dto.getIdArea())
            .orElseThrow(() -> new RuntimeException("Área não encontrada"));

        String nomeArquivo = System.currentTimeMillis() + "_" + arquivo.getOriginalFilename();
        Path destino = Paths.get("uploads/certificados").resolve(nomeArquivo);
        Files.createDirectories(destino.getParent());
        Files.copy(arquivo.getInputStream(), destino, StandardCopyOption.REPLACE_EXISTING);

        Certificado cert = new Certificado();
        cert.setTituloAtividade(dto.getTituloAtividade());
        cert.setCargaHorariaInformada(dto.getCargaHorariaInformada());
        cert.setDataAtividade(dto.getDataAtividade());
        cert.setDataEnvio(LocalDate.now());
        cert.setArquivoImagem(nomeArquivo);
        cert.setAluno(aluno);
        cert.setArea(area);

        certificadoRepo.save(cert);

        return toDTO(cert);
    }

    public List<CertificadoResponseDTO> listarDoAluno(Integer idAluno) {
        Aluno aluno = alunoRepo.findById(idAluno)
            .orElseThrow(() -> new RuntimeException("Aluno não encontrado"));
        return certificadoRepo.findByAluno(aluno)
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    public List<CertificadoResponseDTO> listarTodos() {
        return certificadoRepo.findAll()
                .stream()
                .map(this::toDTO)
                .collect(Collectors.toList());
    }

    private CertificadoResponseDTO toDTO(Certificado c) {
        String status = c.getValidacao() != null
                ? c.getValidacao().getStatus()
                : "PENDENTE";
        return new CertificadoResponseDTO(
            c.getId(),
            c.getTituloAtividade(),
            c.getCargaHorariaInformada(),
            c.getDataEnvio(),
            c.getAluno().getNome(),
            status,
            c.getArea().getNome()
        );
    }
}