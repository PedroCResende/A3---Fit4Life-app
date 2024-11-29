import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'tela_cadastro2.dart';  // Importando a tela cadastro 2

void main() {
  runApp(Fit4LifeApp());
}

class Fit4LifeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaCadastro(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaCadastro extends StatefulWidget {
  @override
  _TelaCadastroState createState() => _TelaCadastroState();
}

class _TelaCadastroState extends State<TelaCadastro> {
  int altura = 170; // Altura inicial
  int peso = 59; // Peso inicial
  double frequencia = 5; // Frequência inicial

  // Função para formatar o texto da frequência
  String getFrecuenciaText() {
    if (frequencia <= 2) {
      return "Treinar 1-2 vezes";
    } else if (frequencia <= 4) {
      return "Treinar 3-4 vezes";
    } else {
      return "Treinar 5-7 vezes";
    }
  }

  // Função para calcular a opacidade dos itens baseando-se na posição
  double getOpacity(int currentIndex, int selectedIndex) {
    if (currentIndex == selectedIndex) {
      return 1.0; // Totalmente opaco para o número selecionado
    }
    return 0.4; // Transparência para os números não selecionados
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar conta"),
        backgroundColor: Color.fromARGB(204, 193, 22, 22),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Altura
            const Text(
              "Altura",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Picker de altura com opacidade
            CupertinoPicker(
              scrollController: FixedExtentScrollController(initialItem: altura - 150),
              itemExtent: 30,
              onSelectedItemChanged: (int index) {
                setState(() {
                  altura = 150 + index; // Definindo altura de 150 até 200
                });
              },
              children: List<Widget>.generate(51, (index) {
                return Center(
                  child: Opacity(
                    opacity: getOpacity(index, altura - 150),
                    child: Text(
                      '${150 + index} cm',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Peso
            const Text(
              "Peso",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            // Picker de peso com opacidade
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List<Widget>.generate(51, (index) {
                  int pesoIndex = 50 + index;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        peso = pesoIndex;
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Opacity(
                        opacity: getOpacity(pesoIndex - 50, peso - 50),
                        child: Text(
                          '$pesoIndex',
                          style: TextStyle(
                            fontSize: 18,
                            color: pesoIndex == peso ? Colors.red : Colors.black,
                            fontWeight: pesoIndex == peso ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(height: 20),

            // Frequência de atividades
            const Text(
              "Frequência de atividades",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Slider(
              min: 1,
              max: 7,
              divisions: 6,
              value: frequencia,
              onChanged: (double value) {
                setState(() {
                  frequencia = value;
                });
              },
            ),
            Text(
              getFrecuenciaText(),
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 20),

            // Botão Próximo
            ElevatedButton(
              onPressed: () {
                // Navega para a TelaCadastro2
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaCadastro2()),
                );
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
