package edu.br.senac.horascomplementares.entities;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import java.time.LocalDateTime;
import java.util.Set;

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

    @Column(name = "data_envio")
    private LocalDateTime dataEnvio;

    @ManyToOne
    @JoinColumn(name = "id_validacao", nullable = false)
    private Validacao validacao;

    @ManyToMany
    @JoinTable(
        name = "Recebe",
        joinColumns = @JoinColumn(name = "id_notificacao"),
        inverseJoinColumns = @JoinColumn(name = "id_usuario")
    )
    private Set<Usuario> destinatarios;
}