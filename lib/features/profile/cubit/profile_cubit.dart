

import 'dart:developer';

import 'package:empower_health/core/network/network.dart';
import 'package:empower_health/features/profile/analysis_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());

  AnalysisModel? history;
  List<Anemia>? anemia;
  List<Diabetes>? diabetes;
  List<Liver>? liver;

  void getPatientData()async {
    emit(GetMedicalHistoryLoading());
    try {
      NetworkHelper.instance.get(endPoint: EndPoints.GETPATIENTHISTORY,).then((value) {
        history = AnalysisModel.fromJson(value.data);
        anemia = history?.anemia;
        diabetes = history?.diabetes;
        liver = history?.liver;
        emit(GetMedicalHistorySuccess());
      });

    } catch (e) {
      emit(GetMedicalHistoryError());
      log(e.toString(), name: "User Info Profile Cubit");
    }
  }

}
