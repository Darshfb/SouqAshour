import 'package:ashour/Modules/Register/cubit/register_state.dart';
import 'package:ashour/Shared/Network/dio_helper.dart';
import 'package:ashour/Shared/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(InitialRegisterState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  bool isObscure = true;
  IconData? visibilityIcon = Icons.visibility_off;

  void registerChangeVisibility() {
    isObscure = !isObscure;
    visibilityIcon = (isObscure) ? Icons.visibility_off : Icons.visibility;
    emit(ChangeVisibilityState());
  }

  void userRegister({
    required String email,
    required String password,
    required String phoneNumber,
    required String username,
    required String fullName,
  }) {
    emit(LoadingRegisterState());
    DioHelper.postData(url: REGISTER, data: {
      "email": email,
      "password": password,
      "username": username,
      "phoneNumber": phoneNumber,
      "fullName": fullName
    }).then((value) {
      emit(SuccessRegisterState());
      print(value.data);
    }).catchError((error) {
      emit(ErrorRegisterState(error.toString()));
    });
  }

  bool isPasswordEightCharacters = false;
  bool hasPasswordOneNumber = false;
  bool hasUpperCaseCharacters = false;
  bool hasSpecialCharacters = false;

  void onPasswordChanged(String password) {
    emit(PasswordChangeFirstState());
    final numericRegex = RegExp(r'[0-9]');
    final specialRegex = RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%\s-]');
    final upperCaseRegex = RegExp(r'[A-Z]');
    isPasswordEightCharacters = false;
    hasPasswordOneNumber = false;
    hasUpperCaseCharacters = false;
    hasSpecialCharacters = false;
    if (password.length >= 8) {
      isPasswordEightCharacters = true;
      emit(PasswordChangeState());
    }
    if (numericRegex.hasMatch(password)) {
      hasPasswordOneNumber = true;
      emit(PasswordChangeNumberState());
    }
    if (upperCaseRegex.hasMatch(password)) {
      print(hasUpperCaseCharacters.toString());
      emit(PasswordChangeUpperCaseState());
      hasUpperCaseCharacters = true;
    }
    if (specialRegex.hasMatch(password)) {
      hasSpecialCharacters =true;
      emit(PasswordChangeSpecialState());
    }}
  }
