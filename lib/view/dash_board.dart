import 'package:flutter/material.dart';
import 'package:otp_provider/theme/theme.dart';

import 'drawer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List title_list = [
    'All Otp Status',
    'Otp Request',
    'Otp Sending',
    'Balance Check',
    'Buy Sms',
    'Remaining Sms'
  ];
  List icon_list = [
    'asset/check-list.png',
    'asset/comments.png',
    'asset/send.png',
    'asset/mobile-banking.png',
    'asset/mobile-banking.png',
    'asset/mobile-banking.png',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Dashboard',
          ),
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
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10),
              child: Text(
                "Welcome, Otp Service",
                style: TextStyle(
                    //   color: Colors.white,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 3),
              child: Text(
                "Select A Menu",
                style: TextStyle(
                  //   color: Colors.white,
                  fontSize: 15.0,
                  // fontWeight: FontWeight.bold
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 13),
              child: Text(
                "main Menu",
                style: TextStyle(
                    //   color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: title_list.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Expanded(child: Image.asset(icon_list[index])),
                          Expanded(
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  //color: Colors.amber,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Text(title_list[index].toString()),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ));
  }
}
