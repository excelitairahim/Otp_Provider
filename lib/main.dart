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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DashboardController>(
          create: (context) => DashboardController(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
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

class AutoScrollview extends StatefulWidget {
  const AutoScrollview({Key? key}) : super(key: key);

  @override
  State<AutoScrollview> createState() => _AutoScrollviewState();
}

//final ScrollController _controller = ScrollController();

// This is what you're looking for!
DashboardController? dashboardController;

// void _scrollDown() {
//   _controller.animateTo(
//     _controller.position.maxScrollExtent,
//     duration: Duration(microseconds: 300),
//     curve: Curves.easeOut,
//   );
// }

class _AutoScrollviewState extends State<AutoScrollview> {
  int itemcount = 1;
  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Provider.of<DashboardController>(
      context,
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          dashboardController.scrollToMaxExtent();
          // dashboardController.scrollDown();
          dashboardController.otpRequest();
        },
        child: Icon(Icons.arrow_downward),
      ),
      body: ListView.builder(
        controller: dashboardController.scrollController,
        shrinkWrap: true,
         //physics: NeverScrollableScrollPhysics(),
        itemCount: dashboardController.Otprequestlist.length,
        itemBuilder: (_, i) => ListTile(title: Text('Item $i')),
      ),
    );
  }
}

//  void scrollDown(){

//     final double end= scrollController.position.maxScrollExtent;
//  scrollController.animateTo(end,duration: Duration(microseconds: 300), curve: Curves.easeIn);
//   }

