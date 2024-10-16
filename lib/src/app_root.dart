import 'package:flutter/material.dart';
import 'package:trial/screens/home_page.dart';
import 'package:trial/screens/home_view.dart';
import 'package:trial/screens/register.dart';
import 'package:trial/components/bottom_nav_bar.dart';


class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Register(),
    );
  }
}