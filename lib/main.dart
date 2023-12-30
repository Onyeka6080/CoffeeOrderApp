import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:perfectbrewlist/PAGES/WRAPPER.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'Model/User.dart';
import 'SERVICES/AuthService.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
      StreamProvider<User5?>.value(
        value: Authservice().authstream(),
        initialData: null,
        child: MaterialApp(
    home: WRAPPER(),
  ),
      ));
  }

