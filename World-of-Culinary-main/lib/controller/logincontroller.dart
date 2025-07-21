import 'package:get/get.dart';

class LoginController extends GetxController {
  var isHidden = true.obs;

  var hidePassword = true.obs;
  toggleHide() {
    isHidden.value = !isHidden.value;
  }
}
