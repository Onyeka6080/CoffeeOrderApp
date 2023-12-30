import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:perfectbrewlist/Model/querystreamclass.dart';
import 'package:provider/provider.dart';

import '../AUTHENTICATE/AUTHENTICATE.dart';


class Brewxx extends StatefulWidget {
  const Brewxx({super.key});

  @override
  State<Brewxx> createState() => _BrewxxState();
}

class _BrewxxState extends State<Brewxx> {
  @override
  Widget build(BuildContext context) {
    final brewd =Provider.of<List<QS>>(context);
    if(brewd!=null){
      for(var iu in brewd){
        print(iu.Name);
        print(iu.Sugar);
        print(iu.Strenght);
      }
    }
    return brewd!=null ?

       Column(
        children:brewd.map((e){
          return Card(
            margin:EdgeInsets.fromLTRB(20, 20, 20, 0),
            child:ListTile(
              leading:CircleAvatar(
                backgroundColor:Colors.brown[e.Strenght],
              ),
              title:Text(e.Name),
              subtitle:Text(e.Sugar),
            ),
          );
        }).toList(),
      ):

  AUTHENTICATE();


  }
}
