import 'package:flutter/material.dart';
import 'package:front_walleps/screens/dashboard/dashboard_screen.dart';
import 'package:front_walleps/theme/themes.dart';

import 'widgets/AddCard.dart' as AddCard;
import 'widgets/Card.dart' as Card;
import 'package:front_walleps/screens/schedule/schedule_screen.dart';
import 'package:front_walleps/screens/planner/planner_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      initialRoute: '/dashboard',
      // Mapeo de rutas a widgets
      routes: {
        '/dashboard': (context) => DashboardScreen(),
        '/planner': (context) => PlannerScreen(),
      },
    );
  }
}
