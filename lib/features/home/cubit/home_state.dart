part of 'home_cubit.dart';


abstract class HomeState extends Equatable {
  const HomeState();
  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class GetUserDataLoading extends HomeState {}
class GetUserDataSuccess extends HomeState {}
class GetUserDataError extends HomeState {}

class LogoutSuccessState extends HomeState{}

class HomeError extends HomeState {}
