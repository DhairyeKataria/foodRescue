import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:food_rescue/modules/home/home_controller.dart';
import 'package:food_rescue/modules/rescue/rescue_controller.dart';
import 'package:get/get.dart';

import '../profile/controllers/profile_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    Get.put(HomeController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Obx(
          () => Container(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemCount: controller.rescues.length,
              itemBuilder: (context, index) {
                // controller.rescues[index].user
                //   ..get().then(
                //     (data) {
                //       return User(
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
                return Container(
                  padding: const EdgeInsets.all(10.0),
                  margin: const EdgeInsets.only(bottom: 20.0),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.teal),
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(1, 1),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(controller.rescues[index].date.toString()),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
