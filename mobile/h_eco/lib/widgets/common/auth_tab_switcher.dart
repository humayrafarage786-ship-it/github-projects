import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class AuthTabSwitcher extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onChange;

  const AuthTabSwitcher({
    super.key,
    required this.selectedIndex,
    required this.onChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [_buildTab('Entrar', 0), _buildTab('Criar conta', 1)],
      ),
    );
  }

  Widget _buildTab(String text, int index) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () => onChange(index),
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(10),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? AppColors.primary : AppColors.textSecondary,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
