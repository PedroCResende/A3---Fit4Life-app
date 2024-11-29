import 'package:flutter/material.dart';
import 'package:fit4life_app/screens/tela_login.dart'; // Certifique-se de importar a tela de login

void main() {
  runApp(Fit4LifeApp());
}

class Fit4LifeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaInicial(), // Tela inicial do app
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo ou imagem no topo
            Center(
              child: Image.asset('assets/images/logo.png', height: 100),
            ),
            const SizedBox(height: 20),
            // Botões de login ou outras opções
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaLogin(role: 'usuário'), // Passando o parâmetro role
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(204, 193, 22, 22), // Cor do botão
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Sou Usuário", style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TelaLogin(role: 'profissional'), // Passando o parâmetro role
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(204, 193, 22, 22), // Cor do botão
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text("Sou Profissional", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
