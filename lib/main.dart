import 'package:flutter/material.dart';
import 'package:flutter1/pages/error.dart';
import 'package:flutter1/pages/loading.dart';
import 'package:flutter1/pages/students.dart';
import 'package:flutter1/pages/studentst.dart';
import 'package:flutter1/pages/teacher.dart';
import 'package:flutter1/pages/teachert.dart';


void main() {
  runApp(
      MaterialApp(
            initialRoute: '/',
            routes:{
              '/': (context) => Loading(),
              '/st': (context) => Students(),
              '/t': (context) => Teacher(),
              '/stt': (context) => Studentst(),
              '/tt': (context) => Teachert(),
              '/err': (context) => Page404(),
            },
      color: Color.fromARGB(255,0,0,80),
        title: 'Stundu Izmaiņas',
        ),

      );
}





