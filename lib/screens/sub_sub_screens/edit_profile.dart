import 'package:arriada_group01/helpers/constants.dart';
import 'package:arriada_group01/screens/sub_screens/profile_screen.dart';
import 'package:arriada_group01/widgets/static_widgets/main_button_widget.dart';
import 'package:flutter/material.dart';

import '../main_screens/custom_nav_bar.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => NavbarScreen()));
                //  //navigate back to the cart screen
              },
              icon: Icon(
                Icons.arrow_back_ios_rounded,
              ),
            ),
            Expanded(
              child: Text(
                "Edit profile",
                style: TextStyle(fontSize: 24, color: mainColor),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Container(
          padding: EdgeInsets.only(left: 16, top: 25, right: 16),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              shrinkWrap: true,
              children: [
                // Text(
                //   "Edit Profile",
                //   style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                // ),
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor),
                            boxShadow: [
                              BoxShadow(
                                  spreadRadius: 2,
                                  blurRadius: 10,
                                  color: Colors.black.withOpacity(0.1),
                                  offset: Offset(0, 10))
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250",
                                ))),
                      ),
                      Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                width: 4,
                                color:
                                    Theme.of(context).scaffoldBackgroundColor,
                              ),
                              color: Colors.grey,
                            ),
                            child: Icon(
                              Icons.edit,
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                buildTextField("Full Name", " Aseel", false),
                buildTextField("E-mail", "aseel@gmail.com", false),
                buildTextField("Password", "********", true),
                buildTextField("Location", "Benghazi", false),
                SizedBox(
                  height: 5,
                ),
                MainButton(
                  text: "Save",
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => ProfileScreen()));
                  },
                  radius: 10,
                  widthFromScreen: 0.3,
                  btnColor: mainColor,
                  txtColor: Colors.white,
                  heightFromScreen: 0.06,
                ),
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
        ),
      ]),
    ));
  }

  Widget buildTextField(
      String labelText, String placeholder, bool isPasswordTextField) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        obscureText: isPasswordTextField ? showPassword : false,
        decoration: InputDecoration(
            suffixIcon: isPasswordTextField
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        showPassword = !showPassword;
                      });
                    },
                    icon: Icon(
                      Icons.remove_red_eye,
                      color: Colors.grey,
                    ),
                  )
                : null,
            contentPadding: EdgeInsets.only(bottom: 3),
            labelText: labelText,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}
