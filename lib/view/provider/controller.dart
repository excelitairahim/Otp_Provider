import 'package:flutter/material.dart';
import 'package:otp_provider/model/user_model.dart';

class DashboardController extends ChangeNotifier {
  List<OtpProvidermodel> Otprequestlist = [];
    List<OtpProvidermodel> OtpSendlist = [];
  otpRequest() {
    OtpProvidermodel otpProvidermodel =
        OtpProvidermodel(menberID: 1, otpStatus: true, otpTime: DateTime.now());
    Otprequestlist.add(otpProvidermodel);
    notifyListeners();
  }
    otpSending() {
    OtpProvidermodel otpProvidermodel =
        OtpProvidermodel(menberID: 1, otpStatus: true, otpTime: DateTime.now());
    OtpSendlist.add(otpProvidermodel);
    notifyListeners();
  }
}
