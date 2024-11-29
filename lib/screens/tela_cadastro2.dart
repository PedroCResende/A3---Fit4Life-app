import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TelaCadastro2 extends StatefulWidget {
  @override
  _TelaCadastro2State createState() => _TelaCadastro2State();
}

class _TelaCadastro2State extends State<TelaCadastro2> {
  int selectedObjectiveIndex = 0; // Índice para o objetivo selecionado
  List<String> objectives = [
    "Ganhar Massa",
    "Perder Peso",
    "Ganhar Peso",
    "Ganhar mais flexibilidade",
    "Aprender o Básico"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar conta"),
        backgroundColor: Color.fromARGB(204, 193, 22, 22),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Texto no topo
            const Text(
              "Qual o seu Objetivo?",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              "Isso vai nos ajudar a encontrar o melhor profissional para o seu caso",
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40), // Espaço entre o texto e a roleta

            // Caixa com sombra para a roleta
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: CupertinoPicker(
                itemExtent: 50,
                scrollController: FixedExtentScrollController(initialItem: selectedObjectiveIndex),
                onSelectedItemChanged: (int index) {
                  setState(() {
                    selectedObjectiveIndex = index;
                  });
                },
                children: List<Widget>.generate(objectives.length, (index) {
                  return Center(
                    child: Text(
                      objectives[index],
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: index == selectedObjectiveIndex
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: index == selectedObjectiveIndex
                            ? Color.fromARGB(204, 193, 22, 22) // Cor vermelha para selecionado
                            : Colors.black,
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 40), // Espaço entre a roleta e o botão

            // Botão Próximo
            ElevatedButton(
              onPressed: () {
                // Ação para ir para a próxima tela
                print("Objetivo selecionado: ${objectives[selectedObjectiveIndex]}");
                // Navegar para a próxima tela se necessário
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(204, 193, 22, 22),
                minimumSize: Size(double.infinity, 50),
              ),
              child: const Text("Próximo", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
