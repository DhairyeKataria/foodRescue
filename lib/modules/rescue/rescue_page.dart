import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_rescue/modules/rescue/rescue_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class RescuePage extends StatefulWidget {
  const RescuePage({super.key});

  @override
  State<RescuePage> createState() => _RescuePageState();
}

class _RescuePageState extends State<RescuePage> {
  final TextEditingController foodNameController = TextEditingController();
  final TextEditingController foodQuantityController = TextEditingController();
  final TextEditingController quantityTypeController = TextEditingController();

  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RescueController>(
      builder: (controller) {
        return Obx(
          () => Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: true,
              elevation: 0.0,
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              centerTitle: true,
              title: Text(
                'Create Rescue',
                style: GoogleFonts.poppins(color: Colors.black),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.teal,
                        side: const BorderSide(color: Colors.teal),
                      ),
                      onPressed: () async {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text(
                                'Add Food',
                                style: TextStyle(color: Colors.white),
                              ),
                              backgroundColor: Colors.teal,
                              content: Container(
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: TextField(
                                        controller: foodNameController,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                        cursorColor: Colors.white,
                                        decoration: InputDecoration(
                                          label: Text(
                                            'Food Name',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                          hintStyle: GoogleFonts.poppins(
                                              color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: TextField(
                                        controller: foodQuantityController,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                        cursorColor: Colors.white,
                                        keyboardType: TextInputType.number,
                                        inputFormatters: [
                                          FilteringTextInputFormatter
                                              .digitsOnly,
                                        ],
                                        decoration: InputDecoration(
                                          label: Text(
                                            'Food Quantity',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                          hintStyle: GoogleFonts.poppins(
                                              color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 20.0),
                                      child: TextField(
                                        controller: quantityTypeController,
                                        style: GoogleFonts.poppins(
                                            color: Colors.white),
                                        cursorColor: Colors.white,
                                        decoration: InputDecoration(
                                          label: Text(
                                            'Quantity Type',
                                            style: GoogleFonts.poppins(
                                                color: Colors.white),
                                          ),
                                          hintStyle: GoogleFonts.poppins(
                                              color: Colors.white),
                                          border: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Colors.white,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      style: TextButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        side: const BorderSide(
                                          color: Colors.white,
                                        ),
                                      ),
                                      onPressed: () {
                                        if (foodNameController.text
                                                .trim()
                                                .isNotEmpty &&
                                            foodQuantityController.text
                                                .trim()
                                                .isNotEmpty &&
                                            quantityTypeController.text
                                                .trim()
                                                .isNotEmpty) {
                                          controller.food.add(
                                            Food(
                                              foodName: foodNameController.text
                                                  .trim(),
                                              foodQuantity: int.parse(
                                                foodQuantityController.text
                                                    .trim(),
                                              ),
                                              quantityType:
                                                  quantityTypeController.text
                                                      .trim(),
                                            ),
                                          );
                                          Navigator.of(context).pop();
                                        }
                                      },
                                      child: const Text('Add'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      child: const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Add Food Item'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: controller.food.isEmpty
                        ? Center(
                            child: Text('No Items yet'),
                          )
                        : ListView.builder(
                            itemCount: controller.food.length,
                            itemBuilder: (context, index) {
                              return Container(
                                padding: const EdgeInsets.all(10.0),
                                margin: const EdgeInsets.only(bottom: 10.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.teal),
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.food[index].foodName,
                                      style: GoogleFonts.poppins(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    const SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            const Text('Quantity: '),
                                            Text(
                                              '${controller.food[index].foodQuantity} ',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            Text(
                                              '${controller.food[index].quantityType} ',
                                              style: const TextStyle(
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            controller.food.removeAt(index);
                                          },
                                          child: const Icon(
                                            Icons.delete,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.teal,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () async {
                      Rescue rescue = Rescue(
                        foodList: controller.food,
                        user: db.doc(
                            'user/${FirebaseAuth.instance.currentUser!.email}'),
                      );
                      db.collection('order').doc().set(rescue.toMap());
                      ScaffoldMessenger.of(Get.context!).showSnackBar(
                        const SnackBar(
                          content: Text('Rescue Created'),
                          duration: Duration(seconds: 3),
                        ),
                      );
                      Get.back();
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('Done'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
