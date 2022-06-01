import 'dart:io';

import 'package:flutter/material.dart';
import 'package:job_app/widgets/widgets.dart';
import 'package:provider/provider.dart';
import '../class_providers/auth.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/registerScreen';

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final Map<String, String> _authData = {
    'username': '',
    'email': '',
    'password': '',
  };

  var _isLoading = false;
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            color: Colors.grey,
          ),
          margin: const EdgeInsets.all(20.0),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: text(12, TextAlign.center, true, message),
          ),
        ),
        duration: const Duration(seconds: 2),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
    );
  }

  Future<void> _submit() async {
    setState(() {
      _isLoading = true;
    });
    try {
      // Register
      await Provider.of<Auth>(context, listen: false).signup(
        _authData['email'],
        _authData['password'],
      );
    } on HttpException catch (error) {
      var errorMessage = 'Could not authenticate';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email already Exist!';
      } else if (error.toString().contains('INVALID_EXISTS')) {
        errorMessage = 'This email is not a VALID email!';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that Email!';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This Password is too weak.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'This Password is INVALID!';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This Email is INVALID!';
      }
      _showSnackBar(errorMessage);
    }
    catch (error) {
      const errorMessage = 'Could not authenticate';
      _showSnackBar(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text(30, TextAlign.start, false, 'Welcome Back!',
                        FontWeight.w900),
                    Padding(
                      padding: const EdgeInsets.only(right: 120.0),
                      child: text(16, TextAlign.start, true,
                          'Fill your details or continue with social media'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: 'Username',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (_usernameController.text.isEmpty) {
                              return 'Invalid username';
                            }
                            return null;
                          },
                          controller: _usernameController,
                          onChanged: (value) {
                            _authData['username'] = _usernameController.text;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.email_outlined),
                            hintText: 'Email Address',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (_emailController.text.isEmpty || _emailController.text.contains('@') && _emailController.text.contains('.com')) {
                              return 'Invalid email';
                            }
                            return null;
                          },
                          controller: _emailController,
                          onChanged: (value) {
                            _authData['email'] = _emailController.text;
                          },
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          color: Colors.white,
                        ),
                        padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            prefixIcon: Icon(Icons.lock_outline_rounded),
                            hintText: 'Password',
                          ),
                          obscureText: true,
                          controller: _passwordController,
                          validator: (value) {
                            if (_passwordController.text.isEmpty || _passwordController.text.length < 8 ) {
                              return 'Password is too short';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            _authData['password'] = _passwordController.text;
                          },
                        ),
                      ),
                    ),
                    text(12, TextAlign.end, false, 'Forget Password?'),
                    if (_isLoading)
                      const Center(child: CircularProgressIndicator())
                    else
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                        child: MaterialButton(
                          onPressed: _submit,
                          color: Colors.teal,
                          textColor: Colors.white,
                          padding: const EdgeInsets.only(
                            top: 20.0,
                            bottom: 20.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: text(
                            16.0,
                            TextAlign.center,
                            true,
                            'SIGN UP',
                            FontWeight.w200,
                          ),
                        ),
                      ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    text(16, TextAlign.center, false, '- Or Continue with –'),
                    const SizedBox(
                      height: 30.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        ImageContainer(
                          align: Alignment.center,
                          width: 60,
                          height: 60,
                          imgUrl: 'assets/icons/google.png',
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        ImageContainer(
                          align: Alignment.center,
                          width: 60,
                          height: 60,
                          imgUrl: 'assets/icons/facebook.png',
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        text(16, TextAlign.center, false, 'Already have an Account? '),
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: text(16, TextAlign.center, false, 'Log in', FontWeight.w500),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
