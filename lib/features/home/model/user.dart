class User {
  User({
    required this.data,
  });
  late final Data data;

  User.fromJson(Map<String, dynamic> json){
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['data'] = data.toJson();
    return data;
  }
}

class Data {
  Data({
    required this.patientId,
    required this.patientName,
    required this.patientEmail,
    required this.patientBirthdate,
    required this.patientGender,
    required this.patientPassword,
  });
  late final int patientId;
  late final String patientName;
  late final String patientEmail;
  late final String patientBirthdate;
  late final String patientGender;
  late final String patientPassword;

  Data.fromJson(Map<String, dynamic> json){
    patientId = json['patient_id'];
    patientName = json['patient_name'];
    patientEmail = json['patient_email'];
    patientBirthdate = json['patient_birthdate'];
    patientGender = json['patient_gender'];
    patientPassword = json['patient_password'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['patient_id'] = patientId;
    data['patient_name'] = patientName;
    data['patient_email'] = patientEmail;
    data['patient_birthdate'] = patientBirthdate;
    data['patient_gender'] = patientGender;
    data['patient_password'] = patientPassword;
    return data;
  }
}