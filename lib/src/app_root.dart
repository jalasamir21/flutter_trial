import 'package:flutter/material.dart';
import 'package:trial/components/detail_booking.dart';
import 'package:trial/screens/home_view.dart';
import 'package:trial/screens/login.dart';
import 'package:trial/screens/payment_method.dart';
import 'package:trial/screens/register.dart';
import 'package:trial/screens/travel_bookinig_page.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelBookingPage(),
    );
  }
}