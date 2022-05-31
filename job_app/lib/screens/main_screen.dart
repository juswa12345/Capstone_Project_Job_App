import 'package:flutter/material.dart';
import 'package:job_app/class_providers/jobdata.dart';
import 'package:job_app/class_providers/user_provider.dart';
import 'package:provider/provider.dart';
import 'package:job_app/models/models.dart';
import 'package:job_app/screens/screens.dart';

import '../class_providers/auth.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);
  static const routeName = '/mainScreen';
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => TabManager()),
        ChangeNotifierProvider(create: (context) => UserProvider()),
        ChangeNotifierProvider(create: (context) => JobData()),
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child:
      Consumer<Auth>(
        builder: (context, auth, child) => MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.teal)
                .copyWith(secondary: Colors.green),
            fontFamily: 'Poppins',
          ),
          color: const Color(0xffE5E5E5),
          home: auth.isAuth ? const NavigationBarManager() : const LogInScreen(),
        ),
      ),
    );
  }
}
