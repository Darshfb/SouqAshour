import 'package:ashour/Shared/styles/icon_broken.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:pinput/pinput.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

Widget CustomTextFormField({
  required FormFieldValidator<String> validator,
  required TextInputType keyboardType,
  required TextEditingController controller,
  required String hintText,
  required String labelText,
  IconData? prefixIcon,
  IconData? suffixIcon,
  ValueChanged<String>? onSubmit,
  bool obscureText = false,
  VoidCallback? pressedSuffixIcon,
  bool isDense = true,
  ValueChanged<String>? onChanged,
  GestureTapCallback? onTap,
}) =>
    TextFormField(
      onTap: onTap,
      validator: validator,
      onFieldSubmitted: onSubmit,
      keyboardType: keyboardType,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        isDense: isDense,
        hintText: hintText,
        labelText: labelText,
        prefixIcon: Icon(prefixIcon),
        suffixIcon:
            IconButton(onPressed: pressedSuffixIcon, icon: Icon(suffixIcon)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        focusedErrorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        focusedBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        errorBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        disabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        enabledBorder:
            OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
      ),
    );

Widget CustomTextButton(
        {required VoidCallback onPressed, required String text}) =>
    TextButton(onPressed: onPressed, child: Text(text));

Widget CustomButton({
  required VoidCallback onPressed,
  required Widget child,
  ShapeBorder? shape,
  double? elevation,
  double? height,
  double? width,
  EdgeInsetsGeometry? padding,
  Color? textColor,
  Color? backgroundColor,
}) =>
    MaterialButton(
      onPressed: onPressed,
      child: child,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: elevation,
      height: height,
      padding: padding,
      color: backgroundColor,
      minWidth: width,
      textColor: textColor,
    );

void navigateTo({required BuildContext context, required Widget widget}) =>
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));

void navigateAndFinish(
        {required BuildContext context, required Widget widget}) =>
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) {
      return widget;
    }));

void showToast({
  required String text,
  required ToastStates state,
}) {
  Fluttertoast.showToast(
      msg: text,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0);
}

enum ToastStates { SUCCESS, ERROR, WARNING }

Color? chooseToastColor(ToastStates state) {
  Color? color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(
      fontSize: 20,
      color: Color.fromRGBO(30, 60, 87, 1),
      fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: const Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme.copyWith(
  decoration: defaultPinTheme.decoration!.copyWith(
    color: const Color.fromRGBO(234, 239, 243, 1),
  ),
);

Widget CustomPorgressIndicator() => const Center(
      child: CircularProgressIndicator.adaptive(
        backgroundColor: Colors.white,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    );

Widget CustomPullToRefresh(
        {required Widget child,
        required Future<void> Function() onRefresh,
        required GlobalKey<LiquidPullToRefreshState> refreshIndicatorKey}) =>
    LiquidPullToRefresh(
      color: Colors.green,
      animSpeedFactor: 5,
      key: refreshIndicatorKey,
      onRefresh: onRefresh,
      child: child,
    );

// to work without any padding for the child
Widget CustomPullToRefreshAndLoading({
  required RefreshController controller,
  required VoidCallback? onRefresh,
  required VoidCallback? onLoad,
  required Widget child,
}) {
  return SmartRefresher(
    enablePullUp: true,
    enablePullDown: true,
    controller: controller,
    header: const WaterDropHeader(),
    footer: CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;
        if (mode == LoadStatus.loading) {
          body = const CupertinoActivityIndicator();
        } else if (mode == LoadStatus.idle) {
          body = const Text("No More");
        } else if (mode == LoadStatus.failed) {
          body = const Text("Load Failed!Click retry!");
        } else if (mode == LoadStatus.canLoading) {
          body = const Text("release to load more");
        } else if (mode == LoadStatus.noMore) {
          body = const Text("No more data");
        } else {
          body = const Text("Load more");
        }
        return SizedBox(
          height: 55.0,
          child: Center(child: body),
        );
      },
    ),
    onRefresh: onRefresh,
    onLoading: onLoad,
    child: child,
  );
}
