import 'package:flutter/material.dart';
import 'package:stritva/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class UserData with ChangeNotifier {
  final _user = User(' ', ' ', 100, DateTime.now(), 100);
  User get user => _user;

  Future<void> _saveUserToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedUser = json.encode(_user.toJson());
    prefs.setString('user', encodedUser);
  }

  Future<void> getUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedUser = prefs.getString('user');
    if (encodedUser != null) {
      final decodedUser = json.decode(encodedUser);
      print(decodedUser);

      _user.username = decodedUser['username'];
      _user.email = decodedUser['email'];
      _user.cycleLength = decodedUser['cycleLength'];
      _user.recentPeriodDate = DateTime.parse(decodedUser['recentPeriodDate']);
      _user.periodLength = decodedUser['periodLength'];
    }
    notifyListeners();
  }

  void addNameEmail(String userName, String email) {
    _user.username = userName;
    _user.email = email;
    _saveUserToPrefs();
    notifyListeners();
  }

  void addCycleLength(int cycleLength) {
    _user.cycleLength = cycleLength;
    _saveUserToPrefs();

    notifyListeners();
  }

  void addRecentPeriodDate(DateTime recentPeriodDate) {
    _user.recentPeriodDate = recentPeriodDate;
    _saveUserToPrefs();
    notifyListeners();
  }

  void addPeriodLength(int periodLength) {
    _user.periodLength = periodLength;
    _saveUserToPrefs();
    notifyListeners();
  }
}
