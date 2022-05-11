import 'package:ashour/Modules/Login/cubit/login_states.dart';
import 'package:ashour/Modules/Register/cubit/register_cubit.dart';
import 'package:ashour/Modules/Register/cubit/register_state.dart';
import 'package:ashour/Modules/Register/password.dart';
import 'package:ashour/Shared/component/component.dart';
import 'package:ashour/Shared/styles/icon_broken.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  final emailController = TextEditingController();
  var passwordController = TextEditingController();
  final userNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final fullNameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
                color: Colors.black,
              ),
            ),
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                          alignment: AlignmentDirectional.center,
                          child: Image.asset(
                            'assets/images/register.jpg',
                            height: 150,
                            width: 150,
                          )),
                      Text(
                        'Sign up',
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          elevation: 20,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 20.0,
                                ),
                                // email text form field
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Email mustn\'t be empty ';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: emailController,
                                  hintText: 'Email',
                                  labelText: 'Email',
                                  prefixIcon: IconBroken.user,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),

                                const SizedBox(
                                  height: 8.0,
                                ),
                                //UserName
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Name mustn\'t be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: userNameController,
                                  hintText: 'Name',
                                  labelText: 'Name',
                                  prefixIcon: Icons.person,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                //phoneNumber
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Phone mustn\'t be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.phone,
                                  controller: phoneNumberController,
                                  hintText: 'phone number',
                                  labelText: 'Number',
                                  prefixIcon: IconBroken.call,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                //fullName
                                CustomTextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Full Name mustn\'t be empty';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.text,
                                  controller: fullNameController,
                                  hintText: 'full name',
                                  labelText: 'Full Name',
                                  prefixIcon: IconBroken.user,
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                // Login Button
                                ConditionalBuilder(
                                    condition: state is! LoadingLoginState,
                                    builder: (context) => CustomButton(
                                        child: const Text(
                                          'Next',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            // cubit.userRegister(
                                            //     email: emailController.text,
                                            //     password: passwordController.text,
                                            //     phoneNumber: phoneNumberController.text,
                                            //     username: userNameController.text,
                                            //     fullName: fullNameController.text);
                                            navigateTo(
                                                context: context,
                                                widget: PasswordScreen(
                                                    email: emailController.text,
                                                    phoneNumber:
                                                        phoneNumberController
                                                            .text,
                                                    username:
                                                        userNameController.text,
                                                    fullName: fullNameController
                                                        .text));
                                          }
                                        },
                                        width: double.infinity,
                                        backgroundColor: Colors.teal,
                                        height: 50,
                                        textColor: Colors.white),
                                    fallback: (context) => const Center(
                                          child: CircularProgressIndicator(),
                                        )),
                                const SizedBox(
                                  height: 8.0,
                                ),
                              ],
                            ),
                          )),
                      const SizedBox(
                        height: 16.0,
                      ),
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
