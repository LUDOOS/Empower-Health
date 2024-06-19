class Alarm {
  Alarm({
    required this.data,
  });
  late final List<Data> data;

  Alarm.fromJson(Map<String, dynamic> json){
    data = List.from(json['data']).map((e)=>Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.id,
    required this.drugName,
    required this.dosage,
    required this.frequency,
    required this.startDate,
    required this.endDate,
    required this.firstDosage,
    required this.patientId,
    required this.status,
  });
  late final int id;
  late final String drugName;
  late final String dosage;
  late final int frequency;
  late final String startDate;
  late final String endDate;
  late final String firstDosage;
  late final int patientId;
  late final String status;

  Data.fromJson(Map<String, dynamic> json){
    id = json['id'];
    drugName = json['drug_name'];
    dosage = json['dosage'];
    frequency = json['frequency'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    firstDosage = json['first_dosage'];
    patientId = json['patient_id'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['drug_name'] = drugName;
    _data['dosage'] = dosage;
    _data['frequency'] = frequency;
    _data['start_date'] = startDate;
    _data['end_date'] = endDate;
    _data['first_dosage'] = firstDosage;
    _data['patient_id'] = patientId;
    _data['status'] = status;
    return _data;
  }
}