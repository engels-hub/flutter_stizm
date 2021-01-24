import 'dart:ui';

import 'package:flutter/material.dart';
import '../service/get.dart';
import '../service/getTomorrow.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getd() async{
    getJson table = getJson(tryurl: 'https://jsonplaceholder.typicode.com/todos');
    getJsonT ttable = getJsonT(tryurl: 'https://jsonplaceholder.typicode.com/todos');
    await Future.wait([table.getData(), ttable.getData()]);
    bool pr=!(!(!table.error && !ttable.error) || !(!table.conerr && !ttable.conerr));
    print(pr.toString());

    if (!(table.conerr || ttable.conerr)) {
      if (!(table.error || ttable.error)) {
        Navigator.pushReplacementNamed(context, '/st', arguments: {
          'values': table.values,
          //'values_tom': ttable.values,
          'today_data':table.datatest,
        }); //if on local_preference '/t' or '/st'
      } else {
        //output warning
        Navigator.pushReplacementNamed(context, '/err', arguments: {
          'err': '400',
        });
      }
    }else{
      Navigator.pushReplacementNamed(context, '/err', arguments: {
        'err': '404',
      });
    }
}

  @override
  void initState() {
    getd();
    super.initState();

    print('load initstate ran!');


  }

  @override
  Widget build(BuildContext context) {

      return Scaffold(
          body: Center(
              child: FractionallySizedBox(
                  widthFactor: 0.4,
                  child: Image.asset(
                    'assets/ic_white_logo.png',
                    fit: BoxFit.fitWidth,
                  )
              )
          ),
          backgroundColor: Color.fromARGB(255, 0, 0, 80)
      );


    }
  }





