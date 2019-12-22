// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import '../widgets/homeView_widgets/pie_chart.dart';
// import '../widgets/homeView_widgets/calories_card.dart';
// import '../widgets/homeView_widgets/weight_indicator.dart';
// import 'package:intl/intl.dart';

// class HomeView extends StatelessWidget {
//   final String currentDate = DateFormat("dd/MM/yyyy").format(DateTime.now());

//   @override
//   Widget build(BuildContext context) {
//     double deviceHeight = MediaQuery.of(context).size.height;

//     return ListView(
//         physics: AlwaysScrollableScrollPhysics(),
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(top: 20.0),
//           ),
//           Card(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(40.0)),
//             color: Color(0xFFEDF0F6),
//             child: Column(
//               children: <Widget>[
//                 Padding(
//                   padding: const EdgeInsets.only(left: 30.0, top: 20.0),
//                   child: Align(
//                     alignment: Alignment.topLeft,
//                     child: Text(
//                       'Today\'s Calories',
//                       style: TextStyle(
//                           fontSize: 25.0,
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: SizedBox(
//                     width: MediaQuery.of(context).size.width,
//                     height: (deviceHeight * .40),
//                     child: PieChart(),
//                   ),
//                 ),
//                 HomeCard(),
//               ],
//             ),
//           ),
//         ],
//       );
   
//   }
// }
