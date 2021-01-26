import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../service/get.dart';
import '../service/getTomorrow.dart';

class Teachert extends StatefulWidget {
  @override
  _TeachertState createState() => _TeachertState();
}

class _TeachertState extends State<Teachert> {
  Map args = {};
  Map data;
  Map lesson = {};
  bool dark_theme = false;
  var buttonIcon = Icons.bedtime;
  GlobalKey<RefreshIndicatorState> refreshKey;
  @override
  void initState() {
    super.initState();
    refreshKey=GlobalKey<RefreshIndicatorState>();
  }

  String lv_loc(String DayofWeek, int timestamp) {
    var date =
    DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);

    String lv = '';
    switch (DayofWeek) {
      case "Monday":
        {
          lv += 'Pirmdien';
        }
        break;
      case "Tuesday":
        {
          lv += 'Otrdien';
        }
        break;
      case "Wednesday":
        {
          lv += 'Trešdien';
        }
        break;
      case "Thursday":
        {
          lv += 'Ceturdien';
        }
        break;
      case "Friday":
        {
          lv += 'Piektdien';
        }
        break;
      case "Saturday":
        {
          lv += 'Sestdien';
        }
        break;
      case "Sunday":
        {
          lv += 'Svētdien';
        }
        break;
    }
    lv = lv + ', ' + date.year.toString() + '. gada ';

    lv = lv + date.day.toString() + '. ';

    switch (date.month) {
      case (1):
        {
          lv += 'Janvārī';
        }
        break;
      case (2):
        {
          lv += 'Februārī';
        }
        break;
      case (3):
        {
          lv += 'Martā';
        }
        break;
      case (4):
        {
          lv += 'Aprīlī';
        }
        break;
      case (5):
        {
          lv += 'Maijā';
        }
        break;
      case (6):
        {
          lv += 'Jūnijā';
        }
        break;
      case (7):
        {
          lv += 'Jūlijā';
        }
        break;
      case (8):
        {
          lv += 'Augustā';
        }
        break;
      case (9):
        {
          lv += 'Septembrī';
        }
        break;
      case (10):
        {
          lv += 'Oktobrī';
        }
        break;
      case (11):
        {
          lv += 'Novembrī';
        }
        break;
      case (12):
        {
          lv += 'Decembrī';
        }
        break;
    }

