import 'dart:developer';

import 'package:empower_health/core/caching/caching_helper.dart';
import 'package:empower_health/core/caching/caching_key.dart';
import 'package:empower_health/core/network/network.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  void login({required String mail, required String password}) async {
    emit(AuthLoading());
    try {
      var result = await NetworkHelper.instance.post(
          endPoint: EndPoints.LOGIN,
          data: {"email": mail, "password": password});
      emit(AuthSuccess(result.data['token']));
      getToken(result);
    } catch (e) {
      emit(AuthError());
      log(e.toString(), name: "Login Auth Cubit");
    }
  }

  void register({
    required String mail,
    required String password,
    required String name,
    required String birthdate,
    required String gender,
  }) async {
    emit(AuthLoading());
    try {
      var result = await NetworkHelper.instance.post(
          endPoint: EndPoints.REGISTER,
          data: {
            "email": mail, "password": password,
            "name": name, "birthdate": birthdate, "gender": gender
          });
      emit(AuthRegisterSuccess(result.data['token']));
      getToken(result);
    } catch (e) {
      emit(AuthError());
      log(e.toString(), name: "Register Auth Cubit");
    }
  }

  void getToken(dynamic result)
  {
    CachingHelper.instance?.writeData(CachingKey.USER, result.data['patient_id']);
    CachingHelper.instance?.writeData(CachingKey.TOKEN, result.data['token']);
    CachingHelper.instance
        ?.writeData(CachingKey.IS_LOGIN, true);
  }

  void sendContactMessage({
    required String mail,
    required String phone,
    required String name,
    required String message,
  }) async {
    NetworkHelper.instance.post(
        endPoint: EndPoints.CONTACT,
        data: {
          "name": name, "message": message,
          //"email": mail,
          "phone": phone,
          "patient_id": CachingHelper.instance?.readInteger(CachingKey.USER),
        }).then((value) {
      emit(ContactUsSuccessState());
    });
  }

}
