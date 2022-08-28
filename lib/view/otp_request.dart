import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:otp_provider/model/user_model.dart';
import 'package:otp_provider/theme/theme.dart';
import 'package:otp_provider/view/provider/controller.dart';
import 'package:provider/provider.dart';
class OtprequestStatus extends StatefulWidget {
  const OtprequestStatus({Key? key}) : super(key: key);

  @override
  State<OtprequestStatus> createState() => _OtprequestStatusState();
}

class _OtprequestStatusState extends State<OtprequestStatus> {


  @override
  Widget build(BuildContext context) {
     DashboardController dashboardController=Provider.of<DashboardController>(context);
    return Container(
      // width: double.infinity,
      child: Column(
        children: [
          Table(
            border: TableBorder.all(width: 1, color: Colors.black45),
            children: [
              TableRow(children: [
                TableCell(
                    child: Center(
                  child: Text(
                    "Member ID",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Text(
                    "Request status",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                  ),
                )),
                TableCell(
                    child: Center(
                  child: Text(
                    "Request Time",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold,color: theme.title2TextColor),
                  ),
                )),
              ]),
            ],
          ),
          ListView.builder(
              itemCount: dashboardController.Otprequestlist.length,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: ((context, index) {
                return Container(
                    // padding: EdgeInsets.all(15),
                    child: Table(
                  border: TableBorder.all(
                      width: 1, color: Colors.black45), //table border
                  children: [
                    TableRow(children: [
                      TableCell(child: Center(child: Text('${(index+1).toString()}'))),
                      TableCell(child: Center(child: Text(dashboardController.Otprequestlist[index].otpStatus.toString()))),
                      TableCell(
                          child:
                              Center(child: Text(DateTime.now().toString()))),
                    ]),
                  ],
                ));
              }))
        ],
      ),
    );
  }
}
