
import 'package:flutter/material.dart';
import 'package:weath/activity/home.dart';
import 'package:weath/activity/loading.dart';





void main(){
  runApp(MaterialApp(

    routes: {
      "/" : (context) => Loading(),
      "/home":(context) => Home(),
      "/Loading": (context) => Loading(),

    },

  ));
}