import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

// ignore: camel_case_types
class getJsonT{
  //func values
  List values; //data
  String tryurl; //api url
  bool conerr=false;
  bool error=false; //error

  //file properties
  File jsonFile;
  Directory dir;
  String filename = 'save.json';
  bool fileExists = false;
  //for data use values variable (line 9)

  String map='{"_id":"7edc0c05-c2f4-4c0c-b412-bbcc97169a41","DayOfWeek":"Tuesday","Date":"1611602043","Classes":[{"Class":"10a","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"119","Subject":"Fizika","TeacherName":"Sergejs Vinogradovs","Note":{"NoteId":"f0a333f1-e998-4562-aa3d-8828253bad3e","NoteText":"this is tomorrow","CreatedDate":"1611084905"}}]},{"LessonNumber":"2","Rooms":[{"Room":"119","Subject":"Matemātika","TeacherName":"Dace Andžāne","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"119","Subject":"Ķīmija","TeacherName":"Andra Reinholde","Note":{"NoteId":"19a28478-b885-4184-bceb-2a1fd5643313","NoteText":"yuyuo wre ywuresdhjf sdgfs ewr rico","CreatedDate":"1611084996"}}]},{"LessonNumber":"4","Rooms":[{"Room":"119","Subject":"Latviešu val. ||| Bioloģija","TeacherName":"Vita Sondore","Note":null}]},{"LessonNumber":"5","Rooms":[]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"10b","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"115","Subject":"Matemātika","TeacherName":"Dace Andžāne","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"115","Subject":"Latviešu valoda","TeacherName":"Ilze Špūle","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"115","Subject":"Fizika","TeacherName":"Pēteris Brics","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"115","Subject":"Ķīmija","TeacherName":"Andra Reinholde","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"115","Subject":"Ķīmija","TeacherName":"Andra Reinholde","Note":null},{"Room":"D- ","Subject":"Programmēšana","TeacherName":"Ričards Liškovskis","Note":null}]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"10c","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"205","Subject":"Latviešu valoda","TeacherName":"Vita Sondore","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"312","Subject":"Angļu valoda","TeacherName":"Sanita Rieksta","Note":null},{"Room":"205","Subject":"Angļu valoda","TeacherName":"Sanita Mileiko","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"205","Subject":"Matemātika","TeacherName":"Karmena Liepiņa","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"205","Subject":"Ķīmija","TeacherName":"Mārtiņš Stepiņš","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"104","Subject":"Vācu val.","TeacherName":"Karīna Krūma","Note":null},{"Room":"205","Subject":"Krievu val.","TeacherName":"Vladislava Puļajeva","Note":null},{"Room":"330","Subject":"Krievu val.","TeacherName":"Ruta Tumova","Note":null}]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"10d","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"212","Subject":"Matemātika","TeacherName":"Alfrēds Mežulis","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"212","Subject":"Fizika","TeacherName":"Ansis Ēcis","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"312","Subject":"Angļu valoda","TeacherName":"Sanita Rieksta","Note":null},{"Room":"212","Subject":"Angļu valoda","TeacherName":"Sanita Mileiko","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"212","Subject":"Latviešu valoda","TeacherName":"Santa Lagzdiņa","Note":null}]},{"LessonNumber":"5","Rooms":[]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"10e","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"219","Subject":"Matemātika","TeacherName":"Maruta Avotiņa","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"219","Subject":"Matemātika","TeacherName":"Maruta Avotiņa","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"219","Subject":"Latviešu valoda","TeacherName":"Ingrīda Siliņšmite","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"219","Subject":"Fizika","TeacherName":"Ansis Ēcis","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"311","Subject":"Angļu valoda","TeacherName":"Lāsma Ēķe","Note":null},{"Room":"312","Subject":"Angļu valoda","TeacherName":"Sanita Rieksta","Note":null}]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"10f","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"311","Subject":"Angļu valoda","TeacherName":"Lāsma Ēķe","Note":null},{"Room":"210","Subject":"Angļu valoda","TeacherName":"Sanita Mileiko","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"210","Subject":"Fizika","TeacherName":"Pēteris Brics","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"210","Subject":"Matemātika","TeacherName":"Inese Lagzda","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"210","Subject":"Latviešu valoda","TeacherName":"Ingrīda Siliņšmite","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"210","Subject":"Vēsture","TeacherName":"Roberts Ķipurs","Note":null}]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"10sb","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"223","Subject":"Ķīmija","TeacherName":"Agrita Veide","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"223","Subject":"Fizika","TeacherName":"Aleksandrs Sorokins","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"223","Subject":"Fizika","TeacherName":"Aleksandrs Sorokins","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"223","Subject":"Angļu valoda","TeacherName":"Jānis Zeimanis","Note":null},{"Room":"307","Subject":"Angļu valoda","TeacherName":"Jānis Zeimanis","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"223","Subject":"Vēsture","TeacherName":"Ina Evardsone","Note":null}]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"11a","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"104","Subject":"Vācu val.","TeacherName":"Karīna Krūma","Note":null},{"Room":"327","Subject":"Krievu val.","TeacherName":"Anita Ose","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"133","Subject":"Fizika","TeacherName":"Sergejs Vinogradovs","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"Zāle","Subject":"Sports","TeacherName":"Normunds Lūsis","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"133","Subject":"Matemātika","TeacherName":"Inese Lagzda","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"133","Subject":"Bioloģija","TeacherName":"Liesma Āboliņa","Note":null}]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"11b","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"Zāle","Subject":"Sports","TeacherName":"Normunds Lūsis","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"114","Subject":"Fizika","TeacherName":"Ģirts Zāģeris","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"114","Subject":"Bioloģija","TeacherName":"Liesma Āboliņa","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"114","Subject":"Matemātika","TeacherName":"Vita Brakovska","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"114","Subject":"Latviešu valoda","TeacherName":"Inese Plaude","Note":null}]},{"LessonNumber":"6","Rooms":[{"Room":"D-3","Subject":"Programmēšana","TeacherName":"Aija Lūse","Note":null}]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"11c","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"122","Subject":"Matemātika","TeacherName":"Karmena Liepiņa","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"122","Subject":"Bioloģija","TeacherName":"Liesma Āboliņa","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"122","Subject":"Fizika","TeacherName":"Ģirts Zāģeris","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"Zāle","Subject":"Sports","TeacherName":"Normunds Lūsis","Note":null}]},{"LessonNumber":"5","Rooms":[]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"11d","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"123","Subject":"Bioloģija","TeacherName":"Liesma Āboliņa","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"Zāle","Subject":"Sports","TeacherName":"Normunds Lūsis","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"123","Subject":"Ķīmija","TeacherName":"Agrita Veide","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"123","Subject":"Matemātika","TeacherName":"Karmena Liepiņa","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"123","Subject":"Fizika","TeacherName":"Anna Jansone","Note":null}]},{"LessonNumber":"6","Rooms":[{"Room":"D-1","Subject":"Programmēšana","TeacherName":"Andrejs Liepiņš","Note":null}]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"11e","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"218","Subject":"Matemātika","TeacherName":"Aija Vasiļevska","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"218","Subject":"Fizika","TeacherName":"Anna Jansone","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"218","Subject":"Matemātika","TeacherName":"Aija Vasiļevska","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"218","Subject":"Ekonomika","TeacherName":"Rihards Matīss Vilcāns","Note":null}]},{"LessonNumber":"5","Rooms":[]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"11f","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"121","Subject":"Fizika","TeacherName":"Pēteris Brics","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"121","Subject":"Ķīmija","TeacherName":"Agrita Veide","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"121","Subject":"Ekonomika","TeacherName":"Rihards Matīss Vilcāns","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"121","Subject":"Matemātika","TeacherName":"Dainis Kriķis","Note":null}]},{"LessonNumber":"5","Rooms":[]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"11sb","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"105","Subject":"Matemātika","TeacherName":"Rihards Adovičs","Note":null},{"Room":"110","Subject":"Zināšanu teorija","TeacherName":"Rihards Matīss Vilcāns","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"110","Subject":"Zināšanu teorija","TeacherName":"Rihards Matīss Vilcāns","Note":null},{"Room":"105","Subject":"Matemātika","TeacherName":"Rihards Adovičs","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"105","Subject":"Matemātika","TeacherName":"Rihards Adovičs","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"124","Subject":"Fizika - 2","TeacherName":"Anna Jansone","Note":null},{"Room":"110","Subject":"Bioloģija","TeacherName":"Maruta Kusiņa","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"Zāle","Subject":"Sports","TeacherName":"Normunds Lūsis","Note":null}]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"12a","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"109","Subject":"Matemātika","TeacherName":"Regīna Simanovska","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"329","Subject":"Vācu val.","TeacherName":"Baiba Lizuma","Note":null},{"Room":"327","Subject":"Krievu val.","TeacherName":"Anita Ose","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"109","Subject":"Fizika","TeacherName":"Sergejs Vinogradovs","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"109","Subject":"Matemātika","TeacherName":"Regīna Simanovska","Note":null}]},{"LessonNumber":"5","Rooms":[]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"12b","Lessons":[{"LessonNumber":"1","Rooms":[]},{"LessonNumber":"2","Rooms":[{"Room":"103","Subject":"Latviešu valoda","TeacherName":"Inese Plaude","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"103","Subject":"Matemātika","TeacherName":"Dzintars Zicāns","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"103","Subject":"Ķīmija ||| Fizika","TeacherName":"Agrita Veide","Note":null}]},{"LessonNumber":"5","Rooms":[]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"12c","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"234","Subject":"Ķīmija","TeacherName":"Andra Reinholde","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"234","Subject":"Matemātika","TeacherName":"Regīna Simanovska","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"234","Subject":"Matemātika","TeacherName":"Regīna Simanovska","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"234","Subject":"Latviešu valoda","TeacherName":"Inese Plaude","Note":null}]},{"LessonNumber":"5","Rooms":[]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"12d","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"124","Subject":"Fizika","TeacherName":"Ansis Ēcis","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"124","Subject":"Ķīmija","TeacherName":"Mārtiņš Stepiņš","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"124","Subject":"Fizika ||| Ķīmija","TeacherName":"Ansis Ēcis","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"104","Subject":"Vācu","TeacherName":"Sven Edgar Anselm Soltau","Note":null},{"Room":"128","Subject":"Franču","TeacherName":"Karinē Heinrihsone","Note":null},{"Room":"332","Subject":"Krievu val.","TeacherName":"Veronika Kjapsņa","Note":null}]},{"LessonNumber":"5","Rooms":[]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"12e","Lessons":[{"LessonNumber":"1","Rooms":[]},{"LessonNumber":"2","Rooms":[{"Room":"104","Subject":"Vācu","TeacherName":"Sven Edgar Anselm Soltau","Note":null},{"Room":"128","Subject":"Franču","TeacherName":"Karinē Heinrihsone","Note":null},{"Room":"332","Subject":"Krievu val.","TeacherName":"Veronika Kjapsņa","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"311","Subject":"Angļu valoda","TeacherName":"Lāsma Ēķe","Note":null},{"Room":"307","Subject":"Angļu valoda","TeacherName":"Jānis Zeimanis","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"132","Subject":"Latviešu valoda","TeacherName":"Ilze Špūle","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"132","Subject":"Fizika","TeacherName":"Ansis Ēcis","Note":null}]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"12f","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"235","Subject":"Matemātika","TeacherName":"Dainis Kriķis","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"311","Subject":"Angļu valoda","TeacherName":"Lāsma Ēķe","Note":null},{"Room":"307","Subject":"Angļu valoda","TeacherName":"Jānis Zeimanis","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"104","Subject":"Vācu","TeacherName":"Sven Edgar Anselm Soltau","Note":null},{"Room":"128","Subject":"Franču","TeacherName":"Karinē Heinrihsone","Note":null},{"Room":"332","Subject":"Krievu val.","TeacherName":"Veronika Kjapsņa","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"235","Subject":"Fizika ||| Ķīmija","TeacherName":"Pēteris Brics","Note":null}]},{"LessonNumber":"5","Rooms":[]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]},{"Class":"12sb","Lessons":[{"LessonNumber":"1","Rooms":[{"Room":"111","Subject":"Latvijas vēsture","TeacherName":"Ina Evardsone","Note":null}]},{"LessonNumber":"2","Rooms":[{"Room":"111","Subject":"Matemātika","TeacherName":"Aija Vasiļevska","Note":null}]},{"LessonNumber":"3","Rooms":[{"Room":"208","Subject":"Geogrāfija","TeacherName":"Zaiga Tenisone","Note":null},{"Room":"204","Subject":"Ekonomika - 2","TeacherName":"Kārlis Krūmiņš","Note":null}]},{"LessonNumber":"4","Rooms":[{"Room":"208","Subject":"Fizika - 1","TeacherName":"Aleksandrs Sorokins","Note":null},{"Room":"310","Subject":"Vēsture","TeacherName":"Ina Evardsone","Note":{"NoteId":"66ad38d6-0562-42e1-8fef-bf3392a56917","NoteText":"qwe yryew ui dgfksywe sd liu","CreatedDate":"1611085173"}},{"Room":"204","Subject":"Ekon. -1","TeacherName":"Kārlis Krūmiņš","Note":null}]},{"LessonNumber":"5","Rooms":[{"Room":"208","Subject":"Fizika - 2","TeacherName":"Aleksandrs Sorokins","Note":null},{"Room":"D-3","Subject":"Datorzin.","TeacherName":"Aija Lūse","Note":null},{"Room":"110","Subject":"Biol. -2","TeacherName":"Maruta Kusiņa","Note":null}]},{"LessonNumber":"6","Rooms":[]},{"LessonNumber":"7","Rooms":[]},{"LessonNumber":"8","Rooms":[]}]}]}';
  Map datatest;
  getJsonT({this.tryurl});

