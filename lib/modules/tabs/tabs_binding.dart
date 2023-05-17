import 'package:food_rescue/modules/tabs/tabs_controller.dart';
import 'package:get/get.dart';

class TabsBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TabsController());
  }
}
