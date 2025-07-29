import 'package:flutter/material.dart';

class AppColors {

  static const Color primaryBlue = Color(0xFF2196F3); 
  static const Color accentBlue = Color(0xFF42A5F5); 
  static const Color darkBlue = Color(0xFF0D47A1); 
  static const Color bgColor = Color(0xFF1A237E); 
  static const Color cardColor = Color(0xFF42A5F5); 

  static const Color textColor = Colors.white; 
  static const Color secondaryTextColor = Color(0xFFBBDEFB); 

  static const Color lightTextColor = Colors.white; 
  static const Color darkTextColor = Colors.black; 
  static const Color hintTextColor = Colors.grey; 

  static const Color dividerColor = Color(0xFFE0E0E0); 
  static const Color errorColor = Colors.red; 
  static const Color warningColor = Colors.orange; 
  static const Color borderColor = Color(0xFFE0E0E0); 

  static const Color bottomNavBg = Color(0xFF1A237E); 
  static const Color bottomNavItemActive = Color(0xFFFF5252); 
  static const Color bottomNavItemInactive = Colors.white; 

  static const Color bottomNavItemActiveBg = Color(0xFFFF5252); 
  static const Color bottomNavItemInactiveBg = Color(0xFF1A237E); 
  static const Color bottomNavIconColor = Colors.white; 
  static const Color bottomNavTextColor = Colors.white; 

  static const Color searchBarBg = Colors.white; 
  static const Color searchBarHintColor = Colors.grey; 
  static const Color searchBarTextColor = Colors.black; 
  static const Color searchBarBorderColor = Colors.transparent; 

  static const MaterialColor primaryBlueSwatch = MaterialColor(
    0xFF1E88E5, 
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF2196F3),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}