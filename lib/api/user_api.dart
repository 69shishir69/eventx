import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eventx/api/http_services.dart';
import 'package:eventx/models/user/user.dart';
import 'package:eventx/models/user/user_account.dart';
import 'package:eventx/response/user/login_response.dart';
import 'package:eventx/response/user/profile_response.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';

class UserAPI {
  //Register API
  Future<bool> registerUser(User user) async {
    // debugPrint(user.profile!.fullName);
    bool isSignup = false;
    Response response;
    var url = baseUrl + registerUrl;
    var dio = HttpServices().getDioInstance();

    try {
      response = await dio.post(
        url,
        data: user.toJson(),
      );
      if (response.statusCode == 201) {
        return true;
      } else if (response.statusCode == 400) {
        return false;
      }
    } catch (e) {
      debugPrint("Error: $e");
      return false;
    }
    return isSignup;
  }

  //Login API
  Future<bool> loginUser(String email, String password) async {
    bool isLogin = false;
    try {
      var url = baseUrl + loginUrl;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        data: {
          "email": email,
          "password": password,
          "category":"CUSTOMER",
        },
      );
      // print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        token = loginResponse.data!.token;
        debugPrint("Token: $token");
        if (token != null) {
          isLogin = true;
        }
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isLogin;
  }

  Future<UserAccount?> viewProfile() async {
    UserAccount? userAccount;
    try {
      var url = baseUrl + viewUserProfile;
      var dio = HttpServices().getDioInstance();

      Response response = await dio.get(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );
      debugPrint("dddddddddddddddddddddddd");

      // print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        debugPrint("RRRRRRRRRRRRRRRRRRRRRRRRRRRR");
        ProfileResponse profileResponse = ProfileResponse.fromJson(response.data);
        userAccount = UserAccount(
          id: profileResponse.data!.id,
          profile: profileResponse.data!.profile,
          accountStatus: profileResponse.data!.accountStatus,
          category: profileResponse.data!.category,
          email: profileResponse.data!.email,
          isVerified: profileResponse.data!.isVerified,
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    debugPrint("EEEEEEEEEEEEEEEEEEEEEEEEEEEE${userAccount!.isVerified}");
    return userAccount;
  }

  Future<bool> verifyOTP(String otpCode, String operation, String email) async {
    bool isverified = false;
    try {
      var url = baseUrl + verifyotp;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        data: {
          "otpCode": otpCode,
          "operation": operation,
          "email": email,
        },
      );
      // print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      // debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isverified;
  }

  Future<bool> resendOTP(String operation, String email) async {
    bool isverified = false;
    try {
      var url = baseUrl + resendotp;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        data: {
          "operation": operation,
          "email": email,
        },
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
      );
      // print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      // debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isverified;
  }
}
