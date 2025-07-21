import 'package:get/get.dart';

class HomesController extends GetxController {
  var selectedPage = 0.obs;
  updateSelectPage(index) {
    selectedPage.value = index;
  }
}
