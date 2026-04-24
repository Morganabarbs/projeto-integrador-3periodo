package edu.br.senac.horascomplementares.controller;

import edu.br.senac.horascomplementares.dto.CertificadoRequestDTO;
import edu.br.senac.horascomplementares.dto.CertificadoResponseDTO;
import edu.br.senac.horascomplementares.service.CertificadoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.IOException;
import java.util.List;

@RestController
@RequestMapping("/api/certificados")
public class CertificadoController {

    private final CertificadoService service;

    public CertificadoController(CertificadoService service) {
        this.service = service;
    }

    @PostMapping("/enviar/{idAluno}")
    public ResponseEntity<CertificadoResponseDTO> enviar(
            @PathVariable Integer idAluno,
            @RequestPart("dados") CertificadoRequestDTO dto,
            @RequestPart("arquivo") MultipartFile arquivo) throws IOException {
        return ResponseEntity.ok(service.enviar(idAluno, dto, arquivo));
    }

    @GetMapping("/aluno/{idAluno}")
    public ResponseEntity<List<CertificadoResponseDTO>> listarDoAluno(
            @PathVariable Integer idAluno) {
        return ResponseEntity.ok(service.listarDoAluno(idAluno));
    }

    @GetMapping
    public ResponseEntity<List<CertificadoResponseDTO>> listarTodos() {
        return ResponseEntity.ok(service.listarTodos());
    }
}