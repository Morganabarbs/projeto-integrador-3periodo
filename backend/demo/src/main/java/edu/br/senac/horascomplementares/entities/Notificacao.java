package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;

@Entity
@Table(name = "Notificacao")
@Getter @Setter
public class Notificacao {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_notificacao")
    private Integer id;

    @Column(columnDefinition = "TEXT")
    private String mensagem;

    private String canal;
    private String tipo;
    private LocalDateTime dataEnvio;

    @ManyToOne
    @JoinColumn(name = "id_validacao", nullable = false)
    private Validacao validacao;
}