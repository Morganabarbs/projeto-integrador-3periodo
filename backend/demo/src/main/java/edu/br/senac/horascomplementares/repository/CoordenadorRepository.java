// CoordenadorRepository.java
package edu.br.senac.horascomplementares.repository;

import edu.br.senac.horascomplementares.entities.Coordenador;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface CoordenadorRepository extends JpaRepository<Coordenador, Integer> {
    Optional<Coordenador> findByEmail(String email);
}