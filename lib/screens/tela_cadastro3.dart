import 'package:flutter/material.dart';

class TelaCadastro3 extends StatefulWidget {
  @override
  _TelaCadastro3State createState() => _TelaCadastro3State();
}

class _TelaCadastro3State extends State<TelaCadastro3> {
  String? selectedObjective = "Ganhar massa"; // Objetivo selecionado por padrão

  @override
  Widget build(BuildContext context) {
    final List<String> objectives = [
      "Ganhar peso",
      "Perder peso",
      "Ganhar massa",
      "Ganhar mais flexibilidade",
      "Aprender o basico"
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
        title: const Text(
          "Criar conta",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            const Text(
              "Qual o seu objetivo",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            const Text(
              "Isso nos ajudará a selecionar os profissionais mais indicados",
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            // Lista de objetivos
            Expanded(
              child: ListView.separated(
                itemCount: objectives.length,
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  final objective = objectives[index];
                  final isSelected = objective == selectedObjective;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedObjective = objective;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.transparent : Colors.grey[200],
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            color: isSelected ? Colors.green : Colors.transparent,
                            width: isSelected ? 2 : 0,
                          ),
                        ),
                      ),
                      child: Text(
                        objective,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight:
                              isSelected ? FontWeight.bold : FontWeight.normal,
                          color: isSelected ? Colors.black : Colors.grey,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            // Botão "Próximo"
            ElevatedButton(
              onPressed: () {
                // Ação do botão
                print("Objetivo selecionado: $selectedObjective");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,  
                padding: const EdgeInsets.symmetric(vertical: 16),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                "Próximo",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
