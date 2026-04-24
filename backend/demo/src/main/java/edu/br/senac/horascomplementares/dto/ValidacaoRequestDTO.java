// dto/ValidacaoRequestDTO.java
package edu.br.senac.horascomplementares.dto;

import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Getter @Setter
public class ValidacaoRequestDTO {
    private String status;        // "APROVADO" ou "REJEITADO"
    private String observacao;
    private BigDecimal horasValidadas;
}