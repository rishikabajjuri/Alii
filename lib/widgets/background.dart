import 'package:alii/login/login_verification.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Background extends StatelessWidget {
  final Widget child;

  const Background({Key key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Positioned(
            right: 0,
            top: 30,
            child: Container(
              height: 270,
              width: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                    bottomLeft: Radius.circular(200)),
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topCenter,
                  colors: [Colors.blueAccent, Colors.deepPurple],
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            bottom: 30,
            child: Container(
              height: 270,
              width: 145,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(200),
                    bottomRight: Radius.circular(200)),
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomLeft,
                  end: FractionalOffset.topCenter,
                  colors: [Colors.blueAccent.shade700, Colors.deepPurple],
                ),
              ),
            ),
          ),
          child,
        ],
      ),
    );
  }
}
