import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:job_app/models/models.dart';

class MainApi{

  Future<List<Users>> getUsers() async{
    await Future.delayed(const Duration(milliseconds: 1000));
    final dataString = await _loadAsset('assets/sample_data/user.json');
    final Map<String, dynamic> json = jsonDecode(dataString);


    if(json['users'] != null){
      final users = <Users>[];
      json['users'].forEach((v){
        users.add(Users.fromJson(v));
      });
      return users;
    } else {
      return List.empty(growable: true);
    }
  }

  Future<String> _loadAsset(String path) async {
    return rootBundle.loadString(path);
  }
}