import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:service_provider/features/splash/presetation/pages/splash_screen.dart';

class GetRouter {
  static List<GetPage> getPages = [
    GetPage(
      name: RouteNames.SPLASH,
      page: () => SplashPage(),
    ),
  ];
}

class RouteNames {
  static const String SPLASH = "/";
  static const String NOT_FOUND = "/terms";

}
