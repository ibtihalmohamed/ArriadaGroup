

// class CartBody extends StatefulWidget {
//   @override
//   _CartBodyState createState() => _CartBodyState();
// }

// class _CartBodyState extends State<CartBody> {
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.symmetric(horizontal: (20)),
//       child: ListView.builder(
//         itemCount: demoCarts.length,
//         itemBuilder: (context, index) => Padding(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           child: Dismissible(
//             key: Key(demoCarts[index].product.uid.toString()),
//             // direction: DismissDirection.endToStart,
//             onDismissed: (direction) {
//               setState(() {
//                 demoCarts.removeAt(index);
//               });
//             },
//             background: Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               decoration: BoxDecoration(
//                 color: Color(0xFFFFE6E6),
//                 borderRadius: BorderRadius.circular(15),
//               ),
//               child: Row(
//                 children: [
//                   Spacer(),
//                   SvgPicture.asset("assets/icons/Trash.svg"),
//                 ],
//               ),
//             ),
//             // child: CartCard(
//             //   // cart: demoCarts[index]
//             //   ),
//           ),
//         ),
//       ),
//     );
//   }
// }
