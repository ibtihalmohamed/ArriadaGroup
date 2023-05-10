import 'package:flutter/material.dart';

import 'size_configuration.dart';

const animationDuration = Duration(milliseconds: 150);

// ----------------------------------- MAIN COLORS ----------------------------------------

// const Color mainColor = Color.fromARGB(255, 65, 13, 43);
const Color mainColor = Color(0xff8E0150);
const Color creamyColor = Color.fromARGB(255, 242, 197, 234);

// ----------------------------------- GRAYS ----------------------------------------
const Color lightWihteColor = Color(0xffffffff);
const Color lightGreyColor = Color(0xffECEDF2);
const Color middleGreyColor = Color(0xff6D6D6D);
const Color darkGreyColor = Color(0xff191A1D);
const Color selectedFilterColor = Color(0xff393F42);

// ----------------------------------- STATUS COLORS ----------------------------------------

const Color warningColor = Color(0xFFec4e2c);
const Color successColor = Color(0xFF2ecc71);

// ----------------------------------- auth constatnts ----------------------------------------
const kAnimationDuration = Duration(milliseconds: 200);
const kTextColor = Color(0xFF757575);

final headingStyle = TextStyle(
  fontSize: getProportionateScreenWidth(28),
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

// Form Error
final RegExp emailValidatorRegExp =
    RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
const String kEmailNullError = "Please Enter your email";
const String kInvalidEmailError = "Please Enter Valid Email";
const String kPassNullError = "Please Enter your password";
const String kShortPassError = "Password is too short";
const String kMatchPassError = "Passwords don't match";
const String kNamelNullError = "Please Enter your name";
const String kPhoneNumberNullError = "Please Enter your phone number";
const String kAddressNullError = "Please Enter your address";

final otpInputDecoration = InputDecoration(
  contentPadding:
      EdgeInsets.symmetric(vertical: getProportionateScreenWidth(15)),
  border: outlineInputBorder(),
  focusedBorder: outlineInputBorder(),
  enabledBorder: outlineInputBorder(),
);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(getProportionateScreenWidth(15)),
    borderSide: const BorderSide(color: kTextColor),
  );
}

// ----------------------------------- Api ----------------------------------------
String baseUrl = "https://api.escuelajs.co"; //products


