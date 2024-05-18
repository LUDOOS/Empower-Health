import 'dart:developer';

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
    } catch (e) {
      emit(AuthError());
      log(e.toString(), name: "Login Auth Cubit");
    }
  }
}
