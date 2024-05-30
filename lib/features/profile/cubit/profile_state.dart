part of 'profile_cubit.dart';


abstract class ProfileState extends Equatable {
  const ProfileState();
  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}



class GetMedicalHistoryLoading extends ProfileState {}
class GetMedicalHistorySuccess extends ProfileState {}
class GetMedicalHistoryError extends ProfileState {}

class Error extends ProfileState {}