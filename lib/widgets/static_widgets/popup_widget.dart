import 'package:arriada_group01/widgets/static_widgets/main_button_widget.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  final String title;
  final String message;

  CustomDialog({required this.title, required this.message});

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 450));
    scaleAnimation =
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack);
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        color: Colors.transparent,
        child: ScaleTransition(
          scale: scaleAnimation,
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(widget.message),
                SizedBox(height: 20),
                MainButton(text: "OK", onPressed: () => Navigator.pop(context),)
                // RaisedButton(
                //   onPressed: () => Navigator.pop(context),
                //   child:
                //       Text('OK', style: TextStyle(color: Colors.white)),
                //   color: Colors.blue,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}



// showDialog(
//   context: context,
//   builder: (BuildContext context) {
//     return CustomDialog(
//       title: 'Title',
//       message: 'Message',
//     );
//   },
// );