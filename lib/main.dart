import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_rescue/modules/profile/views/edit_profile_page.dart';
import 'package:food_rescue/modules/tabs/tabs_page.dart';
import 'package:food_rescue/routes/app_pages.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'modules/auth/bindings/login_binding.dart';
import 'modules/auth/views/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Food Rescue',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      debugShowCheckedModeBanner: false,
      // home: const LoginPage(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const EditProfilePage();
          } else {
            return const LoginPage();
          }
        },
      ),
      initialBinding: LoginBinding(),
      getPages: AppPages.pages,
    );
  }
}
