import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HistoryScreen  extends StatelessWidget {
  const HistoryScreen({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bem vindo (History)'),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: () => context.push('profile'),
              child: const Text('Profile')
            )
          ],
        )
      ),
    );
  }
}