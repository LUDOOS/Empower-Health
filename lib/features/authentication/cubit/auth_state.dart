part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();
  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final String message;

  AuthSuccess(this.message);
}
class AuthRegisterSuccess extends AuthState {
  final String message;

  AuthRegisterSuccess(this.message);
}
class ContactUsSuccessState extends AuthState {}


class AuthError extends AuthState {}
