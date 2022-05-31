import 'package:flutter/material.dart';
import 'screens/screens.dart';

void main() => runApp(const JobApp());

class JobApp extends StatelessWidget {
  const JobApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Job App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
              .copyWith(secondary: Colors.green),
          fontFamily: 'Poppins'),
      home: const SplashScreen(),
      routes: {
        SplashScreen.routeName: (context) => const SplashScreen(),
        LogInScreen.routeName: (context) => const LogInScreen(),
        RegisterScreen.routeName: (context) => const RegisterScreen(),
        NavigationBarManager.routeName: (context) => const NavigationBarManager(),
        MainScreen.routeName: (context) => const MainScreen(),
      },
    );
  }
}
