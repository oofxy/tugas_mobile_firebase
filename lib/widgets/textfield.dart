import 'package:flutter/material.dart';

import '../style/colors.dart';

class mainTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final TextEditingController? controller;
  const mainTextField({super.key, required this.hintText, this.prefixIcon, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller != null ? controller : null,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColors.borderPrimary),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColors.onPrimary, width: 2.0), // Border hitam saat fokus
        ),
        filled: true,
        fillColor: AppColors.primary, // Background biru
      ),
    );
  }
}
