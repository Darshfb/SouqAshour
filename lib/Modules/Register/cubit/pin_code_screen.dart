import 'package:ashour/Shared/component/component.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class PinCode extends StatelessWidget {
  const PinCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade300,
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'verification',
              style: Theme.of(context).textTheme.displaySmall,
            ),
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Text(
              'Enter the code sent to the Email',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              'Emailasda@gmail.com',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(
              height: 40,
            ),
            Pinput(
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              validator: (s) {
                return s == '2222' ? null : 'Pin is incorrect';
              },
              pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
              showCursor: true,
              onCompleted: (pin) => print(pin),
            ),
          ],
        ),
      ),
    );
  }
}
