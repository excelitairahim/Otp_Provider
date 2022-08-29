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


// This is what you're looking for!

@override
  void initState() {
 
    DashboardController dashboardController=Provider.of<DashboardController>(context,listen: false);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     DashboardController dashboardController=Provider.of<DashboardController>(context,);

    return ListView.builder(
     controller:dashboardController.scrollController ,
        itemCount: dashboardController.Otprequestlist.length,
        shrinkWrap: true,
       
        // reverse: true,
        //physics: NeverScrollableScrollPhysics(),
        itemBuilder: ((context, index) {
          return Container(
              // padding: EdgeInsets.all(15),
              child: Table(
            border: TableBorder.all(
                width: 1, color: Colors.black45), //table border
            children: [
              TableRow(  
                
                decoration: BoxDecoration(),
                children: [
                TableCell(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('${(index+1).toString()}')),
                )),
                TableCell(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(child: Text('${dashboardController.Otprequestlist[index].menberID .toString()}')),
                )),
                TableCell(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(child: Text(dashboardController.Otprequestlist[index].otpStatus.toString())),
                  ),
                )),
                TableCell(
                    child:
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(child: Column(
                            children: [
                              Text(dashboardController.timeString. toString()),
                              // Text(dashboardController.date. toString()),
                            ],
                          )),
                        )),
              ]),
            ],
          ));
        }));
  }

 
}
