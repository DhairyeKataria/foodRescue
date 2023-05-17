import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:food_rescue/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:get/route_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

import '../controllers/auth_controller.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showIndicator = false;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: ModalProgressHUD(
            opacity: 0.4,
            progressIndicator: const CircularProgressIndicator(
              color: Colors.teal,
            ),
            inAsyncCall: showIndicator,
            child: SafeArea(
              child: SingleChildScrollView(
                child: SizedBox(
                  height: Get.size.height -
                      MediaQuery.of(context).padding.bottom -
                      MediaQuery.of(context).padding.top,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Text(
                            'Food Rescue',
                            style: GoogleFonts.poppins(
                              color: Colors.teal,
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: const BoxDecoration(
                            color: Colors.teal,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextField(
                                controller: emailController,
                                style: GoogleFonts.poppins(color: Colors.white),
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Enter your email',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ),
                                  hintStyle:
                                      GoogleFonts.poppins(color: Colors.white),
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
                              const SizedBox(height: 20.0),
                              TextField(
                                controller: passwordController,
                                style: GoogleFonts.poppins(color: Colors.white),
                                keyboardType: TextInputType.visiblePassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                  label: Text(
                                    'Enter your password',
                                    style: GoogleFonts.poppins(
                                        color: Colors.white),
                                  ),
                                  hintStyle:
                                      GoogleFonts.poppins(color: Colors.white),
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
                              const SizedBox(height: 40.0),
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  foregroundColor: Colors.teal,
                                ),
                                onPressed: () async {
                                  setState(() {
                                    showIndicator = true;
                                  });
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                      email: emailController.text.trim(),
                                      password: passwordController.text.trim(),
                                    );
                                    setState(() {
                                      showIndicator = false;
                                    });
                                  } catch (e) {
                                    setState(() {
                                      showIndicator = false;
                                    });
                                    ScaffoldMessenger.of(Get.context!)
                                        .showSnackBar(
                                      SnackBar(
                                        content: Text(e.toString()),
                                        duration: const Duration(seconds: 3),
                                      ),
                                    );
                                  }
                                },
                                child: const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Log in'),
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Text(
                                'By clicking Login, you agree to our terms and policies.',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
