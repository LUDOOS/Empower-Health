part of 'network.dart';

String BASE_URL = "https://c444-156-219-109-62.ngrok-free.app/api/";
class EndPoints {
  static const LOGIN = "login";
  static const LOGOUT = "logout/patient";
  static const REGISTER = "register";
  static const CONTACT = "contact_message/add";
  static var GETPATIENT = "patient/${CachingHelper.instance!.readInteger(CachingKey.USER)}";
  static var GETPATIENTHISTORY = "medical_history/${CachingHelper.instance!.readInteger(CachingKey.USER)}";
  static var PREDICTLIVER = "liver/predict";
  static var PREDICTDIABETES = "diabetes/predict";
  static var PREDICTANEMIA = "anemia/predict";
  static var ADDALARM = "drugs/add";
}
