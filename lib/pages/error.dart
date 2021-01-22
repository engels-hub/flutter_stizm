import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:system_settings/system_settings.dart';
class Page404 extends StatefulWidget {
  @override
  _Page404State createState() => _Page404State();
}

class _Page404State extends State<Page404> {


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context).settings.arguments as Map;
    String errorcode=args['err'];
    print(errorcode);
    if(errorcode=='400') {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 80),
        body: Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          margin: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('400',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 120,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    'Izskatās, ka Jūsu ierīcei nav Internet pieslēguma.',
                    style: TextStyle(

                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    'Interneta pieslēgumu vajag, lai lejupielādēt mūsu mīļās Stundu Izmaiņas.',
                    style: TextStyle(

                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text('Pārbaudiet pieslēgumu un mēģiniet vēlreiz.',
                    style: TextStyle(

                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                      child: Text("Pārlādēt"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/', arguments: {
                        });
                      }

                  ),
                  ElevatedButton(
                    child: Text("Atvērt iestātījumus"),
                    onPressed: SystemSettings.system,
                  )
                ],
              )
          ),
        ),
      );
    }else{
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 0, 0, 80),
        body: Container(
          padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
          child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('404',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent,
                      fontSize: 120,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    'Izskatās, ka mēs nevaram pieslēgties Ģimnāzijas Stundu Izmaiņu serveriem.',
                    style: TextStyle(

                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),

                  Text('Pārbaudiet pieslēgumu un mēģiniet vēlreiz.',
                    style: TextStyle(

                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  ElevatedButton(
                      child: Text("Pārlādēt"),
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, '/', arguments: {
                        });
                      }

                  ),

                ],
              )
          ),
        ),
      );
    }
  }



}

// TODO: fetch data from json placeholder         DONE
// TODO: implement loading screen                 50%
// TODO: implement json data saving locally       DONE
// TODO: implement user data saving
// TODO: make normal design
// TODO: fetch StIzm jsons
// TODO: debug goes brrr...
// TODO: PD stuff