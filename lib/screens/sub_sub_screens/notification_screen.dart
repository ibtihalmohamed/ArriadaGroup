import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/dark_theme_provider.dart';
import '../../widgets/notification_widgets/offer_notification_widget.dart';
import '../../widgets/notification_widgets/order_notification_widget.dart';

class NotificationScreen extends StatefulWidget {
  NotificationScreen({Key? key}) : super(key: key);

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List newItem = ["liked", "follow"];

  List todayItem = ["follow", "liked", "liked"];

  List oldesItem = ["follow", "follow", "liked", "liked"];

  @override
  Widget build(BuildContext context) {
    final themeListener = Provider.of<DarkThemeProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("New",
                    style: TextStyle(
                        fontSize: 24,
                        color:
                            themeListener.isDark ? Colors.white : Colors.black)
                    // Theme.of(context).textTheme.displayLarge,
                    ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: newItem.length,
                  itemBuilder: (context, index) {
                    return newItem[index] == "follow"
                        ? CustomOrderNotifcation()
                        : CustomOfferNotifcation();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("Today",
                      style: TextStyle(
                          fontSize: 24,
                          color: themeListener.isDark
                              ? Colors.white
                              : Colors.black)
                      // Theme.of(context).textTheme.displayLarge,
                      ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: todayItem.length,
                  itemBuilder: (context, index) {
                    return todayItem[index] == "follow"
                        ? CustomOrderNotifcation()
                        : CustomOfferNotifcation();
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text("Oldest",
                      style: TextStyle(
                          fontSize: 24,
                          color: themeListener.isDark
                              ? Colors.white
                              : Colors.black)
                      // Theme.of(context).textTheme.displayLarge,
                      ),
                ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: oldesItem.length,
                  itemBuilder: (context, index) {
                    return oldesItem[index] == "follow"
                        ? CustomOrderNotifcation()
                        : CustomOfferNotifcation();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class NotificationScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Notifications'),
//       ),
//       body: ListView.builder(
//         itemCount: 5,
//         itemBuilder: (BuildContext context, int index) {
//           return ListTile(
//             leading: CircleAvatar(
//               child: Icon(Icons.notifications),
//             ),
//             title: Text('Notification Title'),
//             subtitle: Text('Notification Description'),
//             trailing: Text('2h ago'),
//           );
//         },
//       ),
//     );
//   }
// }




