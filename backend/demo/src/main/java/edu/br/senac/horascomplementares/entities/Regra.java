package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.math.BigDecimal;

@Entity
@Table(name = "Regra")
@Getter @Setter
public class Regra {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_regra")
    private Integer id;

    @Column(columnDefinition = "TEXT")
    private String descricao;

    @Column(name = "limite_horas")
    private BigDecimal limiteHoras;

    @Column(name = "tipo_atividade")
    private String tipoAtividade;

    @ManyToOne
    @JoinColumn(name = "id_usuario_coordenador", nullable = false)
    private Coordenador coordenador;

    @ManyToOne
    @JoinColumn(name = "id_area", nullable = false)
    private AreaAtividade area;
}