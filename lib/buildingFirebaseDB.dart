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

//FOR loop esque function needed to iterate through map style JSON new_data
//run everything inside _buildDB so I just call it
//Current firestore function will only end with one document of the final player info #prettySure

/*
  Firestore.instance.collection('Player Info').document('Stats_All')
      .updateData({ 'Name': name,
    'Position': position,
  'Team': team,
  'KDA' : kda,
  'Kills' : kills,
  'Deaths' : deaths,
  'Assists' : assists,
  'Kill Participation' : kp,
  'CS per Minute' : cspm,
  'CS Total' : csTot});
*/

FirebaseFirestoreService db = new FirebaseFirestoreService();
db.createNote("title", "description");

FirebaseFirestoreDB buildDb = new FirebaseFirestoreDB();
//TODO iterate through json file to pass strings to create new documents in firestore
buildDb.createPlayer(name, team, position, kda, kills, deaths, assists, kp, cspm, cst);


}




/*
new Text(new_data[index]['NAME']),
new Text(new_data[index]['TEAM']),
new Text(new_data[index]['POSITION']),
new Text((new_data[index]['KDA (RATIO)']).toString()),
new Text((new_data[index]['KILLS (TOTAL)']).toString()),
new Text((new_data[index]['DEATHS (TOTAL)']).toString()),
new Text((new_data[index]['ASSISTS (TOTAL)']).toString()),
new Text((new_data[index]['KILL PARTICIPATION']).toString()),
new Text((new_data[index]['CS (PER MINUTE)']).toString()),
new Text((new_data[index]['CS (TOTAL)']).toString()),
*/

final CollectionReference noteCollection = Firestore.instance.collection('notes');

class FirebaseFirestoreService {

  static final FirebaseFirestoreService _instance = new FirebaseFirestoreService.internal();

  factory FirebaseFirestoreService() => _instance;

  FirebaseFirestoreService.internal();

  Future<Note> createNote(String title, String description) async {
    final TransactionHandler createTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(noteCollection.document());

      final Note note = new Note(ds.documentID, title, description);
      final Map<String, dynamic> data = note.toMap();

      await tx.set(ds.reference, data);

      return data;
    };

    return Firestore.instance.runTransaction(createTransaction).then((mapData) {
      return Note.fromMap(mapData);
    }).catchError((error) {
      print('error: $error');
      return null;
    });
  }

  Stream<QuerySnapshot> getNoteList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = noteCollection.snapshots();

    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }

    if (limit != null) {
      snapshots = snapshots.take(limit);
    }

    return snapshots;
  }

  Future<dynamic> updateNote(Note note) async {
    final TransactionHandler updateTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(noteCollection.document(note.id));

      await tx.update(ds.reference, note.toMap());
      return {'updated': true};
    };

    return Firestore.instance
        .runTransaction(updateTransaction)
        .then((result) => result['updated'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }

  Future<dynamic> deleteNote(String id) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(noteCollection.document(id));

      await tx.delete(ds.reference);
      return {'deleted': true};
    };

    return Firestore.instance
        .runTransaction(deleteTransaction)
        .then((result) => result['deleted'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
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

      final Player player = new Player(ds.documentID, team, position, kda,
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