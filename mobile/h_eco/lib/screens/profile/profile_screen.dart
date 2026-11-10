import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen  extends StatelessWidget {
  const ProfileScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bem vindo (Profile) Brevemente'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => context.push('sign-in'),
              child: const Text('sign-in')
            )
          ],
        )
      ),
    );
  }
}