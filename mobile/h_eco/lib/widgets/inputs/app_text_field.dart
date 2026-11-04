import 'package:flutter/material.dart';

import '../../app/theme/app_text_styles.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String descriptionText;
  final IconData icon;
  final bool obscureText;
  final TextInputType keyboardType;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    required this.label,
    required this.descriptionText,
    required this.icon,
    this.obscureText = false,
    this.suffixIcon,
    this.keyboardType = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: AppTextStyles.label),

        const SizedBox(height: 8),

        TextField(
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: descriptionText,
            prefixIcon: Icon(icon),
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
