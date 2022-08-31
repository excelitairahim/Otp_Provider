import 'package:flutter/material.dart';
import 'package:otp_provider/model/user_model.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
class DashboardController extends ChangeNotifier {
  List<OtpProvidermodel> Otprequestlist = [];
    List<OtpProvidermodel> OtpSendlist = [];
      late String timeString;
    //  ScrollController scrollController = ScrollController();
  late var date;
   ScrollController scrollController = ScrollController();
     ScrollController scrollController2 = ScrollController();
 scrollToMaxExtent() {
  WidgetsBinding.instance.addPostFrameCallback((_) {
    scrollController.animateTo(
      scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeIn,
    );
  });notifyListeners()
;}
// This is what you're looking for!
 scrollDown() {
  print('FFFFFFFFFF');
  scrollController2.animateTo(
    scrollController2.position.maxScrollExtent,
    duration: Duration(microseconds: 300),
    curve: Curves.easeOut,
  );
  notifyListeners();
}
  otpRequest() {

 timeString = DateFormat('hh:mm:ss ').format(DateTime.now());
    date = DateFormat('dd/MMM/yyy').format(DateTime.now());
    OtpProvidermodel otpProvidermodel =
        OtpProvidermodel(serial: 1, menberID: 121, otpStatus: true, otpTime: timeString);
    Otprequestlist.add(otpProvidermodel);
    notifyListeners();
  }
    otpSending() {
       timeString = DateFormat('hh:mm:ss ').format(DateTime.now());
    date = DateFormat('dd/MMM/yyy').format(DateTime.now());
    OtpProvidermodel otpProvidermodel =
        OtpProvidermodel(menberID: 321, otpStatus: true, otpTime:timeString );
    OtpSendlist.add(otpProvidermodel);
    notifyListeners();
  }


}
