import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bem vindo usuario (Sign In)'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => context.push('/'),
              child: const Text('Home'),
            ),
          ],
        ),
      ),
    );
  }
}
