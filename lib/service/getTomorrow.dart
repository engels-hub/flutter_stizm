import 'dart:io';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';

// ignore: camel_case_types
class getJsonT{
  //func values
  List values; //data
  String tryurl; //api url
  bool error=false; //error
  bool conerr=false;
  //file properties
  File jsonFile;
  Directory dir;
  String filename = 'savet.json';
  bool fileExists = false;
  //for data use values variable (line 9)


  getJsonT({this.tryurl});

  void createFile(List content){
    print("creating file for tomorrow!");
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
          Response response = await get('$tryurl'); //https://jsonplaceholder.typicode.com/todos
          var data = jsonDecode(response.body) as List;
          if (data==null){
            print('connection failed');
            conerr=true;
          }
          values=data;
        }catch(e){
          print('error: $e');
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
        print('error: $e');
        error=true;

      }


    }else {
      print('not Rico');
      if(fileExists){
        print('reading');
        values= jsonDecode(jsonFile.readAsStringSync());
        print('read complete');
      }else{
        error=true;
        values=[];
        print('ERROR');
      }
      // TODO: read from last saved json, if exists
      // TODO: if not, return error
    }
  }
}