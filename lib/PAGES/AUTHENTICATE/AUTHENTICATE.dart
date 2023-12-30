import 'package:flutter/material.dart';
import 'package:perfectbrewlist/PAGES/AUTHENTICATE/REGISTER.dart';
import 'package:perfectbrewlist/PAGES/AUTHENTICATE/SIGIN.dart';

import '../../SERVICES/AuthService.dart';

class AUTHENTICATE extends StatefulWidget {
  const AUTHENTICATE({super.key});

  @override
  State<AUTHENTICATE> createState() => _AUTHENTICATEState();
}

class _AUTHENTICATEState extends State<AUTHENTICATE> {
  bool toogle=false;

  TOGGLE(){
    setState(() {
      toogle=!toogle;
    });
  }

  @override
  Widget build(BuildContext context) {
    if(toogle){
      return SIGIN(tick: TOGGLE);
    }else{
      return REGISTER(tick:TOGGLE);
    }
  }
}
