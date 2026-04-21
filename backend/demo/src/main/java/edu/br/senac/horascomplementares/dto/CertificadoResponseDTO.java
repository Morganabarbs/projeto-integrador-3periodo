// dto/CertificadoResponseDTO.java
package edu.br.senac.horascomplementares.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import java.math.BigDecimal;
import java.time.LocalDate;

@Getter @AllArgsConstructor
public class CertificadoResponseDTO {
    private Integer id;
    private String tituloAtividade;
    private BigDecimal cargaHorariaInformada;
    private LocalDate dataEnvio;
    private String nomeAluno;
    private String statusValidacao; // null se ainda não validado
    private String nomeArea;
}