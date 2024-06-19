part of 'network.dart';

String BASE_URL = "https://5fd9-156-219-216-228.ngrok-free.app/api/";
class EndPoints {
  static const LOGIN = "login";
  static const LOGOUT = "logout/patient";
  static const REGISTER = "register";
  static const CONTACT = "contact_message/add";
  static var GETPATIENT = "patient/${CachingHelper.instance!.readInteger(CachingKey.USER)}";
  static var GETPATIENTHISTORY = "medical_history/${CachingHelper.instance!.readInteger(CachingKey.USER)}";
  static const PREDICTLIVER = "liver/predict";
  static const PREDICTDIABETES = "diabetes/predict";
  static const PREDICTANEMIA = "anemia/predict";
  static const ADDALARM = "drugs/add";
  static var GETALARMS = "drugs/patient/${CachingHelper.instance!.readInteger(CachingKey.USER)}";
  static var DELETEALARMS = "drugs/delete/${CachingHelper.instance!.readInteger(CachingKey.USER)}";
}
