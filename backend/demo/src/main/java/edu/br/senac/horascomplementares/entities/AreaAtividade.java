package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Entity
@Table(name = "Area_Atividade")
@Getter @Setter
public class AreaAtividade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_area")
    private Integer id;

    @Column(name = "nome_area", nullable = false)
    private String nome;

    @Column(name = "limite_horas_area")
    private BigDecimal limiteHorasArea;
}