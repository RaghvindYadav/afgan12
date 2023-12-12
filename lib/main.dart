import 'package:afghan_net/home_page.dart';
import 'package:afghan_net/login.dart';
import 'package:afghan_net/screens/admin_management.dart';
import 'package:afghan_net/splash.dart';
import 'package:afghan_net/web/HomePageWeb.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Af Net',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: _buildHomePage(screenWidth, deviceType));
      },
    );
  }

  Widget _buildHomePage(double screenWidth, DeviceType deviceType) {
    // if (screenWidth < 400 || deviceType == DeviceType.mobile) {
    //   return Splash();
    // } else if (screenWidth < 400) {
    //   return Splash();
    // } else if (screenWidth >= 700 && screenWidth < 1024) {
    //   return Splash();
    // } else if (screenWidth >= 1024 && screenWidth <= 1920) {
    //   return Splash();
    // } else {
      return Splash();
    // }
  }
}
