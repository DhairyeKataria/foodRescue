import 'package:food_rescue/routes/app_routes.dart';
import 'package:get/route_manager.dart';

import '../modules/auth/bindings/login_binding.dart';
import '../modules/auth/views/login_page.dart';
import '../modules/home/home_binding.dart';
import '../modules/home/home_page.dart';
import '../modules/profile/bindings/edit_profile_binding.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/edit_profile_page.dart';
import '../modules/profile/views/profile_page.dart';
import '../modules/rescue/rescue_binding.dart';
import '../modules/rescue/rescue_page.dart';
import '../modules/tabs/tabs_binding.dart';
import '../modules/tabs/tabs_page.dart';

class AppPages {
  static final List<GetPage> pages = [
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.profile,
      page: () => const ProfilePage(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.editProfile,
      page: () => const EditProfilePage(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: AppRoutes.tabs,
      page: () => const TabsPage(),
      binding: TabsBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.rescue,
      page: () => const RescuePage(),
      binding: RescueBinding(),
    ),
  ];
}
