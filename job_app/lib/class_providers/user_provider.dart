import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:job_app/models/models.dart';

class UserProvider with ChangeNotifier {
  List _users = [];

  List get users {
    return [..._users];
  }

  // void addData() {
  //   _users.add();
  //   notifyListeners();
  // }
  Future<dynamic> getUserData() async {
    final String response =
    await rootBundle.loadString('assets/sample_data/user.json');
    final data = await json.decode(response);
    _users = data["users"];
    notifyListeners();
  }
}
