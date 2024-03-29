import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:southwind/Models/user_data.dart';
import 'package:southwind/data/providers/base_notifer.dart';

class AuthNotifier extends BaseNotifier {
  AuthNotifier();
  bool isLogedIn = false;
  UserData? userData;

  login(String email, password) async {
    log("login");
    final response = await dioClient.postWithFormData(
        apiEnd: loginApiEnd, data: {'email': email, 'password': password});
    log(response.toString());
    if (response is Response) {
      if (response.statusCode == 200) {
        isLogedIn = true;
        userData = UserData.fromJson(response.data['user']);
        notifyListeners();
      }
    }
  }

  logout() {
    isLogedIn = false;
    notifyListeners();
  }
}
