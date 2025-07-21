import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:recipe_app/configs/constants.dart';
import 'package:recipe_app/views/customtext.dart';
import 'package:recipe_app/views/customtextfield.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController secondNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text("World of Culinary"),
        backgroundColor: Colors.transparent,
        foregroundColor: appWhiteColor,
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/rgs.jpg',
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/book.jpg",
                          height: 120,
                          width: 120,
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const CustomText(
                      label: "Registration Screen",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),
                    const SizedBox(height: 30),
                    buildTextField(
                        "First name", Icons.person, true, firstNameController),
                    const SizedBox(height: 30),
                    buildTextField("Second name", Icons.person, false,
                        secondNameController),
                    const SizedBox(height: 30),
                    buildTextField("Phone number", Icons.phone, false,
                        phoneNumberController),
                    const SizedBox(height: 30),
                    buildTextField("Email address", Icons.email, false,
                        emailAddressController),
                    const SizedBox(height: 30),
                    buildTextField(
                        "Password", Icons.lock, true, passwordController),
                    const SizedBox(height: 30),
                    MaterialButton(
                      onPressed: () {
                        serverSignup();
                      },
                      color: Colors.transparent,
                      height: 50,
                      minWidth: double.maxFinite,
                      child: const Text(
                        "Register",
                        style: TextStyle(color: appWhiteColor),
                      ),
                    ),
                    const SizedBox(height: 20),
                    GestureDetector(
                      onTap: () => Get.toNamed("/"),
                      child: const Text(
                        "Go to Login",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Function to build custom text fields
  Widget buildTextField(String labelText, IconData icon, bool obscureText,
      TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          label: labelText,
          fontWeight: FontWeight.normal,
          fontStyle: FontStyle.normal,
        ),
        CustomTextField(
          controller: null,
          hintMessage: "Enter $labelText",
          icon: icon,
          obscureText: obscureText,
          userFieldController: controller,
          customTextFieldController: TextEditingController(),
        ),
      ],
    );
  }

  Future<void> serverSignup() async {
    http.Response response;
    var body = {
      'firstname': firstNameController.text.trim(),
      'secondname': secondNameController.text.trim(),
      'phonenumber': phoneNumberController.text.trim(),
      'emailaddress': emailAddressController.text.trim(),
      'password': passwordController.text.trim()
    };
    try {
      response = await http.post(
        Uri.parse("https://todaysnewspaper.xyz/paul/Recipe/registration.php"),
        body: body,
      );

      if (response.statusCode == 200) {
        var serverResponse = json.decode(response.body);
        int signedUp = serverResponse['success'];
        if (signedUp == 1) {
          print("Himom!");
          // Navigate to dashboard
          //prinb upon successful registration
          Get.offAndToNamed("/");
        } else {
          // Registration failed
          print('Registration failed');
        }
      } else {
        // Server returned an error status code
        print('Server returned an error status code: ${response.statusCode}');
      }
    } catch (e) {
      // Exception occurred during HTTP request
      print('Exception occurred: $e');
    }
  }
}
