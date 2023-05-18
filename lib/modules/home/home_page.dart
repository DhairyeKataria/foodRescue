import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_rescue/modules/home/home_controller.dart';
import 'package:food_rescue/modules/rescue/rescue_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        controller.rescues[index].user['name'],
                        style: GoogleFonts.poppins(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Address: ',
                            style: GoogleFonts.poppins(
                              fontSize: 15.0,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          Expanded(
                            child: Text(
                              '${controller.rescues[index].user['address']['address line 1']}, ${controller.rescues[index].user['address']['address line 2']}, ${controller.rescues[index].user['address']['landmark']}, ${controller.rescues[index].user['address']['city']}, ${controller.rescues[index].user['address']['state']}, ${controller.rescues[index].user['address']['country']}, ${controller.rescues[index].user['address']['pincode']}',
                              style: GoogleFonts.poppins(
                                fontSize: 15.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6.0),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rescue:   ',
                            style: GoogleFonts.poppins(
                              fontSize: 15.0,
                              color: Colors.grey.shade700,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                for (int i = 0;
                                    i <
                                        controller
                                            .rescues[index].foodList.length;
                                    i++)
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Text(
                                        controller.rescues[index].foodList[i]
                                            .foodName,
                                        style: GoogleFonts.poppins(
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      const SizedBox(height: 4.0),
                                      Row(
                                        children: [
                                          const Text('Quantity: '),
                                          Text(
                                            '${controller.rescues[index].foodList[i].foodQuantity} ',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text(
                                            '${controller.rescues[index].foodList[i].quantityType} ',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.teal,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () async {
                          DocumentSnapshot snapshot = await db
                              .collection('user')
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .get();
                          List<Map<String, dynamic>> previousRescues = [];
                          if (((snapshot.data()! as Map<String, dynamic>)[
                                  'previousRescues']) !=
                              null) {
                            previousRescues.addAll((snapshot.data()!
                                as Map<String, dynamic>)['previousRescues']);
                          }
                          previousRescues
                              .add(controller.rescues[index].toMap());

                          db
                              .collection('user')
                              .doc(FirebaseAuth.instance.currentUser!.email)
                              .update({'previousRescues': previousRescues});
                        },
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text('Accept'),
                        ),
                      ),
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
