import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../app/theme/app_colors.dart';
import '../../widgets/common/auth_tab_switcher.dart';
import '../../widgets/inputs/app_text_field.dart';
import '../../widgets/buttons/primary_button.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  int selectedTab = 0;
  bool obscuredPassword = true;

  void showMessage(String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80),

                //Logo
                Center(
                  child: Column(
                    children: [
                      Container(
                        width: 72,
                        height: 72,
                        decoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 34,
                        ),
                      ),

                      const SizedBox(height: 16),

                      const Text(
                        'Reporte o estado dos contentores da sua cidade',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                //Entrar/criar conta
                AuthTabSwitcher(
                  selectedIndex: selectedTab,
                  onChange: (index) {
                    setState(() {
                      selectedTab = index;
                    });
                  },
                ),

                const SizedBox(height: 24),

                if (selectedTab == 0)
                  _buildSignInForm()
                else
                  _buildCreateAccountForm(),

                const SizedBox(height: 18),

                Row(
                  children: [
                    const Expanded(child: Divider(color: AppColors.border)),

                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'ou',
                        style: TextStyle(color: AppColors.textSecondary),
                      ),
                    ),

                    const Expanded(child: Divider(color: AppColors.border)),
                  ],
                ),

                const SizedBox(height: 18),

                // continuar sem login
                SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.primary,
                    ),
                    onPressed: () {
                      context.push('/');
                    },
                    child: const Text('Continuar sem autenticar'),
                  ),
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSignInForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // email
        const AppTextField(
          label: 'Email',
          descriptionText: 'Digite seu email',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: 18),

        // password
        AppTextField(
          label: 'Senha',
          descriptionText: 'Digite a sua senha',
          icon: Icons.lock_clock_outlined,
          obscureText: obscuredPassword,
          suffixIcon: IconButton(
            icon: Icon(
              obscuredPassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            onPressed: () {
              setState(() {
                obscuredPassword = !obscuredPassword;
              });
            },
          ),
        ),

        const SizedBox(height: 16),

        Align(
          alignment: Alignment.centerRight,
          child: GestureDetector(
            onTap: () {
              showMessage('Recuperação de senha');
            },
            child: const Text(
              'Esqueceu-se da sua senha?',
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: 18),

        // botao entrar
        PrimaryButton(
          displayText: 'Entrar',
          onPressed: () => {context.go('/home')},
        ),
      ],
    );
  }

  Widget _buildCreateAccountForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // name
        const AppTextField(
          label: 'Nome Completo',
          descriptionText: 'Digite seu nome',
          icon: Icons.person_outline,
        ),

        const SizedBox(height: 18),

        // email
        const AppTextField(
          label: 'Email',
          descriptionText: 'Digite seu email',
          icon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: 18),

        // password
        AppTextField(
          label: 'Senha',
          descriptionText: 'Digite uma senha',
          icon: Icons.lock_clock_outlined,
          obscureText: obscuredPassword,
          suffixIcon: IconButton(
            icon: Icon(
              obscuredPassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            onPressed: () {
              setState(() {
                obscuredPassword = !obscuredPassword;
              });
            },
          ),
        ),

        const SizedBox(height: 20),

        // botao criar conta
        PrimaryButton(
          displayText: 'Criar conta',
          onPressed: () {
            setState(() {
              selectedTab = 0;
            });
            showMessage('Conta criada, já podes entrar  no sistema.');
          },
        ),
      ],
    );
  }
}
