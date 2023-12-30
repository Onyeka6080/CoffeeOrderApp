import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perfectbrewlist/PAGES/AUTHENTICATE/AUTHENTICATE.dart';
import 'package:provider/provider.dart';

import '../Model/User.dart';
import 'HOME/HOME.dart';

class WRAPPER extends StatelessWidget {
  const WRAPPER({super.key});

  @override
  Widget build(BuildContext context) {
    final brewzz =Provider.of<User5?>(context);

    if(brewzz==null){
      return AUTHENTICATE();

    }else{
      return HOME();

    }
    }
}
