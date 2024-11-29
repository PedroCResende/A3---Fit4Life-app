import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'tela_cadastro.dart'; // Importa a tela de cadastro

void main() {
  runApp(Fit4LifeApp());
}

class Fit4LifeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaLogin(role: 'usuário'), // Exemplo de uso do construtor role
      debugShowCheckedModeBanner: false,
    );
  }
}

class TelaLogin extends StatefulWidget {
  final String role; // Propriedade role para definir o tipo de usuário

  const TelaLogin({super.key, required this.role});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<TelaLogin> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: SafeArea(
        child: Column(
          children: [
            // Placeholder for illustration
            Container(
              height: 150,
              color: Colors.grey[300],
              child: Center(
                child: Image.asset('assets/images/run.png', height: 100), // Substitua pelo caminho da sua imagem
              ),
            ),
            TabBar(
              controller: _tabController,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              indicatorColor: Color.fromARGB(204, 193, 22, 22),
              tabs: const [
                Tab(text: "Login"),
                Tab(text: "Cadastre-se"),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // Login Tab
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Exibe a role do usuário
                        Text(
                          "Tipo de Usuário: ${widget.role}",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Botão "Login com Google"
                        ElevatedButton.icon(
                          onPressed: () {
                            // Lógica de login com Google
                          },
                          icon: FaIcon(FontAwesomeIcons.google, color: Colors.red), // Ícone do Google
                          label: const Text("Fazer login com Google"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Cor de fundo
                            foregroundColor: Colors.black, // Cor do texto
                            minimumSize: const Size(double.infinity, 50),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Botão "Login com Apple"
                        ElevatedButton.icon(
                          onPressed: () {
                            // Lógica de login com Apple
                          },
                          icon: FaIcon(FontAwesomeIcons.apple, color: Colors.black), // Ícone da Apple
                          label: const Text("Fazer login com Apple"),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white, // Cor de fundo
                            foregroundColor: Colors.black, // Cor do texto
                            minimumSize: const Size(double.infinity, 50),
                            side: const BorderSide(color: Colors.grey),
                          ),
                        ),
                        const SizedBox(height: 20),
                        const Text("Ou continue com o e-mail"),
                        const SizedBox(height: 20),
                        // Campo de E-mail
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: "E-mail",
                            prefixIcon: const Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Campo de Senha
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: "Senha",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {},
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 10),
                        Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text("Esqueci a senha"),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Botão de login
                        ElevatedButton(
                          onPressed: () {
                            // Lógica para login
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(204, 193, 22, 22), // Cor do botão
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text("Login",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                  // Cadastre-se Tab
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Campo de Nome Completo
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: "Nome Completo",
                            prefixIcon: const Icon(Icons.person),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Campo de E-mail
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: "E-mail",
                            prefixIcon: const Icon(Icons.email),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Campo de Senha
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: "Senha",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {},
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        // Campo de Confirmação de Senha
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8)),
                            labelText: "Confirmar Senha",
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                              icon: const Icon(Icons.visibility),
                              onPressed: () {},
                            ),
                          ),
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        // Seleção de Gênero
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Lógica para selecionar "Masculino"
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(204, 193, 22, 22),
                              ),
                              child: const Text("Masculino"),
                            ),
                            const SizedBox(width: 20),
                            ElevatedButton(
                              onPressed: () {
                                // Lógica para selecionar "Feminino"
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(204, 193, 22, 22),
                              ),
                              child: const Text("Feminino"),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // Botão de Cadastro
                        ElevatedButton(
                          onPressed: () {
                            // Navega para a tela de cadastro
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => TelaCadastro(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(204, 193, 22, 22), // Cor do botão
                            minimumSize: const Size(double.infinity, 50),
                          ),
                          child: const Text("Cadastrar",
                              style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
