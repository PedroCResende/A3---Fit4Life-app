import 'package:flutter/material.dart';
import 'tela_inicial.dart';  // Importe a próxima tela

class PaginaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/fundo.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Conteúdo sobreposto
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                // Logo no topo
                Padding(
                  padding: const EdgeInsets.only(top: 40.0), // Espaço no topo
                  child: Center(
                    child: Image.asset(
                      'assets/images/logo.png', // Substitua pelo caminho correto
                      height: 100, // Ajuste o tamanho conforme necessário
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Spacer(), // Empurra o restante do conteúdo para o meio
                // Título
                Text(
                  'Descubra o caminho para a saúde plena',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    shadows: [
                      Shadow(
                        blurRadius: 4.0,
                        color: Colors.black26,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 24),
                // Botão
                Container(
                  height: 61.05,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(204, 193, 22, 22),
                    borderRadius: BorderRadius.circular(8.72),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextButton(
                    onPressed: () {
                      // Ação para navegar para a tela 'tela_inicial.dart'
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TelaInicial()),
                      );
                    },
                    child: Text(
                      'Comece agora',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Spacer(), // Espaço abaixo do botão
                // Texto na parte inferior com width de 256
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    width: 256, // Definindo a largura como 256 pixels
                    child: Text(
                      'Ao se inscrever, você concorda com os Termos de Serviço e a Política de Privacidade, incluindo o Uso de Cookies.',
                      style: TextStyle(
                        color: Color(0xFF000000),
                        fontFamily: 'Work Sans',
                        fontSize: 13.081,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w400,
                        height: 1.0,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.solid,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
