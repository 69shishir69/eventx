import 'package:eventx/screens/auth/forgot_password.dart';
import 'package:eventx/screens/auth/login.dart';
import 'package:eventx/screens/auth/register.dart';
import 'package:eventx/screens/auth/verify_otp.dart';
import 'package:eventx/screens/bottom_nav_bar.dart';
import 'package:eventx/screens/edit_selections/edit_cakes.dart';
import 'package:eventx/screens/edit_selections/edit_decorations.dart';
import 'package:eventx/screens/edit_selections/edit_details_screen.dart';
import 'package:eventx/screens/edit_selections/edit_drinks.dart';
import 'package:eventx/screens/edit_selections/edit_drinks_category.dart';
import 'package:eventx/screens/edit_selections/edit_event.dart';
import 'package:eventx/screens/edit_selections/edit_theme.dart';
import 'package:eventx/screens/edit_selections/edit_venue.dart';
import 'package:eventx/screens/event_booking/choose_cakes.dart';
import 'package:eventx/screens/event_booking/choose_create_event.dart';
import 'package:eventx/screens/event_booking/choose_decorations.dart';
import 'package:eventx/screens/event_booking/choose_drinks.dart';
import 'package:eventx/screens/event_booking/choose_drinks_category.dart';
import 'package:eventx/screens/event_booking/choose_event.dart';
import 'package:eventx/screens/event_booking/choose_theme.dart';
import 'package:eventx/screens/event_booking/choose_venue.dart';
import 'package:eventx/screens/event_booking/details_screen.dart';
import 'package:eventx/screens/event_booking/eventx_chatpage.dart';
import 'package:eventx/screens/event_booking/khalti_payment.dart';
import 'package:eventx/screens/event_draft/details_screen_draft.dart';
import 'package:eventx/screens/event_draft/khalti_payment_draft.dart';
import 'package:eventx/screens/event_draft/track_event.dart';
import 'package:eventx/screens/past_events_screen.dart';
import 'package:eventx/screens/profile/edit_profile_screen.dart';
import 'package:eventx/screens/staff_chat.dart';
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
          '/bottomNavBar': (context) => const BottomNavBar(),

          // Event Bookingdis
          '/chooseVenue': (context) => const ChooseVenueScreen(),
          '/chooseEvent': (context) => const ChooseEventScreen(),
          '/chooseTheme':(context) => const ChooseThemeScreen(),
          '/chooseDrinks':(context) => const ChooseDrinksScreen(),
          '/chooseDrinksCategory':(context) => const ChooseDrinksCategoryScreen(),
          '/chooseCakes':(context) => const ChooseCakesScreen(),
          '/chooseCreateEventScreen':(context)=> const ChooseCreateEventScreen(),
          '/chooseDecorationScreen':(context)=> const ChooseDecorationsScreen(),
          '/detailsScreen':(context) => const DetailsScreen(),

          // Edit Selections
          '/editVenue' :(context) => const EditVenueScreen(),
          '/editEvent' :(context) => const EditEventScreen(),
          '/editTheme':(context) => const EditThemeScreen(),
          '/editCakes':(context) => const EditCakesScreen(),
          '/editDecoration':(context) => const EditDecorationsScreen(),
          '/editDrinks':(context) => const EditDrinksScreen(),
          '/editDrinksCategory':(context) => const EditDrinksCategoryScreen(),
          '/editDetailsScreen':(context) => const EditDetailsScreen(),

          // Khalti Payment
          '/khaltiPaymentScreen':(context) =>const KhaltiPaymentScreen(),
          '/khaltiPaymentDraftScreen':(context) =>const KhaltiPaymentDraftScreen(),
          
          // Auth User
          '/login':(context) => const LoginScreen(),
          '/register':(context) => const RegisterScreen(),
          '/OTPVerification':(context) => const OTPVerification(),
          '/forgotPassword':(context) => const ForgotPasswordScreen(),

          // Chat with Staff
          '/chat':(context) => const EventXChatPage(),
          '/chatStaff':(context) => const StaffChatPage(),

          // Draft Events
          '/detailsScreenDraft':(context) => const DetailsScreenDraft(),
          '/eventTrack':(context) => const TrackEvent(),

          // for trying
          '/pastEventsScreen':(context) => const PastEventsScreen(),

          // for Profile
          '/editProfile':(context) => const EditProfileScreen(),
        },
      );}
    ),
  );
}
