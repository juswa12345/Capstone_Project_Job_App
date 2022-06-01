import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class JobData with ChangeNotifier {
  Map<String, dynamic> _jobData = {};
  Map<String, dynamic> _recentPost = {};
  Map<String, dynamic> _jobFilter = {};
  bool _error = false;
  String _message = '';

  Map<String, dynamic> get jobData => _jobData;
  Map<String, dynamic> get recentPost => _recentPost;
  Map<String, dynamic> get jobFilter => _jobFilter;
  bool get error => _error;
  String get errorMessage => _message;

  Future<void> get getData async {
    await Future.delayed(const Duration(milliseconds: 3000));
    final response =
        await rootBundle.loadString('assets/sample_data/sample_job_data.json');

    if (response != '') {
      try {
        _jobData = await jsonDecode(response);
        _error = false;
        _message = '';
      } catch (e) {
        _error = true;
        _message = e.toString();
        _jobData = {};
      }
    } else {
      _error = true;
      _message = 'Error: Files Invalid!';
      _jobData = {};
    }
    notifyListeners();
  }

  Future<void> get getRecentPost async {
    await Future.delayed(const Duration(milliseconds: 4000));
    final response = await rootBundle
        .loadString('assets/sample_data/sample_recent_post.json');

    if (response.isNotEmpty) {
      try {
        _recentPost = await jsonDecode(response);
        _error = false;
        _message = '';
      } catch (e) {
        _error = true;
        _message = e.toString();
        _recentPost = {};
      }
    } else {
      _error = true;
      _message = 'Error: Files Invalid!';
      _recentPost = {};
    }
    notifyListeners();
  }

  Future<void> postToDatabase(
      String id,
      String title,
      String imgUrl,
      String location,
      String category,
      String jobType,
      int salary,
      String timePosted) async {
    final url = Uri.parse(
        'https://jobs-93704-default-rtdb.firebaseio.com/recentPost.json');
    final data = await http.post(
      url,
      body: json.encode(
        {
          "id": id,
          "title": title,
          "imgUrl": imgUrl,
          "location": location,
          "category": category,
          "job type": jobType,
          "salary": salary,
          "time posted": timePosted
        },
      ),
    );
  }

  Future<void> get getJobFilter async {
    final response =
        await rootBundle.loadString('assets/sample_data/filter.json');

    if (response != '') {
      try {
        _jobFilter = await jsonDecode(response);
        _error = false;
        _message = '';
      } catch (e) {
        _error = true;
        _message = e.toString();
        _jobFilter = {};
      }
    } else {
      _error = true;
      _message = 'Error: Files Invalid!';
      _jobFilter = {};
    }
    notifyListeners();
  }

  String timeConverter(String time) {
    double newTime = double.parse(time);
    double currentTime = newTime;
    if (newTime > 3599) {
      currentTime = (newTime / 60) / 60;
      return '${(currentTime < 10) ? "0" : ""}${currentTime.floor().toString()}h';
    }
    if (newTime > 59) {
      currentTime = newTime / 60;
      return '${(currentTime < 10) ? "0" : ""}${currentTime.floor().toString()}m';
    }
    return '${(currentTime < 10) ? "0" : ""}${currentTime.floor().toString()}s';
  }

  Map<String, dynamic> getSortedData(Map<String, dynamic> data){
    final newData = data['recent_jobs'].sort((a, b) => int.parse(a['time posted']).compareTo(int.parse(b['time posted'])));
    return newData;
  }

}
