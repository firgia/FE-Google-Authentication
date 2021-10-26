import 'package:get/get.dart';
import 'package:google_authentication/app/features/home/bindings/home_binding.dart';
import 'package:google_authentication/app/features/home/views/views/home_screen.dart';
import 'package:google_authentication/app/features/login/bindings/login_binding.dart';
import 'package:google_authentication/app/features/login/views/screens/login_screen.dart';
import 'package:google_authentication/app/features/splash/views/screens/splash_screen.dart';

part 'app_routes.dart';

abstract class AppPages {
  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.splash,
      page: () => SplashScreen(),
    ),
    GetPage(
      name: _Paths.login,
      page: () => LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.home,
      page: () => HomeScreen(),
      binding: HomeBinding(),
    )
  ];
}
