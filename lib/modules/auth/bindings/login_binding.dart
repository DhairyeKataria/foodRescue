import 'package:food_rescue/modules/auth/controllers/auth_controller.dart';
import 'package:get/instance_manager.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}
