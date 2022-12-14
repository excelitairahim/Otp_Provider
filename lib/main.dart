import 'package:flutter/material.dart';
import 'package:otp_provider/view/bottom_navigation_bar.dart';
import 'package:otp_provider/view/dash_board.dart';
import 'package:otp_provider/view/drawer.dart';
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
        home: AppDrawer(child: Dashboard()),
      ),
    );
  }
}


class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
 return Scaffold(
        body: SafeArea(
          child: Container(
            color: Colors.grey[100],
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios,
                          color: Colors.black87, size: 15),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 105),
                      child: Text(
                        'Table',
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(color: Colors.grey[300], thickness: 1),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    columnSpacing: 35.0,
                    showBottomBorder: true,
                    headingRowHeight: 40,
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Browser',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Utility',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Kids',
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ),
                    ],
                    rows: const <DataRow>[
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Chrome')),
                          DataCell(Text('GPay')),
                          DataCell(Text('Vodafone')),
                          DataCell(Text('Alphabet Learning')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Firefox')),
                          DataCell(Text('PayTM')),
                          DataCell(Text('Airtel')),
                          DataCell(Text('NPTEL')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Tor')),
                          DataCell(Text('PayPal')),
                          DataCell(Text('Drive')),
                          DataCell(Text('Coursera')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Bravo')),
                          DataCell(Text('Oxigen')),
                          DataCell(Text('DishTv')),
                          DataCell(Text('EDX')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Opera')),
                          DataCell(Text('PhonePe')),
                          DataCell(Text('Drive')),
                          DataCell(Text('Swayam')),
                        ],
                      ),
                      DataRow(
                        cells: <DataCell>[
                          DataCell(Text('Microsoft Edge')),
                          DataCell(Text('SBI')),
                          DataCell(Text('Jio Fibre')),
                          DataCell(Text('YouTube Kids')),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? degOneTranslationAnimation,
      degTwoTranslationAnimation,
      degThreeTranslationAnimation;
  Animation? rotationAnimation;

  double getRadiansFromDegree(double degree) {
    double unitRadian = 57.295779513;
    return degree / unitRadian;
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  void initState() {
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    degOneTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.2), weight: 75.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.2, end: 1.0), weight: 25.0),
    ]).animate(animationController!);
    degTwoTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.4), weight: 55.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.4, end: 1.0), weight: 45.0),
    ]).animate(animationController!);
    degThreeTranslationAnimation = TweenSequence([
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 0.0, end: 1.75), weight: 35.0),
      TweenSequenceItem<double>(
          tween: Tween<double>(begin: 1.75, end: 1.0), weight: 65.0),
    ]).animate(animationController!);
    rotationAnimation = Tween<double>(begin: 180.0, end: 0.0).animate(
        CurvedAnimation(parent: animationController!, curve: Curves.easeOut));
    super.initState();
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      body: Stack(
          children: <Widget>[
            Positioned(
                right: 30,
                bottom: 30,
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    IgnorePointer(
                      child: Container(
                        color: Colors.transparent,
                        height: 150.0,
                        width: 150.0,
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(getRadiansFromDegree(270),
                          degOneTranslationAnimation!.value * 100),
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation!.value))
                          ..scale(degOneTranslationAnimation!.value),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          width: 50,
                          height: 50,
                          child: IconButton(
                            color: Colors.blue,
                            // width: 50,
                            // height: 50,
                            icon: Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              print('First Button');
                            },
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(getRadiansFromDegree(225),
                          degTwoTranslationAnimation!.value * 100),
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation!.value))
                          ..scale(degTwoTranslationAnimation!.value),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          width: 50,
                          height: 50,
                          child: IconButton(
                            color: Colors.black,
                            // width: 50,
                            // height: 50,
                            icon: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              print('Second button');
                            },
                          ),
                        ),
                      ),
                    ),
                    Transform.translate(
                      offset: Offset.fromDirection(getRadiansFromDegree(180),
                          degThreeTranslationAnimation!.value * 100),
                      child: Transform(
                        transform: Matrix4.rotationZ(
                            getRadiansFromDegree(rotationAnimation!.value))
                          ..scale(degThreeTranslationAnimation!.value),
                        alignment: Alignment.center,
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.red, shape: BoxShape.circle),
                          width: 50,
                          height: 50,
                          child: IconButton(
                            color: Colors.orangeAccent,
                            // width: 50,
                            // height: 50,
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              print('Third Button');
                            },
                          ),
                        ),
                      ),
                    ),
                    Transform(
                      transform: Matrix4.rotationZ(
                          getRadiansFromDegree(rotationAnimation!.value)),
                      alignment: Alignment.center,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.red, shape: BoxShape.circle),
                        width: 60,
                        height: 60,
                        child: IconButton(
                          color: Colors.red,
                          // width: 60,
                          // height: 60,
                          icon: Icon(
                            Icons.menu,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            if (animationController!.isCompleted) {
                              animationController!.reverse();
                            } else {
                              animationController!.forward();
                            }
                          },
                        ),
                      ),
                    )
                  ],
                ))
          ],
        
      ),
    );
  }
}


// class CircularButtons extends StatelessWidget {

//   final double? width;
//   final double? height;
//   final Color? color;
//   final Icon ?icon;
//    Function? onClick;

//   CircularButton({this.color, this.width, this.height, this.icon, this.onClick});


//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(color: color,shape: BoxShape.circle),
//       width: width,
//       height: height,
//       child: Container()
//     );
//   }
// }

