import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/view/home_page.dart';
import 'package:otp_provider/view/neumorphism_design/nUButton.dart';
import 'package:otp_provider/view/otp_request.dart';
import 'package:otp_provider/view/otp_send.dart';
import 'package:otp_provider/view/provider/controller.dart';

import 'drawer.dart';
import 'package:provider/provider.dart';

import 'neumorphism_design/neumorphism_container.dart';
import 'package:animations/animations.dart';
import 'package:velocity_x/velocity_x.dart';
class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List<Page> pageList = [
    Page(
      title: "All Otp Satus",
      icon: 'asset/check-list.png',
      page: AppDrawer(child: AppOtpPage()),
    ),
    Page(
      title: "Otp Request",
      icon: 'asset/comments.png',
      page: AppDrawer(child: AppOtpPage()),
    ),
    Page(
      title: "Otp Sending",
      icon: 'asset/send.png',
      page: AppDrawer(child: AppOtpPage()),
    ),
    Page(
      title: "Balance Check",
      icon: 'asset/mobile-banking.png',
      page: AppDrawer(child: AppOtpPage()),
    ),
    Page(
      title: "Buy Sms",
      icon: 'asset/buy.png',
      page: AppDrawer(child: AppOtpPage()),
    ),
    Page(
      title: "Remaining Sms",
      icon: 'asset/countdown.png',
      page: AppDrawer(child: AppOtpPage()),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    //List<Page> pageList=[Page(title: "All Otp Satus",icon: 'asset/check-list.png',page: AllOtpStatus(context))];
    return Scaffold(
      backgroundColor: theme.primaryColor,
      body: Stack(
        children: <Widget>[dashBg, content],
      ),
    );
  }

  get dashBg => Column(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: theme.primaryColor,
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(30),
                //   bottomRight: Radius.circular(30),
                // ),
              ),
            ),
            flex: 2,
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
            flex: 5,
          ),
        ],
      );

  get content => Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: <Widget>[
            header,
            grid,
          ],
        ),
      );

  get header => Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.only(left: 00, right: 0, top: 20),
            leading: Builder(
              builder: (BuildContext appBarContext) {
                return IconButton(
                    onPressed: () {
                      AppDrawer.of(appBarContext)!.toggle();
                    },
                    icon: Icon(
                      Icons.menu,
                      color: Colors.white,
                    ));
              },
            ),
            title: Center(
              child: Text(
                'Dashboard',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Center(
              child: Text(
                'Welcome To Our Otp Service',
                style: TextStyle(color: Colors.white),
              ),
            ),
            trailing: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://image.shutterstock.com/image-photo/head-shot-portrait-close-smiling-260nw-1714666150.jpg'),
            ),
          ),
          
          
          Container(
         
              child: VStack([
                'Main Menu'.text.white. xl.bold.make().box.width(300).height(50).alignCenter.rounded.neumorphic(color: theme.primaryColor,elevation: 8,curve:VxCurve.flat).make(),
              ])
              
              // Container(
              //   height: 30,width: 100,
              //   decoration:nMbox,
              //   child:  Text(
              //   'Main Menu',
              //   style: TextStyle(
              //     color: Colors.white,
              //     fontWeight: FontWeight.bold,
              //     fontSize: 20,
              //   ),
              // ) ,
              // )
              
              
             
            ),
          
        ],
      );

  get grid => Expanded(
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: GridView.builder(
            // crossAxisSpacing: 26,
            // mainAxisSpacing: 16,
            // crossAxisCount: 2,
            // childAspectRatio: 1.1,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
            ),
            itemCount: pageList.length,
            itemBuilder: ((context, index) {
              return Card(elevation: 7,
                        shadowColor: theme.primaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                child: OpenContainer(
                    openShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    openBuilder: (BuildContext _, VoidCallback __) {
                      return AppDrawer(child: AppOtpPage());
                    },
                    transitionType: ContainerTransitionType.fadeThrough,
                    transitionDuration: const Duration(milliseconds: 1200),
                    closedBuilder: (BuildContext _, VoidCallback openContainer) {
                      return GestureDetector(
                        onTap: openContainer,
                        //  () {
                        //   Navigator.push(
                        //       context,
                        //       MaterialPageRoute(
                        //           builder: ((context) => pageList[index].page)));
                        //           print(pageList[index].page.runtimeType);
                        // },
                        child: Center(
                          child: Column(
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            // mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              SizedBox(
                                height: 20,
                              ),
                              Expanded(
                                  child: Center(
                                      child: Image.asset(
                                          pageList[index].icon.toString()))),
                              Expanded(
                                  child: Center(
                                      child: Text(
                                          pageList[index].title.toString())))
                            ],
                          ),
                        ),
                      );
                    }),
              );
            }),
          ),
        ),
      );
}

class Page {
  String? title;
  String? icon;
  var page;

  Page({this.title, this.icon, this.page});
}
