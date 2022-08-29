import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/view/drawer.dart';
import 'package:otp_provider/view/otp_request.dart';
import 'package:otp_provider/view/otp_send.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:otp_provider/view/provider/controller.dart';
import 'package:provider/provider.dart';

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
      // drawer: AppDrawer(),
      appBar: AppBar(
        title: Text('Dashboard'),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Otp Request Status',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.titleTextColor),
            ),
            SizedBox(
              height: 10,
            ),
                          Table(
                border: TableBorder.all(width: 1, color: Colors.black45),
                children: [
                  TableRow(children: [
                     TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                      child: Text(
                          " Request No.",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                      ),
                    ),
                        )),
                    TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                      child: Text(
                          "Member ID",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                      ),
                    ),
                        )),
                    TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                      child: Container(
                        child: Text(
                            "Request Status",
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                        ),
                      ),
                    ),
                        )),
                    TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                      child: Text(
                          "Request Time",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                      ),
                    ),
                        )),
                  ]),
                ],
              ),
            Expanded(child: OtprequestStatus()
            ),
            MaterialButton(
              onPressed: () {
               dashboardController. scrollToMaxExtent();
       
                dashboardController.otpRequest();
                print("onClick");
              },
              child: Container(
                height: 30,
                width: 55,
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 14,
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
            // SizedBox(
            //   height: 10,
            // ),
            Text(
              'Otp Sending Status',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: theme.titleTextColor),
            ),
            SizedBox(
              height: 10,
            ),
                      Table(
            border: TableBorder.all(width: 1, color: Colors.black45),
            children: [
              TableRow(children: [    TableCell(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                      child: Text(
                          " Sending No.",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                      ),
                    ),
                        )),
                TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                  child: Text(
                      "Member ID",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                  ),
                ),
                    )),
                TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                  child: Text(
                      " Request Status",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                  ),
                ),
                    )),
                TableCell(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                  child: Text(
                      "Sending Time",
                      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                  ),
                ),
                    )),
              ]),
            ],
          ),
            Expanded(child: OtpSendstatus()),
            MaterialButton(
              onPressed: () { 
              // dashboardController. scrollToMaxExtent();
                dashboardController.scrollDown();
                dashboardController.otpSending();
                print("onClick");
              },
              child: Container(
                height: 30,
                width: 55,
                child: Center(
                  child: Text(
                    'Add',
                    style: TextStyle(
                        fontSize: 14,
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
          ],
        ),
      ),
    );
  }
}
