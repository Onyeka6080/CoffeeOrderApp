import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:perfectbrewlist/SERVICES/FirebaseFirestore.dart';
import 'package:perfectbrewlist/SHARED/Loading.dart';
import 'package:provider/provider.dart';
import '../../Model/User.dart';
import '../../SHARED/DECORATION.dart';

class Formsetting extends StatefulWidget {
  const Formsetting({super.key});

  @override
  State<Formsetting> createState() => _FormsettingState();
}

class _FormsettingState extends State<Formsetting> {
  var formkey =GlobalKey<FormState>();
  List<String> sugars=['0','1','2 ','3','4'];

  late String currentname="";
  late String currentsugar="0";
  late int currentstrength=100;

  @override
  Widget build(BuildContext context) {
    final brewzz =Provider.of<User5?>(context);
    return StreamBuilder<DocumentSnapshot>(
      stream:Database(uid: brewzz!.uid).hmm(),
      builder: (context, snapsho) {
        print(snapsho.data?.data());
        if(snapsho.hasData){
          return Form(
              key:formkey,
              child:Column(
                children: [
                  Text('Update your brew list'),
                  SizedBox(height:10),
                  TextFormField(
                    initialValue:snapsho.data?.get('name'),
                    decoration:deco,
                    validator:(tr){
                      return tr!.isEmpty? 'NAME':null;
                    },
                    onChanged:(tr){
                      setState(() {
                        currentname=tr;
                      });
                    },
                  ),
                  SizedBox(height:10),
                  DropdownButtonFormField(
                      value:currentsugar,
                      decoration: deco,
                      items:sugars.map((e){

                        return DropdownMenuItem(
                          value: e,
                          child: Text('Takes  $e sugars'),
                        );

                      }).toList(),
                      onChanged: (val2){
                        setState(() {
                          currentsugar=val2! ;
                        });
                      }),
                  SizedBox(height:10),
                  Slider(
                      value:(currentstrength).toDouble(),
                      activeColor:Colors.brown,
                      inactiveColor:Colors.blue,
                      min:100.0,
                      max:900.0,
                      divisions:8,
                      onChanged:(val){
                        setState(() {
                          currentstrength=val.toInt();
                        });
                      }),
                  SizedBox(height:10),
                  ElevatedButton(
                    onPressed:() async{
                      if(formkey.currentState!.validate()){
                      await Database(uid:brewzz.uid ).updatedata(
                          currentname, currentsugar, currentstrength);
                      }
                    },
                    child: Text('UPDATE'),
                    style:ButtonStyle(
                        backgroundColor:MaterialStateProperty.all(Colors.orange)
                    ),
                  )
                ],
              )
          );
        }else{
          return Loading();
        }
      }
    );
  }
}
