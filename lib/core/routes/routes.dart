import 'package:clean_architecture/features/auth/presentation/page/sign_in_page.dart';
import 'package:clean_architecture/features/auth/presentation/page/sign_up_page.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRout(RouteSettings settings) {
    switch (settings.name) {
      case '/signin':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignInPage(),
        );
      case '/signup':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignUpPage(),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const SignInPage(),
        );
    }
  }
}
