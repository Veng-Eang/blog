import 'package:clean_architecture/core/routes/routes.dart';
import 'package:clean_architecture/core/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Blog App',
        theme: AppTheme.dartThemeMode,
        initialRoute: '/signin',
        onGenerateRoute: (settings) => Routes.generateRout(
              settings,
            ));
  }
}
