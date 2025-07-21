import 'package:flutter/material.dart';
import 'package:recipe_app/views/customtext.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final VoidCallback? action;
  const CustomButton({
    super.key,
    required this.label,
    required TextEditingController usernameController,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: action,
      child: CustomText(
        label: label,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.normal,
      ),
    );
  }
}
