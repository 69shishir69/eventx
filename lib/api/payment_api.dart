import 'dart:io';

import 'package:dio/dio.dart';
import 'package:eventx/api/http_services.dart';
import 'package:eventx/models/payment/payment_details.dart';
import 'package:eventx/utils/url.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';

class PaymentAPI {
  Future<bool> postTransaction(PaymentDetails paymentDetails) async {
    bool isverified = false;
    try {
      var url = baseUrl + postTransactionUrl;
      var dio = HttpServices().getDioInstance();
      debugPrint("TRY1..............................");
      FormData formData;
      if (paymentDetails.customCakeImage == null) {
        formData = FormData.fromMap({
          "payment": {
            "token": paymentDetails.payment!.token,
            "idx": paymentDetails.payment!.idx,
          },
          "eventType": paymentDetails.eventType,
          "date": paymentDetails.date,
          "numberOfPeople": paymentDetails.numberOfPeople,
          "venue": paymentDetails.venue,
          "theme": paymentDetails.theme,
          "drinks": paymentDetails.drinks,
          "decorations": paymentDetails.decorations,
          "cakes": paymentDetails.cakes,
        });
      } else {
        debugPrint("Filname: ${paymentDetails.customCakeImage!.split("/").last}");
        debugPrint("cake...................");
        formData = FormData.fromMap({
          "payment": {
            "token": paymentDetails.payment!.token,
            "idx": paymentDetails.payment!.idx,
          },
          "eventType": paymentDetails.eventType,
          "date": paymentDetails.date,
          "numberOfPeople": paymentDetails.numberOfPeople,
          "venue": paymentDetails.venue,
          "theme": paymentDetails.theme,
          "drinks": paymentDetails.drinks!.map((obj) => obj!.toJson()).toList(),
          "decorations": paymentDetails.decorations!,
          "cakes": paymentDetails.cakes!.map((obj) => obj!.toJson()).toList(),
          "customCakeImage": await MultipartFile.fromFile(
              paymentDetails.customCakeImage!,
              filename: paymentDetails.customCakeImage!.split("/").last,
              contentType: MediaType(
                "image",
                "jpeg",
              ),),
          // "customCakeImage":File(paymentDetails.customCakeImage!) ,
          "customCakePound": paymentDetails.customCakePound,
        });
      }

      Response response = await dio.post(
        url,
        options: Options(
          headers: {HttpHeaders.authorizationHeader: "$token"},
        ),
        data: formData,
      );
      debugPrint("Payment API response: : : ${response.data}");

      debugPrint(
          "okkkkkkkkkkkkkkkkkkkkkkkkkkkkk:ygasjhgdjhgaskhdgkjsahdjsahjhdhkjasdkj");
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
