// CertificadoRepository.java
package edu.br.senac.horascomplementares.repository;

import edu.br.senac.horascomplementares.entities.Certificado;
import edu.br.senac.horascomplementares.entities.Aluno;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface CertificadoRepository extends JpaRepository<Certificado, Integer> {
    List<Certificado> findByAluno(Aluno aluno);
    List<Certificado> findByArea_Id(Integer idArea);
}