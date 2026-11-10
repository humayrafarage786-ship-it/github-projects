import 'package:flutter/material.dart';

import '../../app/theme/app_colors.dart';

class BottomNavigation extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final menuItems = [
      (icon: Icons.map_outlined, label: 'Mapa'),
      (icon: Icons.history, label: 'Histórico'),
      (icon: Icons.person_outline, label: 'Perfil'),
    ];

    return Container(
      height: 88,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: List.generate(menuItems.length, (index) {
          final isSelected = currentIndex == index;
          final item = menuItems[index];

          return Expanded(
            child: InkWell(
              onTap: () => onTap(index),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 64,
                    height: 32,
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.secondary
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      item.icon,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.textSecondary,
                      size: 23,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    item.label,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: isSelected
                          ? FontWeight.w600
                          : FontWeight.normal,
                      color: isSelected
                          ? AppColors.primary
                          : AppColors.label,
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
