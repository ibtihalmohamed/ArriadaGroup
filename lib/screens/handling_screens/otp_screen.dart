import 'package:flutter/material.dart';

import '../../helpers/size_configuration.dart';
import '../../widgets/otp_widgets/otp_body.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.otp,
        ),
      ),
      body: const OtpBody(),
    );
  }
}

