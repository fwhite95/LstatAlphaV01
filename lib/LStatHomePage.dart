import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


class LStatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LStat',
      home: LStatHomePage(),
    );
  }
}

class LStatHomePage extends StatefulWidget{
  @override
  _LStatHomePageState createState(){
    return _LStatHomePageState();
  }
}

class _LStatHomePageState extends State<LStatHomePage>{
  List data;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text('Lstat')),
      body: new Container(
        child: new FutureBuilder(
          future: DefaultAssetBundle
          .of(context)
          .loadString('resources/textFiles/LCS_Summer_2018.json'),
          builder: (context, snapshot){
            var new_data = jsonDecode(snapshot.data.toString());



            //TODO function for score?

            return new ListView.builder(
                itemBuilder: (BuildContext context, int index){
                  return new Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.black),
                            left: BorderSide(width: 1.0, color: Colors.black),
                            right: BorderSide(width: 1.0, color: Colors.black))),
                    child: ListTile(
                      leading: Container(
                          child: Image.asset('resources/images/impact.png',
                            fit: BoxFit.contain,
                            height: 90.0,
                            width: 90.0,)
                      ),
                      title: new Text((new_data[index]['NAME']).toString()),
                      subtitle: new Text("Team: " + (new_data[index]['TEAM']).toString() +
                          "\tPosition: " + new_data[index]['POSITION']),
                      trailing: Text("998"),
                      
                    ),
                  );
                });
          }),
      ),
    );
  }
}


/*
Widget _buildDB(){
  Firestore.instance.collection('Stats').document()
      .setData({'ign' : 'Bjergsen', 'Team' : 'TSM'});
}
*/