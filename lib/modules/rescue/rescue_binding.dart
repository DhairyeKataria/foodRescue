import 'package:food_rescue/modules/rescue/rescue_controller.dart';
import 'package:get/get.dart';

class RescueBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RescueController());
  }
}
