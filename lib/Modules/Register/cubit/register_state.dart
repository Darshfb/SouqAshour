abstract class RegisterStates {}

class InitialRegisterState extends RegisterStates {}

class ChangeVisibilityState extends RegisterStates {}

class LoadingRegisterState extends RegisterStates {}

class SuccessRegisterState extends RegisterStates {}

class ErrorRegisterState extends RegisterStates {
  final String error;

  ErrorRegisterState(this.error);
}

class PasswordChangeState extends RegisterStates {}

class PasswordChangeFirstState extends RegisterStates {}

class PasswordChangeNumberState extends RegisterStates {}

class PasswordChangeSpecialState extends RegisterStates {}

class PasswordChangeUpperCaseState extends RegisterStates {}