  void createFile(List content){
    print("creating file!");

    File  file = new File(dir.path + "/" + filename);
    file.createSync();
    fileExists=true;
    jsonFile.writeAsStringSync(jsonEncode(content));
  }

  void write(values){
    print('output');
    if(fileExists){
      print('exists');
      jsonFile.writeAsStringSync(jsonEncode(values));
    }
  }

  Future<void> getData() async{
    datatest = jsonDecode(map);

    dir= await getApplicationDocumentsDirectory();
    jsonFile = new File(dir.path + "/" + filename);
    fileExists = jsonFile.existsSync();


    bool connection;
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        print('connected');
        connection=true;
      }
    } on SocketException catch (_) {
      print('not connected');
      connection=false;
    }

    if (connection) {

      //network goes brrr..
      try{
        try{
          Response response = await get(tryurl); //https://jsonplaceholder.typicode.com/todos
          var data = jsonDecode(response.body) as List;
          if (data==null){
            print('connection failed');
            conerr=true;
          }
          values=data;
        }catch(e){
          print(e.toString());
          conerr=true;
          List values;
        }
        if(fileExists){
          print('exists');
          jsonFile.writeAsStringSync(jsonEncode(values));
          print('write ended');
        }else{
          createFile(values);
        }
      }catch(e){
        print('error: e');
        error=true;
      }

      // TODO: create file, if not exists
      // TODO: save json


    }else {
      print('not Rico');
      if(fileExists){
        print('reading');
        values= jsonDecode(jsonFile.readAsStringSync());
        print('read complete');
      }else{
        error=true;
        print('ERROR');
        values=[];
      }
      // TODO: read from last saved json, if exists
      // TODO: if not, return error
    }
  }
}