import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();
  final TextEditingController confirmCtrl = TextEditingController();

  void register() {
    if (emailCtrl.text.isEmpty ||
        passCtrl.text.isEmpty ||
        confirmCtrl.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Veuillez remplir tous les champs.")),
      );
      return;
    }

    if (passCtrl.text != confirmCtrl.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Les mots de passe ne correspondent pas."),
        ),
      );
      return;
    }

    Navigator.pop(context); // Retour à la page Login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer un compte"),
        backgroundColor: const Color(0xFF5A2CC8),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: emailCtrl,
              decoration: const InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: passCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Mot de passe",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),

            TextField(
              controller: confirmCtrl,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: "Confirmer le mot de passe",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: register,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5A2CC8),
                padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 14,
                ),
              ),
              child: const Text("S'inscrire", style: TextStyle(fontSize: 16)),
            ),
          ],
        ),
      ),
    );
  }
}

