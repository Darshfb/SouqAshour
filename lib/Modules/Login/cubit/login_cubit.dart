import 'package:ashour/Modules/Login/cubit/login_states.dart';
import 'package:ashour/Shared/Network/dio_helper.dart';
import 'package:ashour/Shared/constant/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Models/Login_Models/login_models.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(InitialLoginState());

  static LoginCubit get(context) => BlocProvider.of(context);
  bool isObscure = true;
  IconData? visibilityIcon = Icons.visibility_off;

  void loginChangeVisibility() {
    isObscure = !isObscure;
    visibilityIcon = (isObscure) ? Icons.visibility_off : Icons.visibility;
    emit(ObscureLoginState());
  }

  LoginModels? loginModels;

  void userLogin({required String? email, required String password}) {
    emit(LoadingLoginState());
     DioHelper.postData(
        url: LOGIN,
        data: {"username": email, "password": password}).then((value) {
      loginModels = LoginModels.fromJson(value.data);
      print(loginModels!.token.toString());
      emit(SuccessLoginState(loginModels!));
    }).catchError((error) {
      emit(ErrorLoginState(error.toString()));
      print('Error when Login $error');
    });
  }
}
