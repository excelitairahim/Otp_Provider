// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:otp_provider/theme/theme.dart';
// import 'package:provider/provider.dart';
// import '../../main.dart';

// class NavigationDrawer extends StatefulWidget {
//   const NavigationDrawer({Key? key}) : super(key: key);

//   @override
//   State<NavigationDrawer> createState() => _NavigationDrawerState();
// }

// class _NavigationDrawerState extends State<NavigationDrawer> {

//   bool switchValue = true;
//   @override
//   Widget build(BuildContext context) {
//    // final drawerProvider=Provider.of<DrawerProvider>(context,listen: false);
//     return SizedBox(
//       width: MediaQuery.of(context).size.width * .7,
//       child: Drawer(
//         child: Scaffold(

//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.stretch,
//             children: [SizedBox(height: 40,),
//               Expanded(flex: 2, child: _buildHeader(context)),
//               Expanded(flex: 1, child: _buildFooter(context)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//   Widget _buildFooter(BuildContext context){
//     return Container(
//     //height: 200,
//     width: double.infinity,
//     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//     //color: Colors.orangeAccent,
//     child: Column(
//       mainAxisAlignment: MainAxisAlignment.end,
//       children: [
//         ListTile(
//           leading: Icon(
//             Icons.settings,
//            // color: theme.titleTextColor,
//           ),
//           title: Text("Setting"),
//           // onTap: () {
//           //   Navigator.of(context).push(
//           //       MaterialPageRoute(builder: (context) => SettingScreen()));
//           //   //SettingScreen
//           // },
//         ),
//         (

//         ListTile(
//           leading: Icon(
//             Icons.logout,
//             color: theme.titleTextColor,
//           ),
//           title: Text("Log Out"),
//           onTap: () {
//             showDialog(
//               context: context,
//               builder: (BuildContext context) {
//                 return AlertDialog(
//                   actionsAlignment: MainAxisAlignment.spaceBetween,
//                   title: Center(child: SizedBox(height: 100,width: 100,child: Image.asset("assets/logout.png"))),
//                   content: Text("Are you sure you want to Log Out"),
//                   actions: [
//                     TextButton(
//                       child: Text("No"),
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                     ),
//                     TextButton(
//                       child: Text("Yes",style: TextStyle(color: Colors.red),),
//                       onPressed: () async{

//                         // Navigator.pushAndRemoveUntil(
//                         //     context,
//                         //     MaterialPageRoute(builder: (context) => LogInScreen()),
//                         //         (route) => false);
//                       },
//                     ),
//                   ],
//                 );
//               },
//             );
//             //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Payment_Method()));
//           },
//         )),
//       ],
//     ),
//   );
//   }
// }

//   Widget _buildHeader(BuildContext context) => Padding(
//     padding: const EdgeInsets.symmetric(horizontal: 10),
//     child: Column(
//       children: [
//         ListTile(
//           leading: Icon(
//             Icons.payment,
//             color: theme.titleTextColor,
//           ),
//           title: Text("Payment Method"),
//           onTap: () {
//             // Navigator.of(context).push(
//             //     MaterialPageRoute(builder: (context) => Payment_Method()));
//           },
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.receipt_long_outlined,
//             color: theme.titleTextColor,
//           ),
//           title: Text("Receipt List"),
//           onTap: () {
//          //   Navigator.push(context, MaterialPageRoute(builder: ((context) =>  ReceiptListOfAMemberScreen())));
//            // Navigator.of(context).push(MaterialPageRoute(
//                // builder: (context) => ReceiptListOfAMemberScreen()));
//           },
//         ),
//         ListTile(
//           leading: Icon(
//             Icons.file_open_rounded,
//             color: theme.titleTextColor,
//           ),
//           title: Text("File List"),
//           onTap: () {
//           //   Navigator.of(context).push(MaterialPageRoute(
//           //       builder: (context) => FileList()));
//           // },
//        // ),
//         ListTile(
//           leading: Icon(
//             Icons.payments,
//             color: theme.titleTextColor,
//           ),
//           title: Text("Payment Status"),
//           // onTap: () {
//           //   Navigator.of(context)
//           //       .push(MaterialPageRoute(builder: (context) => Details()));
//           // },
//         );
//         ListTile(
//           leading: Icon(
//             Icons.notifications,
//             color: theme.titleTextColor,
//           ),
//           title: Text("Notification"),
//           onTap: () {},
//         );
//         ListTile(
//           leading: Icon(
//             Icons.info_outline,
//             color: theme.titleTextColor,
//           ),
//           title: Text("Device info"),

