import 'package:flutter/material.dart';

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key? key,
    required this.text,
    required this.image,
  }) : super(key: key);
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
      elevation: 20,
      shadowColor: Colors.black26,
      child: Container(
          height: 60,
          width: double.infinity,
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              Text(text, style: TextStyle(fontSize: 14)),
              SizedBox(
                width: 170,
              ),
              Image.asset(image),
            ],
          )),
    );
  }
}
