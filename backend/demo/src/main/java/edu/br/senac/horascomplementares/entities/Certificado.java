package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "Certificado")
@Getter @Setter
public class Certificado {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_certificado")
    private Integer id;

    private String nomeOcr;
    private String arquivoImagem;
    private BigDecimal cargaHorariaInformada;
    private LocalDate dataEnvio;
    private LocalDate dataAtividade;
    private String tituloAtividade;
    private LocalDate dataOcr;
    private BigDecimal cargaHorarioOcr;

    @ManyToOne
    @JoinColumn(name = "id_area", nullable = false)
    private AreaAtividade area;

    @ManyToOne
    @JoinColumn(name = "id_usuario_aluno", nullable = false)
    private Aluno aluno;
}