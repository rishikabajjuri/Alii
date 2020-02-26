import 'package:alii/widgets/background.dart';
import 'package:alii/widgets/modern_buttom.dart';
import 'package:alii/widgets/otpFields.dart';
import 'package:flutter/material.dart';

class LoginVerification extends StatefulWidget {
  static open(context) => Navigator.push(
      context, MaterialPageRoute(builder: (context) => LoginVerification()));

  @override
  _LoginVerificationState createState() => _LoginVerificationState();
}

class _LoginVerificationState extends State<LoginVerification> {
  final formKey = GlobalKey<FormState>();

  final controller = List<TextEditingController>();
  final List<FocusNode> focusNodes = List<FocusNode>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 12),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30)),
              elevation: 20,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      'Verification Code',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Nunito_Sans',
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 15),
                    Text(
                      'Please verify the OTP sent to your number',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.caption.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 13.5,
                            color: Colors.black87,
                          ),
                    ),
                    SizedBox(height: 45),
                    OtpFields(
                      length: 6,
                      formKey: formKey,
                      controllers: controller,
                    ),
                    SizedBox(height: 50),
                    ModernButton(
                      onTap: () => Navigator.pop(context),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
