import 'package:flutter/material.dart';

import '../../helpers/constants.dart';
import '../../helpers/size_configuration.dart';
import 'otp_form_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpBody extends StatelessWidget {
  const OtpBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: SizeConfig.screenHeight * 0.05),
              Text(
                AppLocalizations.of(context)!.otp,
                style: headingStyle,
              ),
              Text(
                AppLocalizations.of(context)!.we,
              ),
              buildTimer(),
              const OtpForm(),
              SizedBox(height: SizeConfig.screenHeight * 0.1),
              GestureDetector(
                onTap: () {
                  // OTP code resend
                },
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                      AppLocalizations.of(context)!.code,
                    )));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.resend,
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("This code will expired in "),
        TweenAnimationBuilder(
          tween: Tween(begin: 30.0, end: 0.0),
          duration: const Duration(seconds: 30),
          builder: (_, dynamic value, child) => Text(
            "00:${value.toInt()}",
            style: const TextStyle(color: mainColor),
          ),
        ),
      ],
    );
  }
}
