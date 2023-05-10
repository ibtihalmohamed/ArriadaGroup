// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Color.fromARGB(255, 227, 227, 227),
      body: Center(
        child: SpinKitDoubleBounce(
          itemBuilder: (context, index) => Image.asset(
              fit: BoxFit.cover,
               'assets/splash.png',),
          size: 70,
        ),
      ),
    );

  }
}
