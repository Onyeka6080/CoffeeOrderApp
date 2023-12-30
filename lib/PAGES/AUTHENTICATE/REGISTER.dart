import 'package:flutter/material.dart';
import 'package:perfectbrewlist/SHARED/Loading.dart';

import '../../SERVICES/AuthService.dart';
import '../../SHARED/DECORATION.dart';

class REGISTER extends StatefulWidget {
   Function ()tick;
  REGISTER({required this.tick});

  @override
  State<REGISTER> createState() => _REGISTERState();
}

class _REGISTERState extends State<REGISTER> {
  Authservice _auth =Authservice();
  var formkey =GlobalKey<FormState>();
  String Email = '';
  String Password='';
  bool loading=false;
  @override
  Widget build(BuildContext context) {
    return loading?  Loading():Scaffold(
      backgroundColor:Colors.brown[700],
      appBar:AppBar(
        title:Text('SIGN UP  TO  BREW CREW'),
        backgroundColor:Colors.brown[900],
        actions: [
          ElevatedButton.icon(
            onPressed: widget.tick,
            icon:Icon(
                Icons.person
            ),
            label:Text('SIGN IN'),
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
                      setState(() {
                        loading=true;
                      });
                    }
                    dynamic result= await _auth.CREATEEMAILANDPASSWORD(Email, Password);
                    if(result==null){
                      if(mounted){
                        setState(() {
                          loading=false;
                        });
                      }
                    }
                  }
                },
                child: Text('SIGNUP'),
                style:ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(Colors.orange)
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
