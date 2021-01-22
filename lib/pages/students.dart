import 'package:flutter/material.dart';

class Students extends StatefulWidget {
  @override
  _StudentsState createState() => _StudentsState();
}

class _StudentsState extends State<Students> {
  Map args = {};
  List data;
  Map lesson = {};

  @override
  void initState() {
    super.initState();
  }

  String lv_loc(String DayofWeek, int timestamp) {
    var date =
        DateTime.fromMillisecondsSinceEpoch(timestamp * 1000, isUtc: true);
    print(date.toString());
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

  /*String dayWeek(int timestamp){
    var now = new DateTime.now().toUtc();
    var date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000).toUtc();
    Duration difference=date.difference(now);

    print('atsķiriba dienas '+difference.inDays.toString());
    return difference.inDays.toString();
  }*/

  @override
  Widget build(BuildContext context) {
    args = ModalRoute.of(context).settings.arguments;
    data = args['today_data'];

    String datums =
        lv_loc(data[0]["DayOfWeek"].toString(), int.parse(data[0]["Date"]));

    //dayWeek(int.parse(data[0]["Date"]));

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(


            image: AssetImage("assets/bg.png"), repeat: ImageRepeat.repeat, )),
      child: Scaffold(
        backgroundColor: Color(0x00000000),
        appBar: AppBar(
            title: Text(
              'Stundu Izmaiņas',
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
                    'values_tom': args['values_tom'],
                  });
                },
              ),
              IconButton(
                icon: const Icon(Icons.arrow_forward),
                tooltip: 'Tomorrow',
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/stt', arguments: {
                    'values': args['values'],
                    'values_tom': args['values_tom'],
                  });
                },
              ),
            ]),
        body: Scrollbar(
          child: ListView.builder(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 30.0),
            itemCount: data[0]["Classes"].length + 1,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Container(
                  padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Izmaiņas',
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
              } else {
                final theme =
                    Theme.of(context).copyWith(dividerColor: Colors.transparent);

                String name = data[0]["Classes"][index - 1]["Class"];
                if (name.length == 3) {
                  name = name.substring(0, name.length - 1) +
                      '.' +
                      name.substring(name.length - 1);
                } else {
                  name = name.substring(0, name.length - 2) +
                      '.' +
                      name.substring(name.length - 2);
                }
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
                            name, //10.a
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black38,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        children: <Widget>[
                          ListView.builder(
                              shrinkWrap: true,
                              physics: ScrollPhysics(),
                              itemCount: data[0]["Classes"][index - 1]["Lessons"]
                                  .length, //Lessons
                              itemBuilder: (context, i) {
                                if (data[0]["Classes"][index - 1]["Lessons"][i]["Rooms"].length !=0) {
                                  return Column(
                                    children: <Widget>[
                                      Divider(
                                        color: Colors.black12,
                                        thickness: 2.5,
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            26.0, 10.0, 26.0, 10),
                                        child: Text(
                                          'Stunda: ' +
                                              data[0]["Classes"][index - 1]
                                                  ["Lessons"][i]["LessonNumber"] +
                                              '. ', //lessonnumber
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.black54,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      ListView.builder(
                                          shrinkWrap: true,
                                          physics: ScrollPhysics(),
                                          itemCount: data[0]["Classes"][index - 1]
                                                  ["Lessons"][i]["Rooms"]
                                              .length, //rooms
                                          itemBuilder: (context, j) {
                                            print(data[0]["Classes"][index - 1]
                                                        ["Lessons"][i]["Rooms"][j]
                                                    ["Note"]
                                                .toString());
                                            if (data[0]["Classes"][index - 1]
                                                        ["Lessons"][i]["Rooms"][j]
                                                    ["Note"] !=
                                                null) {
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Divider(
                                                    color: Colors.black12,
                                                    thickness: 2.5,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(
                                                        26.0, 10.0, 26.0, 10),
                                                    child: Text('Kabinets: '+
                                                      data[0]["Classes"][index -
                                                                          1]
                                                                      ["Lessons"]
                                                                  [i]["Rooms"][j]
                                                              ["Room"] +
                                                          '. ', //room
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.black12,
                                                    thickness: 1.5,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(
                                                        26.0, 10.0, 26.0, 10),
                                                    child: Text(
                                                      'Priekšmets: ' +
                                                          data[0]["Classes"][
                                                                          index -
                                                                              1]
                                                                      ["Lessons"]
                                                                  [i]["Rooms"][j]
                                                              ["Subject"],
                                                      //subject
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.black12,
                                                    thickness: 1.5,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(
                                                        26.0, 10.0, 26.0, 10),
                                                    child: Text(
                                                      'Skolotājs: ' +
                                                          data[0]["Classes"][
                                                                          index -
                                                                              1]
                                                                      ["Lessons"]
                                                                  [i]["Rooms"][j]
                                                              ["TeacherName"],
                                                      //TeacherName
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.black12,
                                                    thickness: 1.5,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(
                                                        26.0, 10.0, 26.0, 10),
                                                    child: Text(
                                                      'Piezīme: ' +
                                                          data[0]["Classes"][
                                                                          index -
                                                                              1]
                                                                      ["Lessons"]
                                                                  [i]["Rooms"][j][
                                                              "Note"]["NoteText"],
                                                      //Notetext
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              print(data[0]["Classes"][index - 1]
                                                          ["Lessons"][i]["Rooms"]
                                                      [j]["Room"]
                                                  .toString());
                                              return Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  Divider(
                                                    color: Colors.black12,
                                                    thickness: 2.5,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(
                                                        26.0, 10.0, 26.0, 10),
                                                    child: Text('Kabinets: '+
                                                      data[0]["Classes"][index -
                                                                          1]
                                                                      ["Lessons"]
                                                                  [i]["Rooms"][j]
                                                              ["Room"] +
                                                          '. ', //room
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.black12,
                                                    thickness: 1.5,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(
                                                        26.0, 10.0, 26.0, 10),
                                                    child: Text(
                                                      'Priekšmets: ' +
                                                          data[0]["Classes"][
                                                                          index -
                                                                              1]
                                                                      ["Lessons"]
                                                                  [i]["Rooms"][j]
                                                              ["Subject"],
                                                      //subject
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                  Divider(
                                                    color: Colors.black12,
                                                    thickness: 1.5,
                                                  ),
                                                  Container(
                                                    padding: EdgeInsets.fromLTRB(
                                                        26.0, 10.0, 26.0, 10),
                                                    child: Text(
                                                      'Skolotājs: ' +
                                                          data[0]["Classes"][index -
                                                                              1][
                                                                          "Lessons"]
                                                                      [i]["Rooms"]
                                                                  [
                                                                  j]["TeacherName"]
                                                              .toString(),
                                                      //TeacherName
                                                      textAlign: TextAlign.left,
                                                      style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.black54,
                                                        fontSize: 14,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            }
                                          })
                                    ],
                                  );
                                }else{
                                  return Column(
                                    children: <Widget>[
                                  Divider(
                                  color: Colors.black12,
                                    thickness: 2.5,
                                  ),
                                Container(
                                padding: EdgeInsets.fromLTRB(
                                26.0, 10.0, 26.0, 10),
                                child: Text(
                                'Stunda: ' +
                                data[0]["Classes"][index - 1]
                                ["Lessons"][i]["LessonNumber"] +
                                '. ', //lessonnumber
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 14,
                                ),
                                ),
                                ),
                                Divider(
                                color: Colors.black12,
                                thickness: 2.5,
                                ),
                                Container(
                                padding: EdgeInsets.fromLTRB(
                                26.0, 10.0, 26.0, 10),
                                child: Text(
                                'Nenotiek!', //lessonnumber
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                                fontSize: 16,
                                ),
                                ),
                                ),
                                  ]);
                                }
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
    );
  }
}
