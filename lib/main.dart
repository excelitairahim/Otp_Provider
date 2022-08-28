import 'package:flutter/material.dart';
import 'package:otp_provider/view/bottom_navigation_bar.dart';
import 'package:otp_provider/view/home_page.dart';
import 'package:otp_provider/view/provider/controller.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
     ChangeNotifierProvider<DashboardController>(create: (context) => DashboardController(),)
    ],
      child: MaterialApp(debugShowCheckedModeBanner: false,
        title: 'Otp Provider',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const Bottomnav(),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:otp_provider/view/drawer.dart';


// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     AppBar appBar = AppBar(
//       title: Text('Flutter'),
//       leading: Builder(
//         builder: (BuildContext appBarContext) {
//           return IconButton(
//               onPressed: () {
//                 AppDrawer.of(appBarContext)!.toggle();
//               },
//               icon: Icon(Icons.menu)
//           );
//         },
//       ),
//     );
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       home: AppDrawer(
//         child: Home(appBar: appBar),
//       ),
//     );
//   }
// }


class Home extends StatefulWidget {
  final AppBar? appBar;
  Home({key, this.appBar}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.appBar,
      body: Center(
        child: Text('ANIMATE EVERYTHING!!', style: TextStyle(fontSize: 50), textAlign: TextAlign.center,),
      ),
    );
  }}