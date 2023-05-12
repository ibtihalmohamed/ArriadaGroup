import 'package:arriada_group01/screens/main_screens/custom_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/static_widgets/main_button_widget.dart';
import '../../widgets/clickable_widgets/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  final GlobalKey<FormState> registerForm = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmController = TextEditingController();
  bool showPassword = true;
  bool buttonEnabled = false;
  bool agreed = false;

  Future Register() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: phoneController.text.trim(),
        password: passwordController.text.trim());
  }

  void toLogin() {
    Navigator.of(context).pushReplacementNamed("LoginScreen");
  }

  @override
  Widget build(BuildContext context) {
    // final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width: 400,
                  height: 300,
                  child: Image.asset("assets/arriada.png"),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Form(
              child: Column(
                children: [
                  // ------- user name field

                  TextFieldWidget(
                    controller: nameController,
                    hintText: AppLocalizations.of(context)!.username,
                    //"enter your name",
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.enteruser;

                        // "Please enter your Name ";
                      }

                      return null;
                    },
                  ),

                  // ------- eamil field

                  TextFieldWidget(
                    controller: emailController,
                    hintText: AppLocalizations.of(context)!.singinfore,
                    validator: (String? value) {
                      //check why there's two !'s
                      if (!value!.contains("@") &&
                          !value.contains(".com") &&
                          value.isNotEmpty) {
                        return AppLocalizations.of(context)!.pvm;
                        //"Please a valid mail";
                      }

                      return null;
                    },
                  ),

                  // ------- phone number field

                  TextFieldWidget(
                    controller: phoneController,
                    hintText: AppLocalizations.of(context)!.phonehint,
                    //"91-XXXXXXX",
                    validator: (value) {
                      if (value!.isEmpty && value.length != 9) {
                        return AppLocalizations.of(context)!.peavpn;
                        //"please enter a valid phone number";
                      }

                      return null;
                    },
                  ),

                  // -------  password field

                  TextFieldWidget(
                    controller: passwordController,
                    hintText: "********",
                    validator: (value) {
                      if (value!.isEmpty && value.length < 8) {
                        return AppLocalizations.of(context)!.singinsix;
                        //"enter password";
                      }

                      return null;
                    },

                    // ------- confirm password field
                  ),
                  TextFieldWidget(
                    controller: confirmController,
                    hintText: "********",
                    validator: (value) {
                      if (value!.isEmpty && value.length < 8) {
                        return AppLocalizations.of(context)!.ecp;
                        //"enter correct password";
                      }

                      return null;
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            // ------- sign up button

            GestureDetector(
              onTap: Register,
              child: MainButton(
                  text: AppLocalizations.of(context)!.cacount,
                  txtColor: Colors.white,
                  // 'Create account',
                  withBorder: false,
                  onPressed: () {
                    auth
                        .createUserWithEmailAndPassword(
                            email: emailController.text.trim(),
                            password: passwordController.text.trim())
                        .then((value) async {
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const NavbarScreen(),
                          ),
                          (route) => false);
                    });

                    // try {
                    //   UserCredential userCredential = await FirebaseAuth
                    //       .instance
                    //       .createUserWithEmailAndPassword(
                    //           email: phoneController.text.trim(),
                    //           password: phoneController.text.trim());
                    // } on FirebaseAuthException catch (e) {
                    //   if (e.code == 'weak-password') {
                    //     print('The password provided is too weak.');
                    //   } else if (e.code == 'email-already-in-use') {
                    //     print('The account already exists for that email.');
                    //   }
                    // } catch (e) {
                    //   print(e);
                    // }
                    // if (registerForm.currentState!.validate()) {
                    //   // print('success');
                    // } else {
                    //   // print('Not');
                    // }
                  }),
            ),

            SizedBox(
              width: 0.5,
              height: 10,
            ),

            // ------- already have acc button

            GestureDetector(
              onTap: toLogin,
              child: MainButton(
                text: AppLocalizations.of(context)!.already,
                txtColor: Colors.white,
                //"Already have an account? Sign in Now",
                withBorder: true,
                onPressed: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => const LoginScreen()));
                },
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
