import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:perfectbrewlist/Model/querystreamclass.dart';
import 'package:provider/provider.dart';
import '../../SERVICES/AuthService.dart';
import '../../SERVICES/FirebaseFirestore.dart';
import 'Brewxx.dart';
import 'Settingsform.dart';


class HOME extends StatefulWidget {
  const HOME({super.key});

  @override
  State<HOME> createState() => _HOMEState();
}

class _HOMEState extends State<HOME> {
  Authservice _auth =Authservice();
  @override
  Widget build(BuildContext context) {
    void showbottomsheet(){
      showModalBottomSheet(context: context, builder:(c){
        return Container(
          padding:EdgeInsets.symmetric(vertical:30,horizontal:59),
          child:Formsetting(),
        );
      });

    }
    return StreamProvider<List<QS>>.value(
      value: Database(uid: '').wq(),
      initialData: [],
      child: Scaffold(
        backgroundColor:Colors.brown,
        appBar:AppBar(
          title:Text('welcome tobrew1 crew'),
          backgroundColor:Colors.brown[900],
          actions: [
            ElevatedButton.icon(
                onPressed: (){
                  _auth.SIGNOUT();
                },
                icon:Icon(
                  Icons.person
                ),
                label:Text('logout'),
              style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.brown[900])
              ),),
            ElevatedButton.icon(
              onPressed: (){
                showbottomsheet();
              },
              icon:Icon(
                  Icons.settings
              ),
              label:Text('Settings'),
              style:ButtonStyle(
                  backgroundColor:MaterialStateProperty.all(Colors.brown[900])
              ),),

          ],
        ),
        body:Brewxx(),

      ),
    );
  }
}
