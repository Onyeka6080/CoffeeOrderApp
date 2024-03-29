import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.brown,
      body:Center(
        child:SpinKitRotatingCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ) ,
    );
  }
}
