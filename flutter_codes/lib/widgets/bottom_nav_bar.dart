import 'package:flutter/material.dart';
import 'package:telefon_akademiyasi/utils/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0, 
      decoration: const BoxDecoration(
        color: AppColors.bottomNavBg, 
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, -5), 
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(context, 0, 'KATEGORIYALAR', Icons.category),
          _buildNavItem(context, 1, 'SEVIMLILAR', Icons.favorite),
          _buildNavItem(context, 2, 'O\'YIN', Icons.games),        
          _buildNavItem(context, 3, 'BIZ HAQIMIZDA', Icons.info), 
        ],
      ),
    );
  }

  Widget _buildNavItem(BuildContext context, int index, String label, IconData icon) {
    final bool isSelected = selectedIndex == index;
    return Expanded(
      child: GestureDetector(
        onTap: () => onItemTapped(index),
        child: Container(
          color: isSelected ? AppColors.bottomNavItemActive : AppColors.primaryBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                color: isSelected ? AppColors.bottomNavBg : AppColors.bottomNavItemInactive,
                size: 24,
              ),
              Text(
                label,
                style: TextStyle(
                  color: isSelected ? AppColors.bottomNavBg : AppColors.bottomNavItemInactive,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}