    return lv;
  }



  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    data = args['t_valuest'];

    print(ThemeProvider.themeOf(context).id.toString());
    if (ThemeProvider.themeOf(context).id.toString() != 'light_theme1') {
      buttonIcon = Icons.wb_sunny;
      dark_theme = true;
    }

    String datums =
    lv_loc(data["dayOfWeek"].toString(), int.parse(data["date"]));
    return Container(
      /*decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.png"), repeat: ImageRepeat.repeat)),*/
      child: Scaffold(
        //backgroundColor: Color(0x00000000),

        appBar: AppBar(
            title: Text(
              'Stundu Izmaiņas',
            ),
            //backgroundColor: Color.fromARGB(255, 0, 0, 80),
            leading: Container(
              margin: EdgeInsets.fromLTRB(25.0, 0.0, 0.0, 0),
              child: ImageIcon(
                AssetImage('assets/ic_white_logo.png'),
              ),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(buttonIcon),
                tooltip: 'Tomorrow',
                onPressed: () {
                  setState(() {
                    print('hello');
                    if (dark_theme) {
                      buttonIcon = Icons.bedtime;
                      dark_theme = false;
                    } else {
                      buttonIcon = Icons.wb_sunny;
                      dark_theme = true;
                    }
                    print(buttonIcon.toString());
                  });
                  ThemeProvider.controllerOf(context).nextTheme();
                  print(ThemeProvider.themeOf(context).data.toString());
                },
              ),
              IconButton(
                icon: const Icon(Icons.wifi_protected_setup),
                tooltip: 'Teacher view',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/st', arguments: {
                    'values': args['values'],
                    'values_tom': args['values_tom'],
                    't_values':args['t_values'],
                    't_valuest':args['t_valuest'],
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_back),
                tooltip: 'Tomorrow',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/t', arguments: {
                    'values': args['values'],
                    'values_tom': args['values_tom'],
                    't_values':args['t_values'],
                    't_valuest':args['t_valuest'],
                  });
                },
              ),
            ]),
        body: RefreshIndicator(
          key: refreshKey,
          onRefresh: () async {

            getJson table = getJson(tryurl: 'https://jsonplaceholder.typicode.com/todos');
            getJsonT ttable = getJsonT(tryurl: 'https://jsonplaceholder.typicode.com/todos');
            await Future.wait([table.getData(), ttable.getData()]);
            bool pr=!(!(!table.error && !ttable.error) || !(!table.conerr && !ttable.conerr));
            print(pr.toString());
            //
            if (!(table.conerr || ttable.conerr)) {
              if (!(table.error || ttable.error)) {
                Navigator.pushReplacementNamed(context, '/t', arguments: {
                  't_values':table.teacherdata,
                  't_valuest':ttable.teacherdata,
                  'values':table.datatest,
                  'values_tom':ttable.datatest,
                });
              } else {
                //output warning
                Fluttertoast.showToast(
                    msg: "Pārbaudiet Internet pieslēgumu",
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 2
                );
              }
            }else{
              Fluttertoast.showToast(
                  msg: "Ir problēma ar serveriem, mēģiniet velāk!",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 2
              );
              print("hello");
            }

          },
          child: Scrollbar(
            child: ListView.builder(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
              itemCount: data["teachers"].length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Container(
                    padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Izmaiņas',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          datums,
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  );
                } else {
                  final theme = Theme.of(context)
                      .copyWith(dividerColor: Colors.transparent);
                  final divs = DividerTheme.of(context).copyWith(thickness: 2.0);
                  String name = data["teachers"][index - 1]["teacherName"];

                  return Card(
                    //Class card
                    margin: EdgeInsets.fromLTRB(32.0, 16.0, 32.0, 0),
                    elevation: 3.0,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 10),
                      child: Theme(
                        data: theme, //new

                        child: ExpansionTile(
                          expandedCrossAxisAlignment: CrossAxisAlignment.start,
                          title: Container(
                            padding: EdgeInsets.fromLTRB(10.0, 10.0, 26.0, 10.0),
                            child: Text(
                              name, //Teacher
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          children: <Widget>[
                            ListView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: data["teachers"][index - 1]["lessons"]
                                    .length, //Lessons
                                itemBuilder: (context, i) {
                                  return Column(
                                    children: <Widget>[
                                      DividerTheme(
                                        data: divs,
                                        child: Divider(
                                          //color: Colors.black12,

                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            26.0, 10.0, 26.0, 10),
                                        child: Text(
                                          'Stunda: ' +
                                              data["teachers"][index - 1]
                                              ["lessons"][i]["lessonNumber"] +
                                              '. ', //lessonnumber
                                          textAlign: TextAlign.left,
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Divider(),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                26.0, 10.0, 26.0, 10),
                                            child: Text(
                                              'Kabinets: ' +
                                                  data["teachers"][index - 1]
                                                  ["lessons"][i]["room"] +
                                                  '. ', //room
                                              textAlign: TextAlign.left,
                                            ),
                                          ),

                                          Divider(),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                26.0, 10.0, 26.0, 10),
                                            child: Text(
                                              'Klase: ' +
                                                  data["teachers"][index - 1]
                                                  ["lessons"][i]["class"],
                                              //Class
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                          Divider(),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                26.0, 10.0, 26.0, 10),
                                            child: Text(
                                              'Piezīme: ' +
                                                  data["teachers"][index - 1]
                                                  ["lessons"][i]["note"]["noteText"],
                                              //Notetext
                                              textAlign: TextAlign.left,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  );
                                })
                          ],
                        ),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
