import 'package:flutter/material.dart';
import 'package:flutter1/pages/error.dart';
import 'package:flutter1/pages/loading.dart';
import 'package:flutter1/pages/students.dart';
import 'package:flutter1/pages/studentst.dart';
import 'package:flutter1/pages/teacher.dart';
import 'package:flutter1/pages/teachert.dart';
import 'package:flutter1/service/style.dart';
import 'package:theme_provider/theme_provider.dart';

void main() {
  runApp(
      ThemeProvider(
        themes: [

          AppTheme(
            description: 'light',
            id: "light_theme1", // Id(or name) of the theme(Has to be unique)
            data: ThemeData(  // Real theme data
              scaffoldBackgroundColor: Colors.grey[50],
              dividerTheme: DividerThemeData(
                color: Colors.grey[200],
                thickness: 1.0,
              ),
              primaryColor: Color.fromARGB(255, 0, 0, 80),
              accentColor: Color.fromARGB(255, 0, 0, 200),
              appBarTheme: AppBarTheme(
                textTheme: TextTheme(headline6: AppBarStyle),
              ),
              textTheme: TextTheme(
                headline6: TitleTextStyle,
                bodyText2: BodyTextStyle,
              ),
            ),
          ),// This is standard light theme (id is default_light_theme)
          //AppTheme.dark(),
          AppTheme(
            description: 'dark',
            id: "dark_theme1", // Id(or name) of the theme(Has to be unique)
            data: ThemeData(  // Real theme data
              scaffoldBackgroundColor: Color(0xff303030),
              dividerTheme: DividerThemeData(
                color: Colors.grey[700],
                thickness: 1.0,
              ),
              primaryColor: Colors.grey[900],
              cardColor: Colors.grey[800],
              accentColor: Color.fromARGB(255, 0, 0, 200),
              appBarTheme: AppBarTheme(
                textTheme: TextTheme(headline6: AppBarStyle),
              ),
              textTheme: TextTheme(
                headline6: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 20.0,
                  color: Colors.white60,
                ),
                bodyText2: TextStyle(
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),// This is standard dark theme (id is default_dark_theme)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
              initialRoute: '/',
              routes:{
                '/': (context) => ThemeConsumer(child: Loading()),
                '/st': (context) => ThemeConsumer(child: Students()),
                '/t': (context) => ThemeConsumer(child: Teacher()),
                '/stt': (context) => ThemeConsumer(child: Studentst()),
                '/tt': (context) => ThemeConsumer(child: Teachert()),
                '/err': (context) => ThemeConsumer(child: Page404()),
              },
        color: Color.fromARGB(255,0,0,80),
          title: 'Stundu Izmaiņas',
          /*theme: ThemeData(
            scaffoldBackgroundColor: Colors.grey[50],
            primaryColor: Color.fromARGB(255, 0, 0, 80),
            accentColor: Color.fromARGB(255, 0, 0, 200),
            appBarTheme: AppBarTheme(
              textTheme: TextTheme(headline6: AppBarStyle),
            ),
              textTheme: TextTheme(
                headline6: TitleTextStyle,
                bodyText2: BodyTextStyle,
              ),
          ),*/
          ),
      ),

      );
}





