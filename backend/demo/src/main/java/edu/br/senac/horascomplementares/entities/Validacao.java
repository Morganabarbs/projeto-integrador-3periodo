package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;
import java.time.LocalDate;

@Entity
@Table(name = "Validacao")
@Getter @Setter
public class Validacao {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_validacao")
    private Integer id;

    @Column(columnDefinition = "TEXT")
    private String observacao;

    @Column(nullable = false)
    private String status;

    private LocalDate dataValidacao;
    private BigDecimal horasValidadas;

    @OneToOne
    @JoinColumn(name = "id_certificado", nullable = false, unique = true)
    private Certificado certificado;
}