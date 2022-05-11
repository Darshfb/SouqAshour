import '../../../Models/Login_Models/login_models.dart';

abstract class LoginStates {}

class InitialLoginState extends LoginStates {}

class ObscureLoginState extends LoginStates {}

class LoadingLoginState extends LoginStates {}

class SuccessLoginState extends LoginStates {
  final LoginModels model;

  SuccessLoginState(this.model);
}

class ErrorLoginState extends LoginStates {
  final String error;

  ErrorLoginState(this.error);
}
