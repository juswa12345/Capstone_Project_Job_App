import 'package:flutter/material.dart';
import 'package:job_app/widgets/widgets.dart';
import 'package:job_app/components/components.dart';
import 'package:provider/provider.dart';
import '../class_providers/auth.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<Auth>(context, listen: false);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Center(
              child:
                  text(20, TextAlign.center, false, 'Profile', FontWeight.w600),
            ),
            const SizedBox(
              height: 30.0,
            ),
            Column(
              children: [
                Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage:
                          AssetImage('assets/profile_pics/person_ray.jpeg'),
                      radius: 35.0,
                    ),
                    Positioned(
                      bottom: 0.0,
                      right: 1.0,
                      child: Container(
                        height: 20.0,
                        width: 20.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.green,
                          border: Border.all(width: 2.0, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15.0,
                ),
                text(30, TextAlign.center, false, user.fullName!),
                text(14, TextAlign.center, false, 'Your Profile'),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            ProfileTextField(
                label: 'Name', content: user.fullName, hide: false),
            const SizedBox(
              height: 10.0,
            ),
            ProfileTextField(
                label: 'Your Email',
                content: user.email,
                hide: false),
            const SizedBox(
              height: 10.0,
            ),
            const ProfileTextField(
                label: 'Password', content: '123456789', hide: true),
            const SizedBox(
              height: 50.0,
            ),
            const Buttons(route: '/', textContent: 'Edit Profile'),
          ],
        ),
      ),
    );
  }
}
