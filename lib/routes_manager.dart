class Routes {
  static const String splashRoute = "/";
  static const String homeRoute = "/homeRoute";
  static const String profileRoute = "/profile";
  static const String recruitmentRoute = "/recruitment";
  static const String onBoardingRoute = "/onBoarding";
  static const String reportsRoute = "/reports";
  static const String calenderRoute = "/calender";
  static const String settingsRoute = "/settings";

}

// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case Routes.splashRoute:
//         return MaterialPageRoute(
//           builder: (_) => const SplashScreen(),
//         );
//
//       case Routes.homeRoute:
//         return MaterialPageRoute(
//             builder: (_) => HomeScreen()
//         );
//
//       case Routes.profileRoute:
//         return MaterialPageRoute(builder: (_) => const ProfileScreen())
//
//       default:
//         return unDefinedRoute();
//     }
//   }
//
//   static Route<dynamic> unDefinedRoute() {
//     return MaterialPageRoute(
//       builder: (_) =>
//           Scaffold(
//             appBar: AppBar(
//               title: const Text('Route not Found'),
//             ),
//             body: const Center(
//               child: Text('Route not Found'),
//             ),
//           ),
//     );
//   }
// }
