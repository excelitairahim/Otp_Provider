class OtpProvidermodel {
  int? menberID;
  bool? otpStatus;
  DateTime? otpTime;
  OtpProvidermodel({this.menberID, this.otpStatus, this.otpTime});

  OtpProvidermodel.fromJson(Map<String, dynamic> json) {
    menberID = json['menberID'];
    otpStatus = json['otpStatus'];
    otpTime = json['otpTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['menberID'] = this.menberID;
    data['otpStatus'] = this.otpStatus;
    data['otpTime'] = this.otpTime;
    return data;
  }
}
