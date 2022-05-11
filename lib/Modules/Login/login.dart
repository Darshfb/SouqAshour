import 'package:ashour/Layout/ashour_layout.dart';
import 'package:ashour/Modules/Login/cubit/login_cubit.dart';
import 'package:ashour/Modules/Login/cubit/login_states.dart';
import 'package:ashour/Modules/Register/register.dart';
import 'package:ashour/Shared/Local/cache_helper.dart';
import 'package:ashour/Shared/component/component.dart';
import 'package:ashour/Shared/constant/const.dart';
import 'package:ashour/Shared/styles/icon_broken.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is SuccessLoginState) {
            CacheHelper.saveData(key: '$TOKEN', value: state.model.token.toString())
                .then((value) {
              showToast(
                  text: 'User Login Successfully', state: ToastStates.SUCCESS);
              navigateAndFinish(context: context, widget: AshourLayout());
              print(value.toString());
            }).catchError((error) {
              print('error when save data $error');
            });

          } else if(state is ErrorLoginState){
            showToast(
                text: 'Error when logging', state: ToastStates.ERROR);
          }
        },
        builder: (BuildContext context, Object? state) {
          var cubit = LoginCubit.get(context);
          return Scaffold(
            body: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Container(
                          alignment: AlignmentDirectional.center,
                          child: Image.asset(
                            'assets/images/img.png',
                            height: 150,
                            width: 150,
                          )),
                      Text(
                        'LOGIN',
                        style: Theme.of(context).textTheme.headline3,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25.0)),
                          elevation: 5,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 25.0,
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
                                  hintText: 'Your Email',
                                  labelText: 'Email',
                                  prefixIcon: IconBroken.user,
                                ),
                                const SizedBox(
                                  height: 16.0,
                                ),
                                // password text form field
                                CustomTextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return 'Password mustn\'t be empty';
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.visiblePassword,
                                    controller: passwordController,
                                    hintText: 'Your password',
                                    labelText: 'Password',
                                    obscureText: cubit.isObscure,
                                    prefixIcon: IconBroken.password,
                                    suffixIcon: cubit.visibilityIcon,
                                    pressedSuffixIcon: () {
                                      cubit.loginChangeVisibility();
                                    }),
                                //Forget password
                                Container(
                                  alignment: Alignment.bottomRight,
                                  padding: const EdgeInsetsDirectional.only(
                                      bottom: 15.0),
                                  child: CustomTextButton(
                                      onPressed: () {},
                                      text: 'Forget password?'),
                                ),
                                // Login Button
                                ConditionalBuilder(
                                    condition: state is! LoadingLoginState,
                                    builder: (context) => CustomButton(
                                        child: const Text(
                                          'LOGIN',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16),
                                        ),
                                        onPressed: () {
                                          if (_formKey.currentState!
                                              .validate()) {
                                            cubit.userLogin(
                                                email: emailController.text,
                                                password:
                                                    passwordController.text);
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
                                  height: 16.0,
                                ),
                              ],
                            ),
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Don\'t have an account?'),
                          CustomTextButton(
                              onPressed: () {
                                navigateTo(widget: RegisterScreen(), context: context);
                              }, text: 'Register now'),
                        ],
                      ),
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
