import 'package:flutter/material.dart';

import '../style/colors.dart';

class mainTextField extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  const mainTextField({super.key, required this.hintText, this.prefixIcon});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Montserrat',
          fontSize: 14
        ),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: Colors.white12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(color: AppColors.borderPrimaryHighlighted2, width: 2.0), // Border hitam saat fokus
        ),
        filled: true,
        fillColor: AppColors.primary, // Background biru
      ),
    );
  }
}
