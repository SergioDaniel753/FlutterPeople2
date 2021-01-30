/*import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
 


void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget 
{const MyApp({Key key}):super(key:key);

 @override

 Widget build (BuildContext context){
   return MaterialApp(
title: "App image",
home:Inicio(),
); //MaterialApp
 }
}

class Inicio extends StatefulWidget{
  Inicio({Key key}): super(key: key);
  @override

  _InicioState createState()=>_InicioState();
}

class _InicioState extends State<Inicio>{
  List data;
  Future <String> getData () async {
    var response= await http.get(
          Uri.encodeFull("https://webapipersonasq.azurewebsites.net/api/people"),
          headers: {"Accept":"application/json"}
    );
    if(response.statusCode == 200 ){
    data= json.decode(response.body);
    print(data);
    //return data.map((people)=> new People.fromJson(people)).toList();
    }
    /*else {
      throw Exception("Fallo al llamar a la Api !");
    }*/
    return "Satisfactorio";
  }
   _InicioState(){
    this.getData();
  }
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title:Text("Mi app con imagen"),
    ),
   
   body: new ListView.builder(
            itemCount: data== null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index){
            return new Card(
              child: new Text(data[index]["Name"])
            );  
            },
          ),
    /*body: ListView( 
      children:<Widget>[  
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.network("https://i.pinimg.com/originals/53/43/49/5343498957d9cfad45244d1ffef56c7f.jpg"),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.network("https://www.infobae.com/new-resizer/uhTXyFFtH_Phxp34OJkcmhmA9sc=/420x236/filters:format(jpg):quality(85)/s3.amazonaws.com/arc-wordpress-client-uploads/infobae-wp/wp-content/uploads/2017/04/14104549/NegroPensante10-1024x576.jpg"),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRtH9ueHxEGfveQaOZei98GTo1OvC-DXTSNTg&usqp=CAU"),
          ),
          new Center(
            child:new RaisedButton(
              child:new Text("Obtener datos"),
              onPressed: getData) 
          ),
      ]*/
  );
}  
}
*/  
  
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(new MaterialApp(
    home: new HomePage()
  ));
}

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {

  List data;

  Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://webapipersonasq.azurewebsites.net/api/people"),
      headers: {
        "Accept": "application/json"
      }
    );

    this.setState(() {
      data = json.decode(response.body);
    });
    
    print(data[1]["Name"]);
    
    return "Success!";
  }

  @override
  void initState(){
    this.getData();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("Listviews"), backgroundColor: Colors.blue),
      body: new ListView.builder(
        itemCount: data == null ? 0 : data.length,
        itemBuilder: (BuildContext context, int index){
          return new Card(
            child: new Text(data[index]["Name si"]),
          );
        },
      ),
    );
  }
}
