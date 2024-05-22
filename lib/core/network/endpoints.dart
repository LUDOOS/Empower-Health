part of 'network.dart';

String BASE_URL = "https://31cb-156-219-12-161.ngrok-free.app/api/";

class EndPoints {
  static const LOGIN = "login";
  static const LOGOUT = "logout/patient";
  static const REGISTER = "register";
  static var GETPATIENT = "patient/${CachingHelper.instance!.readInteger('USER')}";
}
