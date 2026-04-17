package edu.br.senac.horascomplementares.security;

import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.exceptions.JWTVerificationException;
import org.springframework.stereotype.Component;
import java.time.Instant;
import java.time.temporal.ChronoUnit;

@Component
public class JwtUtil {

    // Troque por uma senha secreta sua, qualquer texto longo
    private static final String SECRET = "minha-chave-secreta-super-segura-2024";
    private static final Algorithm ALGORITHM = Algorithm.HMAC256(SECRET);

    // Gera o token com o email e o perfil do usuário
    public String gerarToken(String email, String perfil) {
        return JWT.create()
                .withSubject(email)
                .withClaim("perfil", perfil)
                .withExpiresAt(Instant.now().plus(8, ChronoUnit.HOURS))
                .sign(ALGORITHM);
    }

    // Valida o token e retorna o email
    public String validarToken(String token) {
        try {
            return JWT.require(ALGORITHM)
                    .build()
                    .verify(token)
                    .getSubject();
        } catch (JWTVerificationException e) {
            return null;
        }
    }

    // Pega o perfil dentro do token
    public String getPerfil(String token) {
        try {
            return JWT.require(ALGORITHM)
                    .build()
                    .verify(token)
                    .getClaim("perfil")
                    .asString();
        } catch (JWTVerificationException e) {
            return null;
        }
    }
}