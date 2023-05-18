import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_rescue/modules/rescue/rescue_controller.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxList<Rescue> rescues = <Rescue>[].obs;

  @override
  void onInit() {
    getRescues();
    super.onInit();
  }

  void getRescues() {
    rescues.value = [];
    final db = FirebaseFirestore.instance;
    db.collection('order').where('status', isEqualTo: 'Open').get().then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          Rescue rescue = Rescue.fromFirestore(docSnapshot);
          rescues.add(rescue);
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }
}
