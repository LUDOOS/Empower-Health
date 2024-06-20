part of 'medical_cubit.dart';


abstract class MedicalState extends Equatable {
  const MedicalState();
  @override
  List<Object> get props => [];
}

class MedicalInitial extends MedicalState {}

class PredictLiverDiseaseLoading extends MedicalState {}
class PredictLiverDiseaseSuccess extends MedicalState {}
class PredictLiverDiseaseError extends MedicalState {}

class PredictDiabetesDiseaseLoading extends MedicalState {}
class PredictDiabetesDiseaseSuccess extends MedicalState {}
class PredictDiabetesDiseaseError extends MedicalState {}

class PredictAnemiaDiseaseLoading extends MedicalState {}
class PredictAnemiaDiseaseSuccess extends MedicalState {}
class PredictAnemiaDiseaseError extends MedicalState {}

class GetLiverResultLoading extends MedicalState {}
class GetLiverResultSuccess extends MedicalState {}
class GetLiverResultError extends MedicalState {}

class FindNearestDocLoading extends MedicalState {}
class FindNearestDocSuccess extends MedicalState {}
class FindNearestDocError extends MedicalState {}

class AddAlarmLoading extends MedicalState {}
class AddAlarmSuccess extends MedicalState {}
class AddAlarmError extends MedicalState {}

class GetAlarmsLoading extends MedicalState {}
class GetAlarmsSuccess extends MedicalState {}
class GetAlarmsError extends MedicalState {}

class SendNotificationSuccess extends MedicalState {}

class AlarmDeletedSuccessfully extends MedicalState {}

class LocationSentState extends MedicalState {}

class Error extends MedicalState {}