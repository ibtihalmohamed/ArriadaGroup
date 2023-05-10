import 'package:arriada_group01/helpers/constants.dart';
import 'package:arriada_group01/screens/auth_screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ForgotPassScreen extends StatelessWidget {
  const ForgotPassScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Padding(padding: EdgeInsets.symmetric(horizontal: 20)),
              Row(
                children: [
                  IconButton(
                      onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LoginScreen())),
                      // alignment: Alignment.topLeft,
                      icon: const Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                      )),
                  Text(
                    AppLocalizations.of(context)!.forget,
                    style: TextStyle(fontSize: 24, color: mainColor),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  AppLocalizations.of(context)!.peye,
                  // 'Please, enter your email.\nand You will receive an otp code to reset your password.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextFormField(
                  // controller: passController,
                  // obscureText: isShowPass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(16))),
                    // labelText: "Email",
                    hintText: AppLocalizations.of(context)!.singinfore,
                    alignLabelWithHint: true,

                    labelStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  //ليش مش حاطة بتن هنا
                  //حاطه بوتن بس مش الرئسية
                  style: ElevatedButton.styleFrom(
                    backgroundColor: mainColor,
                    //main color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                  ),
                  onPressed: () {
                    // authViewModel
                    //     .login()
                    //     .then((value) => Navigator.pop(context));
                  },
                  child: Text(
                    AppLocalizations.of(context)!.send,
                    style: const TextStyle(
                      // fontFamily: cairo,
                      // fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
