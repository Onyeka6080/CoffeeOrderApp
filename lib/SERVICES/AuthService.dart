import 'package:firebase_auth/firebase_auth.dart';

import '../Model/User.dart';
import 'FirebaseFirestore.dart';


class Authservice {

  FirebaseAuth _auth = FirebaseAuth.instance;

  CustumUser(User? pi){
    User5 ki;
    return pi!=null?User5(uid:pi.uid):null;

  }

  Stream<User5?> authstream() {
    return _auth.authStateChanges()
    .map((User? p) => (CustumUser(p)));
  }

  Future SIGNANONYMOUSLY() async {
    UserCredential result = await _auth.signInAnonymously();
    User? user = result.user;
    return user?.uid;
  }

  Future SIGNOUT() async {
    await _auth.signOut();
  }

  // SIGN IN WITH EMAIL AND PASSWORD
  Future SIGNEMAILANDPASSWORD(String Email, String Password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: Email, password: Password);
       User? user =result.user;
       return user!.uid;
      print(result);
    }catch(e){
      e.toString();
      return null;
    }
  }
  Future CREATEEMAILANDPASSWORD(String Email, String Password) async{
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: Email, password: Password);
      print('////////////////////////////////////////////////1');
      print(result);
      User? user =result.user;
      dynamic result1= await Database(uid:user!.uid).updatedata('kachimoneay', '0', 100);
      print('////////////////////////////////////////////////2');
      print(result1);
      return user!.uid;

    }catch(e){
      e.toString();
      return null;
    }
  }
}









