import 'package:flutter/material.dart';
import 'package:job_app/widgets/widgets.dart';
import 'package:job_app/screens/screens.dart';

import 'login_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const routeName = '/splashScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
          left: 20.0,
          right: 20.0,
          bottom: 20.0,
        ),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const ImageContainer(
                  align: Alignment.topLeft,
                  width: 20.0,
                  height: 20.0,
                  imgUrl: 'assets/splash_screen_images/logo.png',
                ),
                Container(
                  padding: const EdgeInsets.only(
                    top: 40.0,
                    left: 50.0,
                    right: 50.0,
                  ),
                  alignment: Alignment.center,
                  child: Image.asset(
                      'assets/splash_screen_images/center_image.png'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 25.0,
                    right: 25.0,
                  ),
                  child: text(
                    34.0,
                    TextAlign.center,
                    true,
                    'Find a Perfect Job Match',
                    FontWeight.bold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: text(
                    16.0,
                    TextAlign.center,
                    true,
                    'Finding your dream job is more easier and faster with JobHub',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 45.0,
                    right: 45.0,
                  ),
                  child: Buttons(
                    route: MainScreen.routeName,
                    textContent: 'Let\'s Get Started >',
                  )
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
