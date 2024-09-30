// import 'package:dqiqa/widgets/fields/otp_theme.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:pinput/pinput.dart';



// class OtpFieldWidget extends StatelessWidget {
//   const OtpFieldWidget({super.key, required this.otpFunction, this.codeController});
//   final void Function(String)? otpFunction;
//   final TextEditingController? codeController;

//   @override
//   Widget build(BuildContext context) {
//     return Pinput(
//       androidSmsAutofillMethod: AndroidSmsAutofillMethod.smsRetrieverApi,
//       length: 6,
//       controller:codeController,
//       defaultPinTheme: defaultPinTheme,
//       focusedPinTheme: defaultPinTheme,
//       submittedPinTheme: defaultPinTheme,
//       pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
//       inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//       showCursor: true,
//       onCompleted: otpFunction,
//     );
//   }
// }
