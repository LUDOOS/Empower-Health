import 'dart:developer';

import 'package:empower_health/core/caching/caching_helper.dart';
import 'package:empower_health/core/caching/caching_key.dart';
import 'package:empower_health/core/network/network.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user.dart';


part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());


  User? userModel;
  void getPatientData()async {
    emit(GetUserDataLoading());
    try {
      var result = await NetworkHelper.instance.get(
          endPoint: EndPoints.GETPATIENT,);
      userModel = User.fromJson(result.data);
      // print(userModel?.data.patientName);
      emit(GetUserDataSuccess());
    } catch (e) {
      emit(GetUserDataError());
      log(e.toString(), name: "User Info Home Cubit");
    }
  }

  void logout()async
  {
    NetworkHelper.instance.post(endPoint: EndPoints.LOGOUT);
    CachingHelper.instance?.removeData(CachingKey.USER);
    CachingHelper.instance?.removeData(CachingKey.TOKEN);
    CachingHelper.instance
        ?.writeData(CachingKey.IS_LOGIN, false);
  }
}
