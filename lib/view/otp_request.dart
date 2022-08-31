import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:otp_provider/model/user_model.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/view/provider/controller.dart';
import 'package:provider/provider.dart';

import 'neumorphism_design/nUButton.dart';
import 'neumorphism_design/neumorphism_container.dart';

class OtprequestStatus extends StatefulWidget {
  const OtprequestStatus({Key? key}) : super(key: key);

  @override
  State<OtprequestStatus> createState() => _OtprequestStatusState();
}

class _OtprequestStatusState extends State<OtprequestStatus> {
// This is what you're looking for!

  @override
  void initState() {
    DashboardController dashboardController =
        Provider.of<DashboardController>(context, listen: false);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Provider.of<DashboardController>(
      context,
    );

    return ListView.builder(
        controller: dashboardController.scrollController,
        itemCount: dashboardController.Otprequestlist.length,
        shrinkWrap: true,

        // reverse: true,
        //physics: NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Container(
                  // padding: EdgeInsets.all(15),
                  child: Table(
                //  border:
                //  TableBorder.all(width: 1, color: Colors.black45), //table border
                children: [
                  TableRow(decoration: BoxDecoration(), children: [
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //  NMButton(text:'No.${(index + 1).toString()}',width: 95 ,),
                          Text(
                            'No.${(index + 1).toString()}',
                            style: TextStyle(
                                color: index.isOdd
                                    ? theme.table_text_color
                                    : theme.table_text_color2,
                            
                                ),
                          ),
                        ],
                      )),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Center(
                          child: Text(
                              '${dashboardController.Otprequestlist[index].menberID.toString()}',style: TextStyle(
                                color: index.isOdd
                                    ? theme.table_text_color
                                    : theme.table_text_color2,
                                ))))),
                    
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_active,
                            size: 16,
                            color: index.isOdd ? Colors.green : Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(index.isOdd
                              ? 'True'.toString()
                              : ' false'.toString(),style: TextStyle(color: index.isOdd
                                    ? theme.table_text_color
                                    : theme.table_text_color2,
                               )),
                        ],
                      )),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                          child: Column(
                        children: [
                          Text(dashboardController.timeString.toString(),style: TextStyle(
                                color: index.isOdd
                                    ? theme.table_text_color
                                    : theme.table_text_color2,
                                )),
                          // Text(dashboardController.date. toString()),
                        ],
                      )),
                    )),
                  ]),
                ],
              )),
              // Container(
              //         padding: EdgeInsets.all(10),
              //         decoration: nMboxInvert,
              //         child: Text(
              //           'Otp Request Status',
              //           style: TextStyle(fontWeight: FontWeight.w700,color: theme.titleTextColor),
              //         ),
              //       ),
              // Container(
              //   width: double.infinity,
              //   padding: EdgeInsets.all(0),
              //   decoration: nMboxInvert,
              //   child: Text(
              //     '',
              //     style: TextStyle(),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Divider(
                  color: Colors.grey,
                ),
              ),
            ],
          );
        }));
  }
}
