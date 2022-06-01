import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:job_app/models/freezed_model/user.dart';
import 'package:http/http.dart' as http;

class UserProvider with ChangeNotifier {
  final List<User> _userInformation = [];
  String? userId;
  String? authToken;

  List<User> get userInformation{
    return [..._userInformation];
  }

  Future<void> editUser(User user, String auth, String id) async {
    final url = Uri.parse(
        'https://jobs-93704-default-rtdb.firebaseio.com/user_info.json?auth=$auth');
    try {
      final response = await http.put(
        url,
        body: json.encode(
          {
            'id' : id,
            'name': user.fullName,
            'imgUrl': user.imgUrl,
            'username': user.username,
            'email': user.email,
            'password': user.password,
          },
        ),
      );
      print(response.body);
      final newUser = User(
        id: id,
        imgUrl: user.imgUrl,
        username: user.username,
        email: user.email,
        password: user.password,
        fullName: user.fullName,
      );
      if(_userInformation.isNotEmpty){
        _userInformation[0] = newUser;
      } else {
        _userInformation.add(newUser);
      }
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> fetchUser(String auth) async {
    final url = Uri.parse(
        'https://jobs-93704-default-rtdb.firebaseio.com/user_info.json?auth=$auth');
    try {
      final response = await http.get(url);
      print(response.body);
      final newUser = User(
        id: json.decode(response.body)['id'],
        imgUrl: json.decode(response.body)['imgUrl'],
        username: json.decode(response.body)['username'],
        email: json.decode(response.body)['email'],
        password: json.decode(response.body)['password'],
        fullName: json.decode(response.body)['name'],
      );
      if(_userInformation.isNotEmpty){
        _userInformation[0] = newUser;
      } else {
        _userInformation.add(newUser);
      }
      notifyListeners();
    } catch (error) {
      print(error);
      throw error;
    }
  }

}
