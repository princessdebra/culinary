import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_app/configs/constants.dart';
import 'package:recipe_app/controller/homescontroller.dart';
import 'package:recipe_app/views/dashboard.dart';

var screens = [
  const Homes(),
  const Dashboard(),
  const Text("Profile"),
];

HomesController homesController = Get.put(HomesController());

var selectedPage = 0;

class Homes extends StatelessWidget {
  const Homes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        items: const [
          Icon(
            Icons.house,
            color: appWhiteColor,
          ),
          Icon(
            Icons.list,
            color: appWhiteColor,
          ),
          Icon(
            Icons.settings,
            color: appWhiteColor,
          ),
          Icon(
            Icons.person,
            color: appWhiteColor,
          ),
        ],
        color: primaryColor,
        backgroundColor: appWhiteColor,
        buttonBackgroundColor: primaryColor,
        onTap: (index) {
          homesController.updateSelectPage(index);
        },
      ),
      body:
          Obx(() => Center(child: screens[homesController.selectedPage.value])),
    );
  }
}
