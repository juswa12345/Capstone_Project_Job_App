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

  String? get userId {
    return _userId;
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
        'https://identitytoolkit.googleapis.com/v1/accounts:$urlName?key=AIzaSyATQiBYuQu1MV8xaGMiVyX0bn3zejux9DE');

    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
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

  Future<void> changeEmail(String? email, String? idToken, String? password) async {
    final url = Uri.parse(
        'https://identitytoolkit.googleapis.com/v1/accounts:update?key=AIzaSyATQiBYuQu1MV8xaGMiVyX0bn3zejux9DE');
    try {
      final response = await http.post(
        url,
        body: json.encode(
          {
            'idToken': idToken,
            'email': email,
            'returnSecureToken': true,
          },
        ),
      );

      final passwordResponse = await http.post(
        url,
        body: json.encode(
          {
            'idToken': json.decode(response.body)['idToken'],
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );

      final responseData = json.decode(response.body);
      final passwordResponseData = json.decode(passwordResponse.body);

      print(passwordResponseData);

      if (passwordResponseData['error'] != null) {
        throw HttpException(passwordResponseData['error']['message']);
      }

      if (responseData['error'] != null) {
        throw HttpException(responseData['error']['message']);
      }

      _token = passwordResponseData['idToken'];
      _userId = passwordResponseData['localId'];
      _email = passwordResponseData['email'];
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
}
