import 'package:flutter/material.dart';
import 'package:recipe_app/controller/logincontroller.dart';

class CustomTextField extends StatelessWidget {
  final String? hint;
  final bool hideText;
  final IconData? icon;
  final IconData? prefIcon;
  final LoginController? controller;
  final bool isPassword;

  final TextEditingController userFieldController;
  const CustomTextField(
      {super.key,
      this.hint,
      this.hideText = false,
      this.icon,
      this.prefIcon,
      this.isPassword = false,
      required this.userFieldController,
      required this.controller,
      required TextEditingController customTextFieldController,
      required String hintMessage,
      required bool obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorRadius: const Radius.elliptical(5, 0),
      controller: userFieldController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        prefixIcon: Icon(icon),
        suffixIcon: isPassword
            ? IconButton(
                onPressed: () {
                  controller!.hidePassword.value =
                      !controller!.hidePassword.value;
                },
                icon: const Icon(Icons.visibility),
              )
            : const SizedBox(
                height: 10,
                width: 10,
              ),
      ),
      obscureText: hideText,
    );
  }
}