//         );
//      }) ],
//     ),
//   );

import 'package:flutter/material.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/view/neumorphism_design/neumorphism_container.dart';

class AppDrawer extends StatefulWidget {
  final Widget? child;
  AppDrawer({key, this.child}) : super(key: key);

  static _AppDrawerState? of(BuildContext context) =>
      context.findAncestorStateOfType<_AppDrawerState>();

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  static Duration duration = Duration(milliseconds: 300);
  late AnimationController _controller;
  static const double maxSlide = 255;
  static const dragRightStartVal = 60;
  static const dragLeftStartVal = maxSlide - 20;
  static bool shouldDrag = false;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: _AppDrawerState.duration);
    super.initState();
  }

  void close() => _controller.reverse();

  void open() => _controller.forward();

  void toggle() {
    if (_controller.isCompleted) {
      close();
    } else {
      open();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDragStart(DragStartDetails startDetails) {
    bool isDraggingFromLeft = _controller.isDismissed &&
        startDetails.globalPosition.dx < dragRightStartVal;
    bool isDraggingFromRight = _controller.isCompleted &&
        startDetails.globalPosition.dx > dragLeftStartVal;
    shouldDrag = isDraggingFromLeft || isDraggingFromRight;
  }

  void _onDragUpdate(DragUpdateDetails updateDetails) {
    if (shouldDrag == false) {
      return;
    }
    double delta = updateDetails.primaryDelta! / maxSlide;
    _controller.value += delta;
  }

  void _onDragEnd(DragEndDetails dragEndDetails) {
    if (_controller.isDismissed || _controller.isCompleted) {
      return;
    }

    double _kMinFlingVelocity = 365.0;
    double dragVelocity = dragEndDetails.velocity.pixelsPerSecond.dx.abs();

    if (dragVelocity >= _kMinFlingVelocity) {
      double visualVelocityInPx = dragEndDetails.velocity.pixelsPerSecond.dx /
          MediaQuery.of(context).size.width;
      _controller.fling(velocity: visualVelocityInPx);
    } else if (_controller.value < 0.5) {
      close();
    } else {
      open();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: _onDragStart,
      onHorizontalDragUpdate: _onDragUpdate,
      onHorizontalDragEnd: _onDragEnd,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (BuildContext context, _) {
          double animationVal = _controller.value;
          double translateVal = animationVal * maxSlide;
          double scaleVal = 1 - (animationVal * 0.3);
          return Stack(
            children: <Widget>[
              CustomDrawer(),
              Transform(
                alignment: Alignment.centerLeft,
                transform: Matrix4.identity()
                  ..translate(translateVal)
                  ..scale(scaleVal),
                child: GestureDetector(
                    onTap: () {
                      if (_controller.isCompleted) {
                        close();
                      }
                    },
                    child: widget.child),
              ),
            ],
          );
        },
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: theme.primaryColor,
      child: Theme(
        data: ThemeData(
          brightness: Brightness.dark,
        ),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                color: theme.primaryColor,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Otp Provider Service',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.w600)),
                ),
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Dashboard'),
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Setting'),
              ),
              ListTile(
                leading: Icon(Icons.lock),
                title: Text('Logout'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
