import 'package:flutter/material.dart';
import 'package:food_rescue/modules/profile/views/profile_page.dart';
import 'package:food_rescue/modules/tabs/tabs_controller.dart';
import 'package:food_rescue/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home/home_page.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key});

  @override
  State<TabsPage> createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  final List<Widget?> _screens = [
    HomePage(),
    null,
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabsController>(
      builder: (controller) {
        return Obx(
          () {
            return Scaffold(
              appBar: AppBar(
                elevation: 0.0,
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                centerTitle: true,
                title: Text(
                  'Food Rescue',
                  style: GoogleFonts.poppins(color: Colors.black),
                ),
              ),
              floatingActionButton: FloatingActionButton.extended(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
                elevation: 4.0,
                icon: const Icon(Icons.add),
                label: Text('Rescue', style: GoogleFonts.poppins()),
                onPressed: () {
                  Get.toNamed(AppRoutes.rescue);
                },
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerDocked,
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: controller.currentIndex.value,
                selectedItemColor: Colors.teal,
                unselectedItemColor: Colors.black,
                selectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w500),
                unselectedLabelStyle:
                    const TextStyle(fontWeight: FontWeight.w500),
                type: BottomNavigationBarType.fixed,
                onTap: (value) {
                  if (value != 1) controller.currentIndex.value = value;
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home_outlined),
                    label: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(
                      Icons.check_box_outline_blank,
                      color: Colors.white,
                    ),
                    label: '',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person_outline_rounded),
                    label: 'Profile',
                  ),
                ],
              ),
              body: _screens[controller.currentIndex.value],
            );
          },
        );
      },
    );
  }
}
