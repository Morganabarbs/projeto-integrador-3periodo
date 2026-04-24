// ValidacaoRepository.java
package edu.br.senac.horascomplementares.repository;

import edu.br.senac.horascomplementares.entities.Validacao;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface ValidacaoRepository extends JpaRepository<Validacao, Integer> {
    Optional<Validacao> findByCertificado_Id(Integer idCertificado);
    java.util.List<Validacao> findByStatus(String status);
}