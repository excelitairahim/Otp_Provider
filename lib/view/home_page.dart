import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:otp_provider/main.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/view/drawer.dart';
import 'package:otp_provider/view/neumorphism_design/neumorphism_container.dart';
import 'package:otp_provider/view/otp_request.dart';
import 'package:otp_provider/view/otp_send.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:otp_provider/view/provider/controller.dart';
import 'package:provider/provider.dart';

import 'neumorphism_design/nUButton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController =
        Provider.of<DashboardController>(context);
    return Scaffold(
        backgroundColor: Colors.grey[300],
        // drawer: AppDrawer(),
        // appBar: AppBar(
        //   title: Text('Dashboard'),
        //   centerTitle: true,
        //   backgroundColor: theme.primaryColor.withOpacity(.8),
        //   leading: Builder(
        //     builder: (BuildContext appBarContext) {
        //       return IconButton(
        //           onPressed: () {
        //             AppDrawer.of(appBarContext)!.toggle();
        //           },
        //           icon: Icon(Icons.menu));
        //     },
        //   ),
        // ),
        body: SafeArea(
          child: Stack(children: [

          Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(0.0),
                          child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius:
                                    BorderRadius.all(Radius.circular(0.0)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade600,
                                    offset: Offset(1.0, 1.0),
                                    blurRadius: 5.0,
                                    spreadRadius: 0.5,
                                  ),
                                  BoxShadow(
                                    color: Colors.white,
                                    offset: Offset(-1.0, -1.0),
                                    blurRadius: 5.0,
                                    spreadRadius: 0.2,
                                  ),
                                ],
                                gradient: LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    Colors.grey.shade500,
                                    Colors.grey.shade300,
                                    Colors.grey.shade200,
                                    Colors.grey.shade100,
                                    Colors.grey.shade300,
                                    Colors.grey.shade500
                                  ],
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(0.0),
                                child: Row(
                                  children: [
                                    Builder(
                                      builder: (BuildContext appBarContext) {
                                        return IconButton(
                                            onPressed: () {
                                              AppDrawer.of(appBarContext)!
                                                  .toggle();
                                            },
                                            icon: Icon(Icons.menu));
                                      },
                                    ),
                                    Container(
                                      width: 300,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            child: Text(
                                              'Dashboard',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                 color: theme.primaryColor,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )
          
                              // TextField(
                              //   decoration: InputDecoration(
                              //     contentPadding: EdgeInsets.only(left: 20),
                              //     hintText: 'Dashboard',
                              //     border: OutlineInputBorder(
                              //       borderSide: BorderSide.none,
                              //       // borderRadius:
                              //       //     BorderRadius.all(Radius.circular(5.0)),
                              //     ),
                              //     prefixIcon: Icon(Icons.search),
                              //     suffixIcon: Icon(Icons.mic),
                              //   ),
                              // ),
                              ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          decoration: nMboxInvert,
                          child: Text(
                            'Otp Request Status',
                            style: TextStyle(fontWeight: FontWeight.w700,color: theme.titleTextColor),
                          ),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Text(
                        //     'Otp Request Status',
                        //     style: TextStyle(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.bold,
                        //         color: theme.titleTextColor),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Table(
                            border:
                                TableBorder.all(width: 1, color: Colors.black45),
                            children: [
                              TableRow(children: [
                                TableCell(
                                    child: Padding(
                                     padding: const EdgeInsets.only(top: 8),
                                  child: Center(
                                    child: Text(
                                      " Request No.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: theme.title2TextColor),
                                    ),
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Member ID",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: theme.title2TextColor),
                                    ),
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Center(
                                    child: Container(
                                      child: Text(
                                        " Status",
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: theme.title2TextColor),
                                      ),
                                    ),
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Center(
                                    child: Text(
                                      "Request Time",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: theme.title2TextColor),
                                    ),
                                  ),
                                )),
                              ]),
                            ],
                          ),
                        ),
                        Expanded(child: OtprequestStatus()),
                        // MaterialButton(
                        //   onPressed: () {
                        //     dashboardController.scrollToMaxExtent();
          
                        //     dashboardController.otpRequest();
                        //     print("onClick");
                        //   },
                        //   child: Container(
                        //     height: 30,
                        //     width: 55,
                        //     child: Center(
                        //       child: Text(
                        //         'Add',
                        //         style: TextStyle(
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white),
                        //       ),
                        //     ),
                        //     decoration: BoxDecoration(
                        //       color: theme.title2TextColor,
                        //       borderRadius: BorderRadius.circular(5),
                        //     ),
                        //   ),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
          
                        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                             GestureDetector(
                                onTap: () {
                                  // dashboardController. scrollToMaxExtent();
                                  dashboardController.scrollToMaxExtent();
          
                             dashboardController.otpRequest();
                                  print("onClick");
                                },
                                child: NMButton(
                                  text: 'Add Request',
                                  height: 30,
                                  width: 95,
                                )),

                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: nMboxInvert,
                              child: Text(
                                'Otp Sending Status',
                                style: TextStyle(fontWeight: FontWeight.w700,color: theme.titleTextColor),
                              ),
                            ),
                             GestureDetector(
                                onTap: () {
                                  // dashboardController. scrollToMaxExtent();
                                  dashboardController.scrollDown();
                                  dashboardController.otpSending();
                                  print("onClick");
                                },
                                child: NMButton(
                                  text: ' Add Send',
                                  height: 30,
                                  width: 95,
                                )), ],
                        ),
                        // Text(
                        //   'Otp Sending Status',
                        //   style: TextStyle(
                        //       fontSize: 16,
                        //       fontWeight: FontWeight.bold,
                        //       color: theme.titleTextColor),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 2.0),
                          child: Table(
                            border:
                                TableBorder.all(width: 1, color: Colors.black45),
                            children: [
                              TableRow(children: [
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Center(
                                    child: Text(
                                      " Sending No.",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: theme.title2TextColor),
                                    ),
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: Text(
                                      "Member ID",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: theme.title2TextColor),
                                    ),
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                  padding: const EdgeInsets.only(top: 8),
                                  child: Center(
                                    child: Text(
                                      "  Status",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: theme.title2TextColor),
                                    ),
                                  ),
                                )),
                                TableCell(
                                    child: Padding(
                                    padding: const EdgeInsets.only(top: 8),
                                  child: Center(
                                    child: Text(
                                      "Sending Time",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: theme.title2TextColor),
                                    ),
                                  ),
                                )),
                              ]),
                            ],
                          ),
                        ),
                        Expanded(child: OtpSendstatus()),
                        // Row(
                        //   children: [
                        //     GestureDetector(
                        //         onTap: () {
                        //           // dashboardController. scrollToMaxExtent();
                        //           dashboardController.scrollDown();
                        //           dashboardController.otpSending();
                        //           print("onClick");
                        //         },
                        //         child: NMButton(
                        //           text: 'add',
                        //           height: 30,
                        //           width: 55,
                        //         )),
                        //   ],
                        // ),
                        // MaterialButton(
                        //   onPressed: () {
                        //     // dashboardController. scrollToMaxExtent();
                        //     dashboardController.scrollDown();
                        //     dashboardController.otpSending();
                        //     print("onClick");
                        //   },
                        //   child: Container(
                        //     height: 30,
                        //     width: 55,
                        //     child: Center(
                        //       child: Text(
                        //         'Add',
                        //         style: TextStyle(
                        //             fontSize: 14,
                        //             fontWeight: FontWeight.bold,
                        //             color: Colors.white),
                        //       ),
                        //     ),
                        //     decoration: BoxDecoration(
                        //       color: theme.title2TextColor,
                        //       borderRadius: BorderRadius.circular(5),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ]),
        ]  ),
        ));
  }
}
