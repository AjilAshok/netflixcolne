// import 'package:flutter/material.dart';
// import 'package:netfix/pages/home.dart';

// class Appbar extends StatefulWidget {
//   const Appbar({Key? key}) : super(key: key);

//   @override
//   State<Appbar> createState() => _AppbarState();
// }

// class _AppbarState extends State<Appbar> {
//   @override
//   Widget build(BuildContext context) {
//     return

//         // ListView.builder(itemBuilder: (_, index) {
//         //   return SizedBox(
//         //     height: MediaQuery.of(context).size.height,
//         //     child: NestedScrollView(headerSliverBuilder:(context, innerBoxIsScrolled) {
//         //       return <Widget>[  SliverAppBar(
//         //              backgroundColor: Colors.transparent,
//         //               flexibleSpace: FlexibleSpaceBar(
//         //                 centerTitle: true,
//         //                 background: AppBar(
//         //                   backgroundColor: Colors.transparent,
//         //                   leading: CircleAvatar(
//         //                     backgroundColor: Colors.transparent,
//         //                     child: Image.asset(
//         //                       'asstes/images/netflix_PNG15.png',
//         //                       width: 30,
//         //                       height: 30,
//         //                     ),
//         //                   ),
//         //                   actions: [
//         //                     const Icon(
//         //                       Icons.search,
//         //                       size: 30,
//         //                     ),
//         //                     const SizedBox(
//         //                       width: 20,
//         //                     ),
//         //                     Padding(
//         //                       padding: const EdgeInsets.all(8.0),
//         //                       child: Image.asset(
//         //                         'asstes/images/avatar.png',
//         //                         height: 10,
//         //                         fit: BoxFit.cover,
//         //                       ),
//         //                     ),
//         //                   ],
//         //                 ),
//         //               ),

//         //       )];

//         //     },
//         //     body: ,
//         //    ),
//         //   );

//         // },
//         // itemCount: 1,

//         // );

//         //
//         Container(
//       padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//       color: Colors.transparent,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           Image.asset("assets/netflix_PNG15.png"),
//           SizedBox(
//             width: 5,
//           ),
//           Row(
//             children: [
//               GestureDetector(
//                 onTap: () {},
//                 child: Text(
//                   "Tv Shows",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//               const SizedBox(
//                 width: 10,
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Text(
//                   "Movies",
//                   style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 15,
//                       fontWeight: FontWeight.w500),
//                 ),
//               ),
//               SizedBox(
//                 width: 10,
//               ),
//               GestureDetector(
//                 onTap: () {},
//                 child: Row(
//                   children: [
//                     Text(
//                       "Categories",
//                       style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 15,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     Icon(
//                       Icons.arrow_drop_down_sharp,
//                       color: Colors.white,
//                     )
//                   ],
//                 ),
//               )
//             ],
//           )
//         ],
//       ),
//     );
//   }
// }
