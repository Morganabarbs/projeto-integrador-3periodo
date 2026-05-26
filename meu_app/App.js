import { useEffect, useState } from "react";
import { FlatList, Text, View, StyleSheet } from "react-native";

export default function App() {
  const [personagens, setPersonagens] = useState([]);

  useEffect(() => {
    async function buscarPersonagens() {
      try {
        // Consumindo a Jikan API buscando os personagens de One Piece (ID 21)
        const response = await fetch('https://api.jikan.moe/v4/anime/21/characters');
        const dados = await response.json();
        
        setPersonagens(dados.data.slice(0, 20));
      } catch (error) {
        console.error("Erro ao buscar dados: ", error);
      }
    }
    
    buscarPersonagens();
  }, []);

  return (
    <View style={styles.container}>
      <Text style={styles.titulo}>Personagens de One Piece</Text>
      
      <FlatList
        data={personagens}
        // O ID único do personagem na Jikan API se chama "mal_id"
        keyExtractor={(item) => String(item.character.mal_id)}
        renderItem={({ item }) => (
          <View style={styles.card}>
            {/* O nome fica dentro do objeto "character" */}
            <Text style={styles.textoNome}>Nome: {item.character.name}</Text>
            {/* O papel (ex: Main, Supporting) fica direto no item */}
            <Text style={styles.textoPapel}>Papel na história: {item.role}</Text>
          </View>
        )}
      />
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#f5f5f5',
    paddingTop: 50,
    paddingHorizontal: 20,
  },
  titulo: {
    fontSize: 24,
    fontWeight: 'bold',
    marginBottom: 20,
    textAlign: 'center',
    color: '#e74c3c', // Um vermelho para combinar com a vibe do Luffy!
  },
  card: {
    backgroundColor: '#fff',
    padding: 15,
    marginBottom: 10,
    borderRadius: 8,
    elevation: 2, 
    shadowColor: '#000',
    shadowOpacity: 0.1,
    shadowRadius: 4,
    borderLeftWidth: 4,
    borderLeftColor: '#f1c40f', // Um detalhe amarelo nos cards
  },
  textoNome: {
    fontSize: 18,
    fontWeight: 'bold',
    marginBottom: 5,
  },
  textoPapel: {
    fontSize: 14,
    color: '#555',
  }
});