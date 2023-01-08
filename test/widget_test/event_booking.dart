import 'package:eventx/models/cake/cake_model.dart';
import 'package:eventx/models/theme/theme_model.dart';
import 'package:eventx/repository/event_booking.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  // String? token;
  // setUp(() {
  //   token =
  //       "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwSUQiOiI2MmI5MzIzYjRiMGExMTI3ZTI2ZTg2NzciLCJpYXQiOjE2NTYzMDUxMzJ9.b0mDsiOctIg0jwDRhEwxX2gRlE8FPhXG9DShMrgluVk";
  //   categoryRepository = CategoryRepository();
  // });

  // test("show EVENt", () async {
  //   String? expectedResult = "Special Birthday";
  //   debugPrint(expectedResult);

  //   List<EventModel?> actualResultList =
  //       await EventRepository().loadEventType();
  //   debugPrint(expectedResult);

  //   debugPrint(actualResultList.toString());
  //   String? actualResult = actualResultList[0]!.name;
  //   expect(expectedResult, actualResult);
  // });

  test("show Theme", () async {
    String? expectedResult = "Halloween";
    debugPrint(expectedResult);

    List<ThemeModel?> actualResultList =
        await EventRepository().loadThemeType();
    debugPrint(expectedResult);

    debugPrint(actualResultList.toString());
    String? actualResult = actualResultList[0]!.name;
    expect(expectedResult, actualResult);
  });

  test("show Cake", () async {
    String? expectedResult = "Red Velvet";
    debugPrint(expectedResult);

    List<CakeModel?> actualResultList =
        await EventRepository().loadCakeType();
    debugPrint(expectedResult);

    debugPrint(actualResultList.toString());
    String? actualResult = actualResultList[0]!.name;
    expect(expectedResult, actualResult);
  });

  

  // test("show Department", () async {
  //   String? expectedResult = "Women's Health";
  //   debugPrint(expectedResult);

  //   List<HealthCategory?> actualResultList =
  //       await CategoryRepository().loadHealthCategory();
  //   debugPrint(expectedResult);

  //   debugPrint(actualResultList.toString());
  //   String? actualResult = actualResultList[0]!.name;
  //   expect(expectedResult, actualResult);
  // });

  // test("show Date", () async {
  //   String? expectedResult = "Tuesday, 24 December, 2021";
  //   debugPrint(expectedResult);
  //   String hcId = "62b491ca29d24b17c62174d8";

  //   List<AppointmentHDTModel?> actualResultList =
  //       await CategoryRepository().loadAppointmentHDT(hcId);
  //   debugPrint(expectedResult);

  //   debugPrint(actualResultList.toString());
  //   String? actualResult = actualResultList[0]!.date;
  //   expect(expectedResult, actualResult);
  // });
}
