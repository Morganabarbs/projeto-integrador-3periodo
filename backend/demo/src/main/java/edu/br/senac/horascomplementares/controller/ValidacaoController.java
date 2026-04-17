package edu.br.senac.horascomplementares.controller;

import edu.br.senac.horascomplementares.dto.ValidacaoRequestDTO;
import edu.br.senac.horascomplementares.entities.Validacao;
import edu.br.senac.horascomplementares.service.ValidacaoService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/validacoes")
public class ValidacaoController {

    private final ValidacaoService service;

    public ValidacaoController(ValidacaoService service) {
        this.service = service;
    }

    @PostMapping("/certificado/{idCertificado}")
    public ResponseEntity<Validacao> validar(
            @PathVariable Integer idCertificado,
            @RequestBody ValidacaoRequestDTO dto) {
        return ResponseEntity.ok(service.validar(idCertificado, dto));
    }
}