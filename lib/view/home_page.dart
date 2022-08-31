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
     // backgroundColor: Colors.grey[300],
     // drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Otp Service'),
        centerTitle: true,
        backgroundColor: theme.primaryColor.withOpacity(.8),
        leading: Builder(
          builder: (BuildContext appBarContext) {
            return IconButton(
                onPressed: () {
                  AppDrawer.of(appBarContext)!.toggle();
                },
                icon: Icon(Icons.menu));
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(width: double.infinity,
              
             // color: Colors.white38,
              child:Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0,left: 8,bottom: 8),
                    child: Text(
                      'Otp Request ',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theme.titleTextColor),
                    ),
                  ),
                MaterialButton(
              onPressed: () {
                dashboardController.scrollToMaxExtent();

                dashboardController.otpRequest();
                print("onClick");
              },
              child: Container(
                height: 25,
                width: 55,
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: theme.title2TextColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ), ],
              ),
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 0),
                  child: Container(
                    decoration: BoxDecoration(
                      
                      borderRadius:BorderRadius.circular(5),
                    color: Colors.grey[300]!.withOpacity(.3),),
                    child: Table(
                     // border: TableBorder.all(width: 1, color: Colors.black45),
                      children: [
                        TableRow(children: [
                          TableCell(
                              child: Padding(
                            padding: const EdgeInsets.only(top: 8),
                            child: Center(
                              child: Text(
                                "Request No.",
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: theme.primaryColor),
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
                                    color: theme.primaryColor),
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
                                      color: theme.primaryColor),
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
                                    fontSize: 13,
                                    fontWeight: FontWeight.bold,
                                    color: theme.primaryColor,
                                    ),
                              ),
                            ),
                          )),
                        ]),
                      ],
                    ),
                  ),
                ),
             Container(
                width: double.infinity,
                padding: EdgeInsets.all(0),
                decoration: nMboxInvert,
                
              ),  ],
            ),
            Expanded(child: OtprequestStatus()),
          
            SizedBox(
              height: 5,
            ),
            Container(width: double.infinity,
              child: Row(
                children: [                
                  Padding(
                     padding: const EdgeInsets.only(top: 8.0,left: 8,bottom: 8),
                    child: Text(
                      'Otp Sending ',
                      style: TextStyle(
                        fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: theme.primaryColor,
                          ),
                    ),
                  ),
                 MaterialButton(
              onPressed: () {
                dashboardController.scrollDown();

                dashboardController.otpSending();
                print("onClick");
              },
              child: Container(
                height: 25,
                width: 55,
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                decoration: BoxDecoration(
                  color: theme.title2TextColor,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            
          //  Container(height: 1,width: 200,color:theme.primaryColor,) 
            ],
              ),
            ),

          
           
            // Text(
            //   'Otp Sending Status',
            //   style: TextStyle(
            //       fontSize: 16,
            //       fontWeight: FontWeight.bold,
            //       color: theme.titleTextColor),
            // ),
           
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0,vertical: 0),
              child: Container(                decoration: BoxDecoration(
                  
                  borderRadius:BorderRadius.circular(5),
                color: Colors.grey[300]!.withOpacity(.3),),
                child: Table(
                //  border: TableBorder.all(width: 1, color: Colors.black45),
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
                                color: theme.primaryColor),
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
                                color: theme.primaryColor),
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
                                color: theme.primaryColor),
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
                                color: theme.primaryColor),
                          ),
                        ),
                      )),
                    ]),
                  ],
                ),
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
            //       color: theme.primaryColor,
            //       borderRadius: BorderRadius.circular(5),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
