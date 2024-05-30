class AnalysisModel {
  AnalysisModel({
    required this.anemia,
    required this.diabetes,
    required this.liver,
  });
  late final List<Anemia> anemia;
  late final List<Diabetes> diabetes;
  late final List<Liver> liver;

  AnalysisModel.fromJson(Map<String, dynamic> json){
    anemia = List.from(json['anemia']).map((e)=>Anemia.fromJson(e)).toList();
    diabetes = List.from(json['diabetes']).map((e)=>Diabetes.fromJson(e)).toList();
    liver = List.from(json['liver']).map((e)=>Liver.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['anemia'] = anemia.map((e)=>e.toJson()).toList();
    data['diabetes'] = diabetes.map((e)=>e.toJson()).toList();
    data['liver'] = liver.map((e)=>e.toJson()).toList();
    return data;
  }
}

class Anemia {
  Anemia({
    required this.id,
    required this.MCH,
    required this.MCHC,
    required this.MCV,
    required this.Hemoglobin,
    required this.patientId,
    required this.gender,
    required this.result,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final num MCH;
  late final num MCHC;
  late final num MCV;
  late final num Hemoglobin;
  late final int patientId;
  late final String gender;
  late final String result;
  late final String createdAt;
  late final String updatedAt;

  Anemia.fromJson(Map<String, dynamic> json){
    id = json['id'];
    MCH = json['MCH'];
    MCHC = json['MCHC'];
    MCV = json['MCV'];
    Hemoglobin = json['Hemoglobin'];
    patientId = json['patient_id'];
    gender = json['gender'];
    result = json['result'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['MCH'] = MCH;
    data['MCHC'] = MCHC;
    data['MCV'] = MCV;
    data['Hemoglobin'] = Hemoglobin;
    data['patient_id'] = patientId;
    data['gender'] = gender;
    data['result'] = result;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Diabetes {
  Diabetes({
    required this.id,
    required this.Pregnancies,
    required this.Glucose,
    required this.BloodPressure,
    required this.SkinThickness,
    required this.Insulin,
    required this.BMI,
    required this.DiabetesPedigreeFunction,
    required this.Age,
    required this.patientId,
    required this.createdAt,
    required this.updatedAt,
    required this.result,
  });
  late final int id;
  late final int Pregnancies;
  late final num Glucose;
  late final num BloodPressure;
  late final num SkinThickness;
  late final num Insulin;
  late final num BMI;
  late final num DiabetesPedigreeFunction;
  late final int Age;
  late final int patientId;
  late final String createdAt;
  late final String updatedAt;
  late final String result;

  Diabetes.fromJson(Map<String, dynamic> json){
    id = json['id'];
    Pregnancies = json['Pregnancies'];
    Glucose = json['Glucose'];
    BloodPressure = json['BloodPressure'];
    SkinThickness = json['SkinThickness'];
    Insulin = json['Insulin'];
    BMI = json['BMI'];
    DiabetesPedigreeFunction = json['DiabetesPedigreeFunction'];
    Age = json['Age'];
    patientId = json['patient_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['Pregnancies'] = Pregnancies;
    data['Glucose'] = Glucose;
    data['BloodPressure'] = BloodPressure;
    data['SkinThickness'] = SkinThickness;
    data['Insulin'] = Insulin;
    data['BMI'] = BMI;
    data['DiabetesPedigreeFunction'] = DiabetesPedigreeFunction;
    data['Age'] = Age;
    data['patient_id'] = patientId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['result'] = result;
    return data;
  }
}

class Liver {
  Liver({
    required this.id,
    required this.age,
    required this.gender,
    required this.totalBilirubin,
    required this.directBilirubin,
    required this.alkphosAlkalinePhosphotase,
    required this.sgptAlamineAminotransferase,
    required this.sgotAspartateAminotransferase,
    required this.totalProteins,
    required this.albAlbumin,
    required this.aGRatio,
    required this.patientId,
    required this.createdAt,
    required this.updatedAt,
    required this.result,
  });
  late final int id;
  late final int age;
  late final String gender;
  late final num totalBilirubin;
  late final num directBilirubin;
  late final num alkphosAlkalinePhosphotase;
  late final num sgptAlamineAminotransferase;
  late final num sgotAspartateAminotransferase;
  late final num totalProteins;
  late final num albAlbumin;
  late final num aGRatio;
  late final int patientId;
  late final String createdAt;
  late final String updatedAt;
  late final String result;

  Liver.fromJson(Map<String, dynamic> json){
    id = json['id'];
    age = json['age'];
    gender = json['gender'];
    totalBilirubin = json['total_bilirubin'];
    directBilirubin = json['direct_bilirubin'];
    alkphosAlkalinePhosphotase = json['alkphos_alkaline_phosphotase'];
    sgptAlamineAminotransferase = json['sgpt_alamine_aminotransferase'];
    sgotAspartateAminotransferase = json['sgot_aspartate_aminotransferase'];
    totalProteins = json['total_proteins'];
    albAlbumin = json['alb_albumin'];
    aGRatio = json['a_g_ratio'];
    patientId = json['patient_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    result = json['result'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['age'] = age;
    data['gender'] = gender;
    data['total_bilirubin'] = totalBilirubin;
    data['direct_bilirubin'] = directBilirubin;
    data['alkphos_alkaline_phosphotase'] = alkphosAlkalinePhosphotase;
    data['sgpt_alamine_aminotransferase'] = sgptAlamineAminotransferase;
    data['sgot_aspartate_aminotransferase'] = sgotAspartateAminotransferase;
    data['total_proteins'] = totalProteins;
    data['alb_albumin'] = albAlbumin;
    data['a_g_ratio'] = aGRatio;
    data['patient_id'] = patientId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['result'] = result;
    return data;
  }
}