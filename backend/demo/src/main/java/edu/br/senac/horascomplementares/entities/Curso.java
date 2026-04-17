package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Entity
@Table(name = "Curso")
@Getter @Setter
public class Curso {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_curso")
    private Integer id;

    @Column(name = "nome_curso", nullable = false)
    private String nome;

    @Column(name = "carga_total_exigida", nullable = false)
    private BigDecimal cargaTotalExigida;
}