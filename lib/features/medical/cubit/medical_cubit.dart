import 'dart:async';
import 'package:empower_health/core/caching/caching_helper.dart';
import 'package:empower_health/core/caching/caching_key.dart';
import 'package:empower_health/core/network/network.dart';
import 'package:empower_health/features/model/alarm.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:location/location.dart';

import '../../../core/notification/notification_service.dart';
part 'medical_state.dart';

class MedicalCubit extends Cubit<MedicalState> {
  MedicalCubit() : super(MedicalInitial());

  String? specialization;
  String? liverResult;
  void predictLiverDisease({
    required int age,
    required String gender,
    required double total_bilirubin,
    required double direct_bilirubin,
    required double alkphos_alkaline_phosphotase,
    required double sgpt_alamine_aminotransferase,
    required double sgot_aspartate_aminotransferase,
    required double total_proteins,
    required double alb_albumin,
    required double a_g_ratio,
  }) async {
    emit(PredictLiverDiseaseLoading());
    try {
      specialization = '';
      await NetworkHelper.instance.post(
        endPoint: EndPoints.PREDICTLIVER,
        data: {
          "age": age,
          "gender": gender,
          "total_bilirubin": total_bilirubin,
          "direct_bilirubin": direct_bilirubin,
          "alkphos_alkaline_phosphotase": alkphos_alkaline_phosphotase,
          "sgpt_alamine_aminotransferase": sgpt_alamine_aminotransferase,
          "sgot_aspartate_aminotransferase": sgot_aspartate_aminotransferase,
          "total_proteins": total_proteins,
          "alb_albumin": alb_albumin,
          "a_g_ratio": a_g_ratio,
          "patient_id": CachingHelper.instance?.readInteger(CachingKey.USER),
        },
      ).then((value) {
        locationSelected = false;
        liverResult = value.data['result'];
        specialization = value.data['specialization'];
        emit(PredictLiverDiseaseSuccess());
      });
    } catch (e) {
      emit(PredictLiverDiseaseError());
      //log(e.toString(), name: "User Info Home Cubit");
    }
  }

  String? diabetesResult;
  void predictDiabetesDisease({
    required int age,
    required int pregnancies,
    required double glucose,
    required double bloodPressure,
    required double skinThickness,
    required double insulin,
    required double bMI,
    required double diabetesPedigreeFunction,
  }) async {
    emit(PredictDiabetesDiseaseLoading());
    try {
      specialization = '';
      await NetworkHelper.instance.post(
        endPoint: EndPoints.PREDICTDIABETES,
        data: {
          "Pregnancies": 5,
          "Glucose": 120,
          "BloodPressure": 70,
          "SkinThickness": 30,
          "Insulin": 90,
          "BMI": 25.5,
          "DiabetesPedigreeFunction": 0.55,
          "Age": age,
          "patient_id": CachingHelper.instance?.readInteger(CachingKey.USER),
        },
      ).then((value) {
        locationSelected = false;
        diabetesResult = value.data['result'];
        specialization = value.data['specialization'];
        emit(PredictDiabetesDiseaseSuccess());
      });
    } catch (e) {
      emit(PredictDiabetesDiseaseError());
      //log(e.toString(), name: "User Info Home Cubit");
    }
  }

  String? anemiaResult;
  void predictAnemiaDisease({
    required String gender,
    required double hemoglobin,
    required double mCH,
    required double mCHC,
    required double mCV,
  }) async {
    emit(PredictAnemiaDiseaseLoading());
    try {
      specialization = '';
      await NetworkHelper.instance.post(
        endPoint: EndPoints.PREDICTANEMIA,
        data: {
          "gender": gender,
          "Hemoglobin": hemoglobin,
          "MCH": mCH,
          "MCHC": mCHC,
          "MCV": mCV,
          "patient_id": CachingHelper.instance?.readInteger(CachingKey.USER),
        },
      ).then((value) {
        locationSelected = false;
        anemiaResult = value.data['result'];
        specialization = value.data['specialization'];
        emit(PredictAnemiaDiseaseSuccess());
      });
    } catch (e) {
      emit(PredictAnemiaDiseaseError());
      //log(e.toString(), name: "User Info Home Cubit");
    }
  }

  bool locationSelected = false;
  double? long;
  double? latt;
  Future<void> getLocation() async {
    locationSelected = false;
    long = 0;
    latt = 0;
    Location location = Location();
    await location.getLocation().then((value) {
      locationSelected = true;
      emit(LocationSentState());
      long = value.longitude;
      latt = value.latitude;
      print(long);
    });
  }

  String? location;
  void findNearestDoc() async {
    location = '';
    emit(FindNearestDocLoading());
    try {
      var result = await NetworkHelper.instance
          .get(
        endPoint: 'doctors/find/${long}/${latt}/${specialization}',
      )
          .then((value) {
        emit(FindNearestDocSuccess());
        print(value.data['nearest_doctor']['specialization']);
        location = value.data['nearest_doctor']['location'];
      });
    } catch (e) {
      emit(FindNearestDocError());
    }
    ;
  }

  void addAlarm({
    required int dosage,
    required int frequency,
    required String drugName,
    required DateTime startDate,
    required DateTime endDate,
    required DateTime firstDosage,
  }) async {
    emit(AddAlarmLoading());
    try {
      String firstDose = DateFormat("HH:mm").format(firstDosage);
      await NetworkHelper.instance.post(
        endPoint: EndPoints.ADDALARM,
        data: {
          "dosage": dosage.toString(),
          "drug_name": drugName,
          "frequency": frequency,
          "start_date": startDate.toString(),
          "end_date": endDate.toString(),
          "first_dosage": firstDose.toString(),
          "status": "active",
          "patient_id": CachingHelper.instance?.readInteger(CachingKey.USER),
        },
      ).then((value) {
        emit(AddAlarmSuccess());

        ///notification
        int intervalHour = (24 / frequency) as int;
        // freq=1 => inter=24, freq=2 => inter=12,
        // freq=3 => inter=8, freq=4 => inter=6,
        print('intervalHour = $intervalHour');
        NotificationService().scheduleNotification(
          'Time to take $drugName',
          'The dose is: $dosage',
          firstDosage,
          intervalHour,
          startDate,
          endDate,
        );
      });
    } catch (e) {
      emit(AddAlarmError());
    }
  }

  Alarm? alarms;
  Future getAlarms() async {
    emit(GetAlarmsLoading());
    await NetworkHelper.instance
        .get(endPoint: EndPoints.GETALARMS)
        .then((value) {
      alarms = Alarm.fromJson(value.data);
      print('*************');
      print(alarms!.data.length);
      return alarms;
    });
    return alarms;
  }

  void deleteAlarm(int id) async {
    await NetworkHelper.instance
        .delete(endPoint: 'drugs/delete/${id}')
        .then((value) {
      getAlarms();
      emit(AlarmDeletedSuccessfully());
    });
  }
}
