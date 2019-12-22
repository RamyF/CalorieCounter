// import 'package:flutter/material.dart';

// class HomeCard extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _HomeCardState();
//   }
// }

// class _HomeCardState extends State<HomeCard> {
//   final double pi = 3.1416;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 124.0,
//       child: Padding(
//         padding: const EdgeInsets.only(top: 30.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: <Widget>[
//             Column(
//               children: <Widget>[
//                 Text(
//                   "2400",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "GOAL",
//                   style: TextStyle(color: Colors.black),
//                 )
//               ],
//             ),
//             Column(
//               children: <Widget>[
//                 Icon(
//                   Icons.remove,
//                   size: 30,
//                   color: Colors.black,
//                 ),
//               ],
//             ),
//             Column(
//               children: <Widget>[
//                 Text(
//                   "2100",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "Consumed",
//                   style: TextStyle(color: Colors.black),
//                 )
//               ],
//             ),
//             Column(
//               children: <Widget>[
//                 Transform.rotate(
//                   angle: (pi / 2),
//                   child: Icon(
//                     Icons.pause,
//                     color: Colors.black,
//                   ),
//                 ),
//               ],
//             ),
//             Column(
//               children: <Widget>[
//                 Text(
//                   "300",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 30,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 SizedBox(
//                   height: 10,
//                 ),
//                 Text(
//                   "REMAINING",
//                   style: TextStyle(color: Colors.black),
//                 )
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
