import 'package:flutter/material.dart';


var deco=InputDecoration(
    enabledBorder:OutlineInputBorder(
        borderSide:BorderSide(
            color:Colors.greenAccent,
            width:3.0
        )
    ),
    focusedBorder:OutlineInputBorder(
        borderSide:BorderSide(
            color:Colors.pink,
            width:3.0
        )
    ),
    fillColor:Colors.white,
    filled:true
);