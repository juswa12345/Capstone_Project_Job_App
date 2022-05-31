import 'dart:io';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String? _token;
  DateTime _expiryDate = DateTime.now();
  String? _email;
  String? _userId;
  String? _fullName;
  String mode = 'login';

  String? get email {
    return _email;
  }

  String? get fullName {
    return _fullName;
  }


  bool get isAuth {
    if (mode == 'login') {
      return token != null;
    }

    return false;
  }

  String? get token {
    if (_expiryDate != null &&
        _expiryDate.isAfter(DateTime.now()) &&
        _token != null) {
      return _token;
    }
    return null;
  }

  Future<void> _authenticate(
      String? email, String? password, String? urlName) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlName?key=AIzaSyA0HINijz0mW4sPOgnspu-kTLdcvLDpgQk');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {'email': email, 'password': password, 'returnSecureToken': true},
        ),
      );
      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }
      _token = responseData['idToken'];
      _userId = responseData['localId'];
      _email = responseData['email'];
      _fullName = responseData['displayName'];
      _expiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(
            responseData['expiresIn'],
          ),
        ),
      );
      notifyListeners();
    } catch (error) {
      throw error;
    }
  }

  Future<void> signup(String? email, String? password) async {
    mode = 'signup';
    return _authenticate(email, password, 'signUp');
  }

  Future<void> signin(String? email, String? password) async {
    mode = 'login';
    return _authenticate(email, password, 'signInWithPassword');
  }

}
