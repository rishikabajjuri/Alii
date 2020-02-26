import 'package:flutter/material.dart';

import '../login/login_verification.dart';

class ModernButton extends StatelessWidget {
  final Function onTap;

  const ModernButton({Key key, this.onTap}) : super(key: key);

  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => onTap(),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                  colors: [Colors.blueAccent.shade700, Colors.deepPurple])),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Text(
              'CONTINUE',
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Nunito_Sans',
                fontSize: 15,
              ),
            ),
          ),
        ));
  }
}
