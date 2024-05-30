import 'dart:developer';
import 'package:empower_health/core/caching/caching_helper.dart';
import 'package:empower_health/core/caching/caching_key.dart';
import 'package:empower_health/core/network/network.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../model/Patient.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  Patient? userModel;
  void getPatientData()async {
    emit(GetUserDataLoading());
    try {
      var result = await NetworkHelper.instance.get(endPoint: EndPoints.GETPATIENT,);
      userModel = Patient.fromJson(result.data);
      CachingHelper.instance?.writeData(CachingKey.NAME, result.data['data']['patient_name']);
       debugPrint(userModel?.data.patientName);
      emit(GetUserDataSuccess());
    } catch (e) {
      emit(GetUserDataError());
      log(e.toString(), name: "User Info Home Cubit");
    }
  }

  void logout()async
  {
    try{
      NetworkHelper.instance.post(endPoint: EndPoints.LOGOUT);
      CachingHelper.instance?.removeData(CachingKey.USER);
      CachingHelper.instance?.removeData(CachingKey.TOKEN);
      CachingHelper.instance
          ?.writeData(CachingKey.IS_LOGIN, false);
      emit(LogoutSuccessState());
    }catch(e){}
  }
}
