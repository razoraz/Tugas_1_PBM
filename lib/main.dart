import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'login_page.dart';
import 'register_page.dart';
import 'page_home.dart';
import 'bmi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tani.Id',
      theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: LoginPage(),
      routes: {
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
        '/home': (context) => HomePage(),
        '/bmi': (context) => BmiPage(),
      },
    );
  }
}


// WIDGET TEXT
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Center(
//             child: Text("Application"),
//           ),
//         ),
//         body: const Center(
//           child: Text(
//             "aku saya kamu",
//             maxLines: 3,
//             overflow: TextOverflow.ellipsis,
//             textAlign: TextAlign.center,
//             style: TextStyle(
//               backgroundColor: Colors.amber,
//               color: Colors.black,
//               fontSize: 30,
//               fontFamily: 'Montserrat',
//               letterSpacing: 10,
//               decorationStyle: TextDecorationStyle.wavy,
//               decoration: TextDecoration.lineThrough,
//               decorationColor: Colors.white,
//               decorationThickness: 3,
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Center(
//             child: Text("Application"),
//           ),
//         ),
//         body: Row(
//           // column // static
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.end,
//           children: [
//             Container(
//               width: 50,
//               height: 200,
//               color: Colors.black,
//             ),
//             Container(
//               width: 100,
//               height: 200,
//               color: Colors.blue,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
/// list view
// class MyApp extends StatelessWidget {
//   final List<Color> myColor = [
//     Colors.red,
//     Colors.green,
//     Colors.blue,
//   ];
//   final List<Widget> myList = List.generate(
//     100,
//     (index) => Text(
//       index.toString(),
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Center(
//             child: Text("Application"),
//           ),
//         ),
//         body: ListView.separated(
//           // column // static
//           separatorBuilder: (context, index) {
//             return Divider(
//               color: Colors.black,
//             );
//           },
//           itemCount: myColor.length,
//           itemBuilder: (context, index) {
//             return Text("Halo");
//           },
//         ),
//       ),
//     );
//   }
// }
