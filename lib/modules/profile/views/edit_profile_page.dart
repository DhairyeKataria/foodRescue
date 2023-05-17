import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_rescue/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressLine1Controller = TextEditingController();
  final TextEditingController addressLine2Controller = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController stateController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController pincodeController = TextEditingController();
  String type = 'NGO';

  bool showIndicator = false;

  final db = FirebaseFirestore.instance;

  @override
  void initState() {
    super.initState();
    final docRef =
        db.collection('user').doc(FirebaseAuth.instance.currentUser!.email);
    docRef.get().then((DocumentSnapshot snapshot) {
      final Map<String, dynamic>? data =
          snapshot.data() as Map<String, dynamic>?;
      if (data != null) {
        setState(() {
          type = data['type'];
          nameController.text = data['name'];
          addressLine1Controller.text = data['address']['address line 1'];
          addressLine2Controller.text = data['address']['address line 2'];
          landmarkController.text = data['address']['landmark'];
          countryController.text = data['address']['country'];
          stateController.text = data['address']['state'];
          cityController.text = data['address']['city'];
          pincodeController.text = data['address']['pincode'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        elevation: 0.0,
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ModalProgressHUD(
        opacity: 0.4,
        progressIndicator: const CircularProgressIndicator(
          color: Colors.white,
        ),
        inAsyncCall: showIndicator,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    width: Get.size.width * 0.4,
                    margin: const EdgeInsets.symmetric(horizontal: 10.0),
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton<String>(
                      alignment: Alignment.center,
                      dropdownColor: Colors.teal,
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                      borderRadius: BorderRadius.circular(20.0),
                      underline: const SizedBox(height: 0.0, width: 0.0),
                      value: type,
                      items: const [
                        DropdownMenuItem(
                          value: 'NGO',
                          child: Text('NGO'),
                        ),
                        DropdownMenuItem(
                          value: 'Restaurant',
                          child: Text('Restaurant'),
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          type = value!;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      controller: nameController,
                      style: GoogleFonts.poppins(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        label: Text(
                          'Enter $type name',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Text(
                      'Address',
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      controller: addressLine1Controller,
                      style: GoogleFonts.poppins(color: Colors.white),
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        label: Text(
                          'Address Line 1',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      controller: addressLine2Controller,
                      style: GoogleFonts.poppins(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text(
                          'Address Line 2',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      controller: landmarkController,
                      style: GoogleFonts.poppins(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text(
                          'Landmark',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      controller: countryController,
                      style: GoogleFonts.poppins(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text(
                          'Country',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      controller: stateController,
                      style: GoogleFonts.poppins(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text(
                          'State',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      controller: cityController,
                      style: GoogleFonts.poppins(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        label: Text(
                          'City',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: TextField(
                      controller: pincodeController,
                      style: GoogleFonts.poppins(color: Colors.white),
                      cursorColor: Colors.white,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: InputDecoration(
                        label: Text(
                          'Pincode',
                          style: GoogleFonts.poppins(color: Colors.white),
                        ),
                        hintStyle: GoogleFonts.poppins(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.teal,
                    ),
                    onPressed: () async {
                      if (nameController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(Get.context!).showSnackBar(
                          const SnackBar(
                            content: Text('Enter Restraunt name'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                        return;
                      }
                      if (addressLine1Controller.text.trim().isEmpty ||
                          addressLine2Controller.text.trim().isEmpty ||
                          landmarkController.text.trim().isEmpty ||
                          countryController.text.trim().isEmpty ||
                          stateController.text.trim().isEmpty ||
                          cityController.text.trim().isEmpty ||
                          pincodeController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(Get.context!).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter the complete address'),
                            duration: Duration(seconds: 3),
                          ),
                        );
                      }
                      Map<String, dynamic> data = {
                        'name': nameController.text,
                        'type': type,
                        'address': {
                          'address line 1': addressLine1Controller.text,
                          'address line 2': addressLine2Controller.text,
                          'landmark': landmarkController.text,
                          'country': countryController.text,
                          'state': stateController.text,
                          'city': cityController.text,
                          'pincode': pincodeController.text,
                        }
                      };
                      try {
                        setState(() {
                          showIndicator = true;
                        });
                        await db
                            .collection('user')
                            .doc(FirebaseAuth.instance.currentUser!.email)
                            .set(data);
                        setState(() {
                          showIndicator = false;
                        });
                        Get.offAndToNamed(AppRoutes.tabs);
                      } catch (e) {}
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
        ),
      ),
    );
  }
}
