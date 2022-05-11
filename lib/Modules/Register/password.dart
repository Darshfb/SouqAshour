import 'package:ashour/Modules/Register/cubit/register_cubit.dart';
import 'package:ashour/Modules/Register/cubit/register_state.dart';
import 'package:ashour/Shared/component/component.dart';
import 'package:ashour/Shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:password_validated_field/password_validated_field.dart';

class PasswordScreen extends StatelessWidget {
  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final String? email, phoneNumber, username, fullName;

  PasswordScreen({
    Key? key,
    required this.email,
    required this.phoneNumber,
    required this.username,
    required this.fullName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(height: MediaQuery
                          .of(context)
                          .size
                          .height / 4,
                        decoration: BoxDecoration(
                          color: Colors.deepOrange.shade400,
                          borderRadius: const BorderRadiusDirectional.only(
                            topEnd: Radius.circular(25.0),
                            topStart: Radius.circular(5.0),
                            bottomStart: Radius.circular(25.0),
                            bottomEnd: Radius.circular(5.0),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              SizedBox(height: 10,),
                              Expanded(child: Text('Set a password',
                                style: TextStyle(fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),)),
                              SizedBox(height: 10,),
                              Expanded(child: Text(
                                'Please create a secure password including the following criteria below',
                                style: TextStyle(fontSize: 16,
                                    height: 1.5,
                                    color: Colors.white),)),
                            ],
                          ),
                        ),
                      ),
                      Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(
                                5.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              const SizedBox(height: 10.0,),
                              CustomTextFormField(
                                  onChanged: (password) {
                                    cubit.onPasswordChanged(password);
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Password mustn\'t be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.visiblePassword,
                                  controller: controller,
                                  hintText: 'password',
                                  labelText: 'Password',
                                  obscureText: cubit.isObscure,
                                  prefixIcon: IconBroken.password,
                                  suffixIcon: cubit.visibilityIcon,
                                  pressedSuffixIcon: () {
                                    cubit.registerChangeVisibility();
                                  }),
                              const SizedBox(height: 10.0,),
                              Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: cubit.isPasswordEightCharacters
                                          ? Colors.green
                                          : Colors.transparent,
                                      border: cubit.isPasswordEightCharacters
                                          ? Border.all(
                                          color: Colors.transparent)
                                          : Border.all(
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Center(child: Icon(
                                      Icons.check, color: Colors.white,
                                      size: 15,),),
                                  ),
                                  const SizedBox(width: 10.0,),
                                  const Text('Contains at least 8 characters'),
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: cubit.hasPasswordOneNumber ? Colors
                                          .green : Colors.transparent,
                                      border: cubit.hasPasswordOneNumber
                                          ? Border.all(
                                          color: Colors.transparent)
                                          : Border.all(
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Center(child: Icon(
                                      Icons.check, color: Colors.white,
                                      size: 15,),),
                                  ),
                                  const SizedBox(width: 10.0,),
                                  const Text('Contains at least 1 number'),
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: cubit.hasUpperCaseCharacters
                                          ? Colors.green
                                          : Colors.transparent,
                                      border: cubit.hasUpperCaseCharacters
                                          ? Border.all(
                                          color: Colors.transparent)
                                          : Border.all(
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Center(child: Icon(
                                      Icons.check, color: Colors.white,
                                      size: 15,),),
                                  ),
                                  const SizedBox(width: 10.0,),
                                  const Text(
                                      'Contains at least 1 uppercase letter'),
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                              Row(
                                children: [
                                  AnimatedContainer(
                                    duration: const Duration(milliseconds: 500),
                                    width: 20,
                                    height: 20,
                                    decoration: BoxDecoration(
                                      color: cubit.hasSpecialCharacters ? Colors
                                          .green : Colors.transparent,
                                      border: cubit.hasSpecialCharacters
                                          ? Border.all(
                                          color: Colors.transparent)
                                          : Border.all(
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: const Center(child: Icon(
                                      Icons.check, color: Colors.white,
                                      size: 15,),),
                                  ),
                                  const SizedBox(width: 10.0,),
                                  const Text(
                                      'Contains at least 1 special character'),
                                ],
                              ),
                              const SizedBox(height: 10.0,),
                            ],
                          ),
                        ),
                      ),

                      MaterialButton(
                        minWidth: double.infinity,
                          color: Colors.deepOrange,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if(cubit.hasSpecialCharacters && cubit.hasSpecialCharacters && cubit.isPasswordEightCharacters && cubit.hasPasswordOneNumber)
                              {
                                cubit.userRegister(
                                    email: email!,
                                    password: controller.text,
                                    phoneNumber: phoneNumber!,
                                    username: username!,
                                    fullName: fullName!);
                              }

                            }



                          },
                          child: const Text("Register Now")),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
