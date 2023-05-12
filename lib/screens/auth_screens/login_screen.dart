import 'package:arriada_group01/screens/auth_screens/forgot_pass_screen.dart';
import 'package:arriada_group01/screens/auth_screens/register_screen.dart';
import 'package:arriada_group01/screens/main_screens/custom_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../widgets/static_widgets/main_button_widget.dart';
import '../../widgets/clickable_widgets/text_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future login() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
  }

  void toRegister() {
    Navigator.of(context).pushReplacementNamed("RegisterScreen");
  }

  @override
  Widget build(BuildContext context) {

    //Size size = MediaQuery.of(context).size;
    return Scaffold(
      //  backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
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
              height: 30,
            ),
            Form(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFieldWidget(
                  controller: emailController,
                  hintText: AppLocalizations.of(context)!.singinfore,
                  //  "91-xxx xx xx",
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return AppLocalizations.of(context)!.peavpn;
                    }
                    if (value.length != 9) {
                      return AppLocalizations.of(context)!.peavpn;
                    }
                    return null;
                  },
                ),
                TextFieldWidget(
                    controller: passwordController,
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return AppLocalizations.of(context)!.peyp;
                        // 'Please enter your password ';
                      }

                      if (value.length < 8) {
                        return AppLocalizations.of(context)!.pmbe;
                        // 'Password must be at least 8 characters';
                      }

                      return null;
                    },
                    hintText: "********"),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Row(
                    children: [
                      GestureDetector(
                        child: Text(
                          AppLocalizations.of(context)!.forget,
                        ),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ForgotPassScreen()));
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 120,
                ),
                GestureDetector(
                  onTap: login,
                  child: MainButton(
                      text: AppLocalizations.of(context)!.login,
                      txtColor: Colors.white,
                      withBorder: false,
                      onPressed: () {
                        auth
                            .signInWithEmailAndPassword(
                                email: emailController.text.trim(),
                                password: passwordController.text.trim())
                            .then((value) async {
                          Navigator.pushAndRemoveUntil(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => NavbarScreen(),
                              ),
                              (route) => false);
                        });
                        // if (_formKey.currentState!.validate()) {
                        //   // print('success');
                        // } else {
                        //   // print('Not');
                        // }
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: toRegister,
                  child: MainButton(
                    text: AppLocalizations.of(context)!.singineight,
                    txtColor: Colors.white,
                    withBorder: true,
                    onPressed: () {
                      Navigator.push(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const RegisterScreen()));
                    },
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
