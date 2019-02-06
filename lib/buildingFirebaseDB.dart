import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'player.dart';

class BuildDB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Baby Names',
      home: _addData(context),
    );
  }
}

Widget _addData(BuildContext context){

  return Scaffold(
    body: new Container(
      child: new FutureBuilder(
          future: DefaultAssetBundle
              .of(context)
              .loadString('resources/textFiles/LCS_Summer_2018.json'),
          builder: (context, snapshot){
            var new_data = jsonDecode(snapshot.data.toString());
            CollectionReference dbReplies =
            Firestore.instance.collection('PlayTest');
            Firestore.instance.runTransaction((Transaction tx) async {
              var _result = await dbReplies.add(new_data.toJson());
            });
            //TODO function for score?

                  return new Container(
                    child: _buildDB(context, new_data),
                  );

          }),
    ),
  );

}




Widget _buildDB(BuildContext context, var new_data){


FirebaseFirestoreDB buildDb = new FirebaseFirestoreDB();
//TODO iterate through json file to pass strings to create new documents in firestore


for(int index = 0; index < new_data.length; index++){
  buildDb.createPlayer(new_data[index]['NAME'],
      new_data[index]['TEAM'],
      new_data[index]['POSITION'],
      (new_data[index]['KDA (RATIO)']).toString(),
      (new_data[index]['KILLS (TOTAL)']).toString(),
      (new_data[index]['DEATHS (TOTAL)']).toString(),
      (new_data[index]['ASSISTS (TOTAL)']).toString(),
      (new_data[index]['KILL PARTICIPATION']).toString(),
      (new_data[index]['CS (PER MINUTE)']).toString(),
      (new_data[index]['CS (TOTAL)']).toString());
}

}

//Testing for Create Player method

final CollectionReference playerCollection = Firestore.instance.collection('PlayerInfoTest');

class FirebaseFirestoreDB{

  static final FirebaseFirestoreDB _instance = new FirebaseFirestoreDB.internal();

  factory FirebaseFirestoreDB() => _instance;
  FirebaseFirestoreDB.internal();

  //Create Players method

  Future<Player> createPlayer(String name, String team, String position
      String kda, String kills, String deaths, String assists,
      String kp, String cspm, String cst) async{
    final TransactionHandler createTransaction = (Transaction tx) async{
      final DocumentSnapshot ds = await tx.get(playerCollection.document());

      final Player player = new Player(name, team, position, kda,
          kills, deaths, assists, kp,
          cspm, cst);
      final Map<String, dynamic> data = player.toMap();

      await tx.set(ds.reference, data);

      return data;

    };
    return Firestore.instance.runTransaction(createTransaction).then((mapData){
     return Player.fromMap(mapData);
  }).catchError((error){
      print('error $error');
      return null;
  });

  }

  //Update Player method

}