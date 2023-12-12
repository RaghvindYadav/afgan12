import 'package:afghan_net/home_page.dart';
import 'package:afghan_net/login.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    print("splash");
    Future.delayed(Duration(seconds: 1), () {
      GetStorage sr = GetStorage();
      final token = sr.read('token');
      print(token);
      if(token != null){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      }else{
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LoginPage()),
        );
      }

    });

    return Scaffold(
      body: Center(
        // Customize this with your splash screen content
        child: Image.asset(
          'assets/splash.png',
          filterQuality: FilterQuality.high,
        ),
      ),
    );
  }
}
