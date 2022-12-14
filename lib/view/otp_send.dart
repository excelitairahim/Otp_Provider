import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:otp_provider/model/user_model.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/view/provider/controller.dart';
import 'package:provider/provider.dart';

class OtpSendstatus extends StatefulWidget {
  const OtpSendstatus({Key? key}) : super(key: key);

  @override
  State<OtpSendstatus> createState() => _OtpSendstatusState();
}

class _OtpSendstatusState extends State<OtpSendstatus> {
  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController =
        Provider.of<DashboardController>(context);
    return ListView.builder(
        controller: dashboardController.scrollController2,
        itemCount: dashboardController.OtpSendlist.length,
        shrinkWrap: true,
        //  physics: NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return Column(
            children: [
              Container(
                  // padding: EdgeInsets.all(15),
                  child: Table(
                //  border:
                // TableBorder.all(width: 1, color: Colors.black45), //table border
                children: [
                  TableRow(children: [
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Center(child: Text('No.${(index + 1).toString()}')),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                          child: Text(
                        '${dashboardController.OtpSendlist[index].menberID.toString()}',
                        style: TextStyle(),
                      )),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.notifications_active,
                            size: 16,
                            color: index.isEven ? Colors.green : Colors.red,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(index.isEven
                              ? 'True'.toString()
                              : ' false'.toString(),style: TextStyle(),),
                        ],
                      )),
                    )),
                    TableCell(
                        child: Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Center(
                          child: Column(
                        children: [
                          Text(dashboardController.timeString.toString()),
                          //  Text(dashboardController.date. toString()),
                        ],
                      )),
                    )),
                  ]),
                ],
              )),
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
