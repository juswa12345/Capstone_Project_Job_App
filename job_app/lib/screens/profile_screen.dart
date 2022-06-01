import 'package:flutter/material.dart';
import 'package:job_app/class_providers/user_provider.dart';
import 'package:job_app/models/freezed_model/user.dart';
import 'package:job_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../class_providers/auth.dart';
import 'dart:io';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isEnabled = true;
  bool changeProfile = false;
  bool showSelectProfile = false;

  String _fullName = '';
  String _email = '';
  String _password = '';
  String _imgUrl = '';

  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _imgUrlController = TextEditingController();

  void _enable() {
    setState(() {
      isEnabled = !isEnabled;
    });
  }

  bool _isLoading = false;

  Future<void> editProfile() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 2000));
    final user = Provider.of<Auth>(context, listen: false);
    final userInfo = Provider.of<UserProvider>(context, listen: false);
    final editedProfile = User(
      id: user.userId!,
      imgUrl: userInfo.userInformation[0].imgUrl,
      username: '',
      email: _email != '' ? _email : userInfo.userInformation[0].email,
      password:
          _password != '' ? _password : userInfo.userInformation[0].password,
      fullName:
          _fullName != '' ? _fullName : userInfo.userInformation[0].fullName,
    );
    if (isEnabled) {
      await userInfo.editUser(editedProfile, user.token!, user.userId!);
      await user.changeEmail(
        _email != '' ? _email : userInfo.userInformation[0].email,
        user.token!,
        _password != '' ? _password : userInfo.userInformation[0].password,
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  Future<void> editProfilePicture() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(const Duration(milliseconds: 2000));
    final user = Provider.of<Auth>(context, listen: false);
    final userInfo = Provider.of<UserProvider>(context, listen: false);
    final editedProfile = User(
      id: userInfo.userInformation[0].id,
      imgUrl: _imgUrl != '' ? _imgUrl : userInfo.userInformation[0].imgUrl,
      username: '',
      email: userInfo.userInformation[0].email,
      password: userInfo.userInformation[0].password,
      fullName: userInfo.userInformation[0].fullName,
    );
    if (isEnabled) {
      await userInfo.editUser(editedProfile, user.token!, user.userId!);
    }
    setState(() {
      _isLoading = false;
      changeProfile = false;
      showSelectProfile = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userInfo = Provider.of<UserProvider>(context, listen: false);
    String hashPass() {
      String password = userInfo.userInformation[0].password;
      _password =
          password.replaceRange(0, password.length, '*' * password.length);
      return _password;
    }

    final user = userInfo.userInformation[0];

    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(
                children: [
                  Center(
                    child: text(20, TextAlign.center, false, 'Profile',
                        FontWeight.w600),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                changeProfile = !changeProfile;
                                showSelectProfile = false;
                              });
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                user.imgUrl == ''
                                    ? 'assets/profile_pics/blank_profile.png'
                                    : user.imgUrl,
                              ),
                              radius: 35.0,
                            ),
                          ),
                          !changeProfile
                              ? Positioned(
                                  bottom: 0.0,
                                  right: 1.0,
                                  child: Container(
                                    height: 20.0,
                                    width: 20.0,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green,
                                      border: Border.all(
                                          width: 2.0, color: Colors.white),
                                    ),
                                  ),
                                )
                              : Positioned(
                                  bottom: 0.0,
                                  right: 0.0,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        showSelectProfile = !showSelectProfile;
                                      });
                                    },
                                    child: Container(
                                      height: 30.0,
                                      width: 30.0,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 2.0, color: Colors.black),
                                      ),
                                      child:
                                          const Center(child: Icon(Icons.add)),
                                    ),
                                  ),
                                )
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      text(30, TextAlign.center, false,
                          user.fullName == '' ? 'Your Name' : user.fullName),
                      text(14, TextAlign.center, false, 'Your Profile'),
                    ],
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      showSelectProfile
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                text(10, TextAlign.start, false,
                                    'Enter Image File'),
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18.0)),
                                    color: Colors.white,
                                  ),
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 12.0),
                                  child: Row(
                                    children: [
                                      Flexible(
                                        child: TextField(
                                          style: const TextStyle(
                                            fontSize: 14.0,
                                            fontFamily: 'Poppins',
                                          ),
                                          controller: _imgUrlController,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: userInfo
                                                .userInformation[0].imgUrl,
                                            hintStyle: const TextStyle(
                                              fontSize: 14.0,
                                              fontFamily: 'Poppins',
                                            ),
                                          ),
                                          onChanged: (value) {
                                            _imgUrl = _imgUrlController.text;
                                          },
                                          autocorrect: false,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10.0,
                                      ),
                                      IconButton(
                                        onPressed: () => editProfilePicture(),
                                        icon: const Icon(Icons.check_rounded),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : text(10, TextAlign.start, false, 'Name'),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Poppins',
                          ),
                          controller: _fullNameController,
                          keyboardType: TextInputType.name,
                          readOnly: isEnabled,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: user.fullName == ''
                                ? 'Your Name'
                                : user.fullName,
                            hintStyle: const TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onChanged: (value) {
                            _fullName = _fullNameController.text;
                          },
                          autocorrect: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      text(10, TextAlign.start, false, 'Your Email'),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Poppins',
                          ),
                          controller: _emailController,
                          readOnly: isEnabled,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: user.email,
                            hintStyle: const TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          onChanged: (value) {
                            _email = _emailController.text;
                          },
                          autocorrect: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      text(10, TextAlign.start, false, 'Password'),
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: TextField(
                          style: const TextStyle(
                            fontSize: 14.0,
                            fontFamily: 'Poppins',
                          ),
                          controller: _passwordController,
                          readOnly: isEnabled,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: hashPass(),
                            hintStyle: const TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Poppins',
                            ),
                          ),
                          obscureText: true,
                          onChanged: (value) {
                            _password = _passwordController.text;
                          },
                          autocorrect: false,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  MaterialButton(
                    onPressed: () {
                      _enable();
                      isEnabled ? editProfile() : '';
                    },
                    child: text(
                      16.0,
                      TextAlign.center,
                      true,
                      isEnabled ? 'Edit Profile' : 'Save Profile',
                      FontWeight.w200,
                    ),
                    color: Colors.teal,
                    textColor: Colors.white,
                    padding: const EdgeInsets.only(
                      top: 20.0,
                      bottom: 20.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
