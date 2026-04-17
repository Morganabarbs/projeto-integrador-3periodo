// dto/CertificadoRequestDTO.java
package edu.br.senac.horascomplementares.dto;

import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDate;

@Getter @Setter
public class CertificadoRequestDTO {
    private String tituloAtividade;
    private BigDecimal cargaHorariaInformada;
    private LocalDate dataAtividade;
    private Integer idArea;
}