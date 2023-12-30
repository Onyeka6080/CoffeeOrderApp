import 'package:flutter/material.dart';
import 'package:perfectbrewlist/SHARED/Loading.dart';

import '../../SERVICES/AuthService.dart';
import '../../SHARED/DECORATION.dart';


class SIGIN extends StatefulWidget {
   Function() tick;
  SIGIN({required this.tick});

  @override
  State<SIGIN> createState() => _SIGINState();
}

class _SIGINState extends State<SIGIN> {
  Authservice _auth =Authservice();
  var formkey =GlobalKey<FormState>();
late  String Email = '';
  late String Password='';
   String error ='';
   bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading?Loading(): Scaffold(
      backgroundColor:Colors.brown[500],
      appBar:AppBar(
        title:Text('SIGN IN TO BREW  CREW'),
        backgroundColor:Colors.brown[700],
        actions: [
          ElevatedButton.icon(
            onPressed:widget.tick,
            icon:Icon(
                Icons.person
            ),
            label:Text('REGISTER'),
            style:ButtonStyle(
                backgroundColor:MaterialStateProperty.all(Colors.brown[900])
            ),),
        ],
      ),
      body:Padding(
        padding: const EdgeInsets.symmetric(vertical:90,horizontal: 50),
        child: Form(
          key:formkey,
          child: Column(
            children: [
              TextFormField(
                decoration:deco.copyWith(hintText:'EMAIL ADDRESS'),
                onChanged:(val){
                  setState(() {
                    Email =val;
                  });
                },
                validator:(val){
                  return val!.isEmpty ? 'Enter your email address':null;
                },
              ),
              SizedBox(height: 10,),
              TextFormField(
                decoration:deco.copyWith(hintText:'password'),
                onChanged:(val){
                 setState(() {
                   Password=val;
                 });
                },
                validator: (val){
                  return val!.length<6 ? 'Enter Password not less than 6':null;
                },
              ),
              ElevatedButton(
                onPressed:() async{
                  if(formkey.currentState!.validate()){
                    if(mounted){
                      loading=true;
                    }
                   dynamic result= await _auth.SIGNEMAILANDPASSWORD(Email, Password);
                   if(result==null){
                     if(mounted){
                       setState(() {
                         loading=false;
                         error='enter a valid';
                       });
                     }

                   }
                  }

                },
                child: Text('SIGN IN'),
                style:ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.orange)
                ),
              ),
              SizedBox(height: 10),
              Text('$error')
            ],
          ),
        ),
      ),
    );
  }
}
