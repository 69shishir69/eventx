import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eventx/api/http_services.dart';
import 'package:eventx/models/payment/payment_details.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';

class PaymentAPI {
  Future<bool> postTransaction(PaymentDetails paymentDetails) async {
    bool isverified = false;
    try {
      var url = baseUrl + postTransactionUrl;
      var dio = HttpServices().getDioInstance();
      Response response = await dio.post(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
        data: paymentDetails.toJson(),
      );
      print("ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
      // debugPrint("lllll${response.data}");
      if (response.statusCode == 200) {
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return isverified;
  }

  // Future<List<PastEvents?>> loadPastEvents() async {
  //   List<PastEvents?> pastEventsList = [];
  //   Response response;
  //   var url = baseUrl + getAllTheme;

  //   var dio = HttpServices().getDioInstance();

  //   try {
  //     response = await dio.get(url);

  //     if (response.statusCode == 200) {
  //       LoadThemeModelResponse loadThemeModelResponse =
  //           LoadThemeModelResponse.fromJson(response.data);

  //       for (var data in loadThemeModelResponse.data) {
  //         pastEventsList.add(
  //           PastEvents(
  //             id: data!.id,
  //             token: data!.token,
  //             idx: data!.idx,
  //             amount: data!.amount,
  //             cakes: data!.cakes,
  //             decoration: data!.decoration,
  //             drinks: data!.drinks,
  //             event: data!.event,
  //             theme: data!.theme,
  //             venue: data!.venue,
  //           ),
  //         );
  //       }
  //     }
  //   } catch (e) {
  //     debugPrint('Failed to get category $e');
  //   }

  //   return pastEventsList;
  // }
}
