import 'package:flutter/material.dart';
import 'package:telefon_akademiyasi/utils/app_colors.dart';

class CustomSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final ValueChanged<String>? onChanged;

  const CustomSearchBar({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      style: const TextStyle(color: AppColors.darkTextColor), 
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: const TextStyle(color: AppColors.hintTextColor), 
        prefixIcon: const Icon(Icons.search, color: AppColors.hintTextColor), 

        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        filled: false, 
        contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 10.0), 
      ),
    );
  }
}