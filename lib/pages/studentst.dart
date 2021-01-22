import 'package:flutter/material.dart';


class Studentst extends StatefulWidget {
  @override
  _StudentstState createState() => _StudentstState();
}

class _StudentstState extends State<Studentst> {

  Map args = {};
  List data;
  Map lesson = {};
  Widget CardTemplate(data) {}

  @override
  void initState() {

    super.initState();
  }

  String lv_loc(){
    var now = new DateTime.now();
    now=now.add(new Duration(days:1));
    String lv='';
    switch(now.weekday){
      case 1:{
        lv+='Pirmdiena';
      }
      break;
      case 2:{
        lv+='Otrdiena';
      }
      break;
      case 3:{
        lv+='Trešdiena';
      }
      break;
      case 4:{
        lv+='Ceturdiena';
      }
      break;
      case 5:{
        lv+='Piektdiena';
      }
      break;
      case 6:{
        lv+='Sestdiena';
      }
      break;
      case 7:{
        lv+='Svētdiena';
      }
      break;

    }
    lv=lv+', '+now.year.toString()+'. gada ';

    lv=lv+now.day.toString()+'. ';
    switch(now.weekday) {
      case(1):
        {
          lv+='Janvāris';
        }
        break;
      case(2):
        {
          lv+='Februāris';
        }
        break;
      case(3):
        {
          lv+='Marts';
        }
        break;
      case(4):
        {
          lv+='Aprīls';
        }
        break;
      case(5):
        {
          lv+='Maijs';
        }
        break;
      case(6):
        {
          lv+='Jūnijs';
        }
        break;
      case(7):
        {
          lv+='Jūlijs';
        }
        break;
      case(8):
        {
          lv+='Augusts';
        }
        break;
      case(9):
        {
          lv+='Septembris';
        }
        break;
      case(10):
        {
          lv+='Oktobris';
        }
        break;
      case(11):
        {
          lv+='Novembris';
        }
        break;
      case(12):
        {
          lv+='Decembris';
        }
        break;
    }

    return lv;
  }

  @override
  Widget build(BuildContext context) {

    args = ModalRoute.of(context).settings.arguments;
    data = args['values_tom'];

    String datums=lv_loc();


    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
          title: Text('Stundu Izmaiņas',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 0, 0, 80),
          leading: Container(
            margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0),
            child: ImageIcon(
              AssetImage('assets/ic_white_logo.png'),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.wifi_protected_setup),
              tooltip: 'Teacher view',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/t', arguments: {
                  'values': args['values'],
                  'values_tom':args['values_tom'],
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_back),
              tooltip: 'Teacher view',
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/st', arguments: {
                  'values': args['values'],
                  'values_tom':args['values_tom'],
                });
              },
            ),
          ]),
      body: Scrollbar(
        child: ListView.builder(
          itemCount: data.length+1,
          itemBuilder: (context, index) {
            if(index==0){
              return Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,

                  children: <Widget>[
                    Text(
                      'Rīt, ',

                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(

                      datums,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              );
            }else{


              final theme = Theme.of(context).copyWith(dividerColor: Colors.transparent); //new
              lesson = data[index-1];

              return Card(
                margin: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0),
                elevation: 3.0,
                child: Container(
                  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10),
                  child:
                  Theme(
                    data:theme, //new

                    child: ExpansionTile(

                      expandedCrossAxisAlignment: CrossAxisAlignment.start,

                      title: Container(
                        padding: EdgeInsets.fromLTRB(10.0, 10.0, 26.0, 10.0),
                        child: Text(
                          lesson['userId'].toString() + '.A ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black38,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      children: <Widget>[

                        Divider(color: Colors.black12, thickness: 1.5,),
                        Container(

                          padding: EdgeInsets.fromLTRB(26.0, 5.0, 26.0, 30),
                          child: Text('Piezīme: ',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Divider(color: Colors.black12, thickness: 1.5,),
                        Container(
                          padding: EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 10),
                          child: Text(
                            'Telpa: '+lesson['title'],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black54,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Divider(color: Colors.black12, thickness: 1.5,),
                        Container(
                          padding: EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 10),
                          child: Text('Skolotājs/a: '+lesson['completed'].toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                              )),
                        ),
                        Divider(color: Colors.black12, thickness: 1.5,),
                        Container(
                          padding: EdgeInsets.fromLTRB(26.0, 10.0, 26.0, 10),
                          child: Text('Stunda/as: '+lesson['id'].toString(),
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 14,
                              )),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }},
        ),
      ),
    );}
}




