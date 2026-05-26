import { useEffect, useState } from "react";
import { FlatList, Text, View, StyleSheet, Image } from "react-native";

export default function App() {
  // 1. Criando o "estado" para guardar nossos dado
  const [personagens, setPersonagens] = useState([]);

  // 2. Buscando os dados assim que o App abre
  useEffect(() => {
    async function buscarPersonagens() {
      try {
        const response = await fetch('https://api.jikan.moe/v4/anime/21/characters');
        const dados = await response.json();
        
        // Pegando apenas os 20 primeiros personagens
        setPersonagens(dados.data.slice(0, 20));
      } catch (error) {
        console.error("Erro ao buscar dados: ", error);
      }
    }
    
    buscarPersonagens();
  }, []); // Essa lista vazia [] significa "rode apenas uma vez quando iniciar"

  // 3. Montando o visual da tela
  return (
    <View style={styles.container}>
      <Text style={styles.titulo}>Personagens de One Piece</Text>
      
      <FlatList
        data={personagens}
        keyExtractor={(item) => String(item.character.mal_id)}
        renderItem={({ item }) => (
          <View style={styles.card}>
            
            {/* NOVO: Componente de Imagem buscando a URL direto da API */}
            <Image 
              source={{ uri: item.character.images.jpg.image_url }} 
              style={styles.imagem} 
            />
            
            {/* View para organizar os textos ao lado da imagem */}
            <View style={styles.infoTexto}>
              <Text style={styles.textoNome}>{item.character.name}</Text>
              <Text style={styles.textoPapel}>{item.role}</Text>
            </View>

          </View>
        )}
      />
    </View>
  );
}

// 4. Estilizando tudo
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
    color: '#e74c3c', 
  },
  card: {
    flexDirection: 'row', // Coloca imagem e texto lado a lado
    backgroundColor: '#fff',
    padding: 10,
    marginBottom: 10,
    borderRadius: 8,
    elevation: 2, 
    shadowColor: '#000',
    shadowOpacity: 0.1,
    shadowRadius: 4,
    borderLeftWidth: 4,
    borderLeftColor: '#f1c40f',
    alignItems: 'center', // Alinha a imagem e o texto no centro do card
  },
  imagem: {
    width: 60,
    height: 60,
    borderRadius: 30, // Deixa a imagem redonda
    marginRight: 15,  // Dá um espaço entre a imagem e o texto
  },
  infoTexto: {
    flex: 1, // Faz o texto ocupar o resto do espaço no card
  },
  textoNome: {
    fontSize: 16,
    fontWeight: 'bold',
    marginBottom: 4,
  },
  textoPapel: {
    fontSize: 14,
    color: '#555',
  }
});