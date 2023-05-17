import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class RescueController extends GetxController {
  RxList<Food> food = <Food>[].obs;
}

class Rescue {
  Rescue({required this.foodList, required this.user, this.status, this.date});
  final List<Food> foodList;
  final DocumentReference user;
  final String? status;
  final DateTime? date;

  Map<String, dynamic> toMap() {
    DateTime now = DateTime.now();
    DateTime date = DateTime(now.year, now.month, now.day);
    return {
      'date': date,
      'food': foodList.map((f) => f.toMap()),
      'status': 'Open',
      'user': user.get(),
    };
  }

  factory Rescue.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();

    List<Food> food = [];
    for (int i = 0; i < data?['food'].length; i++) {
      food.add(Food.fromFirestore(data?['food'][i]));
    }
    return Rescue(
      foodList: food,
      user: data?['user'],
      status: data?['status'],
      date: data?['date']!.toDate(),
    );
  }
}

class Food {
  Food({
    required this.foodName,
    required this.foodQuantity,
    required this.quantityType,
  });

  final String foodName;
  final int foodQuantity;
  final String quantityType;

  Map<String, dynamic> toMap() {
    return {
      'foodName': foodName,
      'foodQuantity': foodQuantity,
      'quantityType': quantityType,
    };
  }

  factory Food.fromFirestore(Map<String, dynamic>? foodMap) {
    return Food(
      foodName: foodMap?['foodName'],
      foodQuantity: foodMap?['foodQuantity'],
      quantityType: foodMap?['quantityType'],
    );
  }
}
