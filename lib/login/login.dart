import 'package:alii/widgets/background.dart';
import 'package:alii/widgets/modern_buttom.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toast/toast.dart';

import 'login_verification.dart';

class Login extends StatelessWidget {
  final controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Form(
      key: formKey,
      child: Background(
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
                      'WELCOME',
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: 'Nunito_Sans',
                          fontSize: 36,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 50),
                    TextFormField(
                      validator: (value) => value.trim().length == 10
                          ? null
                          : 'Please enter a 10 digit mobile number',
                      controller: controller,
                      //controller: controller,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        WhitelistingTextInputFormatter.digitsOnly
                      ],
                      decoration: InputDecoration(
                          labelStyle: textTheme.caption.copyWith(
                              fontSize: 14, color: Colors.grey.shade800),
                          suffixIcon: Icon(
                            Icons.phone_android,
                            color: Colors.grey.shade800,
                          ),
                          labelText: 'Enter mobile number'),
                    ),
                    SizedBox(height: 60),
                    ModernButton(onTap: () {
                      if (!formKey.currentState.validate()) return;
                      final _auth = FirebaseAuth.instance;
                      _auth.verifyPhoneNumber(
                          phoneNumber: '+91${controller.text}',
                          timeout: Duration(seconds: 10),
                          verificationCompleted:
                              (AuthCredential credentials) async {
                            print('verificationCompleted');
                            final auth = FirebaseAuth.instance;
                          },
                          verificationFailed: (ex) {
                            print(ex.message);
                            Toast.show(ex.message, context,duration: 3);

                          },
                          codeSent: null,
                          codeAutoRetrievalTimeout: null);
                    }

//                          LoginVerification.open(context),
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
