import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {}

class User {
  User({
    required this.name,
    required this.addressLine1,
    required this.addressLine2,
    required this.landmark,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
    required this.type,
  });

  final String name;
  final String addressLine1;
  final String addressLine2;
  final String landmark;
  final String city;
  final String state;
  final String country;
  final int pincode;
  final String type;

  // factory User.fromFireStore(DocumentReference reference) {
  //   final db = FirebaseFirestore.instance;
  //   User user;

  //   reference.get().then(
  //     (data) {
  //       user = User(
  //         name: data['name'],
  //         addressLine1: data['address']['address line 1'],
  //         addressLine2: data['address']['address line 2'],
  //         landmark: data['address']['landmark'],
  //         city: data['address']['city'],
  //         state: data['address']['state'],
  //         country: data['address']['country'],
  //         pincode: data['address']['pincode'],
  //         type: data['type'],
  //       );
  //     },
  //   );
  // }
}
