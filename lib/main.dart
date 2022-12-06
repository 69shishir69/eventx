
import 'package:eventx/screens/auth/login.dart';
import 'package:eventx/screens/auth/register.dart';
import 'package:eventx/screens/auth/verify_otp.dart';
import 'package:eventx/screens/bottom_nav_bar.dart';
import 'package:eventx/screens/event_booking/choose_cakes.dart';
import 'package:eventx/screens/event_booking/choose_create_event.dart';
import 'package:eventx/screens/event_booking/choose_decorations.dart';
import 'package:eventx/screens/event_booking/choose_drinks.dart';
import 'package:eventx/screens/event_booking/choose_drinks_category.dart';
import 'package:eventx/screens/event_booking/choose_event.dart';
import 'package:eventx/screens/event_booking/choose_theme.dart';
import 'package:eventx/screens/event_booking/choose_venue.dart';
import 'package:eventx/screens/event_booking/details_screen.dart';
import 'package:eventx/screens/event_booking/khalti_payment.dart';
import 'package:flutter/material.dart';
import 'package:khalti_flutter/khalti_flutter.dart';

void main() {
  runApp(
    KhaltiScope(
      publicKey: "test_public_key_fc942fd24afb4b839cd34a596eb4ce8c",
        builder: (context, navigatorKey) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ne', 'NP'),
            ],
            localizationsDelegates: const [
              KhaltiLocalizations.delegate,
            ],
        initialRoute: '/login',
        routes: {
          '/bottomNavBar': (context) => const BottomNavScreen(),

          // Event Booking
          '/chooseVenue': (context) => const ChooseVenueScreen(),
          '/chooseEvent': (context) => const ChooseEventScreen(),
          '/chooseTheme':(context) => const ChooseThemeScreen(),
          '/chooseDrinks':(context) => const ChooseDrinksScreen(),
          '/chooseDrinksCategory':(context) => const ChooseDrinksCategoryScreen(),
          '/chooseCakes':(context) => const ChooseCakesScreen(),
          '/chooseCreateEventScreen':(context)=> const ChooseCreateEventScreen(),
          '/chooseDecorationScreen':(context)=> const ChooseDecorationsScreen(),
          '/detailsScreen':(context) => const DetailsScreen(),
          '/khaltiPaymentScreen':(context) =>const KhaltiPaymentScreen(),
          
          // Auth User
          '/login':(context) => const LoginScreen(),
          '/register':(context) => const RegisterScreen(),
          '/OTPVerification':(context) => const OTPVerification(),
        },
      );}
    ),
  );
}
