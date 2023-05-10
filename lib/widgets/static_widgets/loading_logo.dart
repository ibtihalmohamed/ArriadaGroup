import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingLogo extends StatelessWidget {
  const LoadingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return SpinKitDoubleBounce(
      itemBuilder: (context, index) => Image.asset(
        fit: BoxFit.cover,
        'assets/splash.png',
      ),
      size: 70,
    );
  }
}
