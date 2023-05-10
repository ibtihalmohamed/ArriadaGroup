import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://images.pexels.com/photos/3307758/pexels-photo-3307758.jpeg?auto=compress&cs=tinysrgb&dpr=3&h=250")),
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              // child: TextButton(
              //   style: TextButton.styleFrom(
              //     foregroundColor: Colors.white,
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(50),
              //       side: const BorderSide(color: Colors.white),
              //     ),
              //     backgroundColor: const Color(0xFFF5F6F9),
              //   ),
              //   onPressed: () {},
              //   // child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              // ),
            ),
          )
        ],
      ),
    );
  }
}
