import 'package:flutter/material.dart';
import 'dart:convert';
import 'StatsMainScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'HomeScreen.dart';
import 'LstatPackage.dart';

//TODO player tab
//Includes build player list
// Tile info
//On click to go to player info

//New player list view using Firestore

class BuildPlayerListFire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('PlayerInfoTest').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return new Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return new Text('Loading...');
          default:
            return new ListView(
              children:
                  snapshot.data.documents.map((DocumentSnapshot document) {
                return new Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border(
                            bottom: BorderSide(width: 1.0, color: Colors.black),
                            left: BorderSide(width: 1.0, color: Colors.black),
                            right:
                                BorderSide(width: 1.0, color: Colors.black))),
                    child: ListTile(
                      leading: Container(
                          child: Image.asset(
                        'resources/images/impact.png',
                        fit: BoxFit.contain,
                        height: 90.0,
                        width: 90.0,
                      )),
                      title: new Text((document['Name']),
                          style: TextStyle(fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center),
                      subtitle: new Text(
                          ("Team: " +
                              document['Team'] +
                              "\tPosition: " +
                              document['Position']),
                          textAlign: TextAlign.center),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PlayerPage(document)));
                      },
                    ));
              }).toList(),
            );
        }
      },
    );
  }
}

//********************************************************************************************************************************
//Player page class for the onTap of playerTiles

class PlayerPage extends StatelessWidget {

  String name, position, team, kda,
   kills, deaths, assists, kp, cspm,
   csTot;

  FirestoreTitles titles = new FirestoreTitles();

  PlayerPage(DocumentSnapshot document){
    this.name = document[titles.getName()];
    this.position = document[titles.pos];
    this.team = document[titles.team];
    this.kda = document[titles.kda];
    this.kills  = document[titles.kills];
    this.deaths = document[titles.deaths];
    this.assists = document[titles.assists];
    this.kp = document[titles.kp];
    this.cspm = document[titles.cspm];
    this.csTot = document[titles.cst];
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
        appBar: AppBar(
          title: Text('Name'),
        ),
        body: ListView(padding: EdgeInsets.all(10.0), children: <Widget>[
          Container(
            color: Colors.black,
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: Image.asset(
              'resources/images/impact.png',
              fit: BoxFit.contain,
              height: 150.0,
            ),
            height: 150.0,
          ),
          Container(
            color: Colors.blue,
            padding: EdgeInsets.all(10),
            child: new Text('HOLDING'),
            height: 50,
          ),
          GridView.count(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              primary: false,
              padding: EdgeInsets.all(3),
              crossAxisSpacing: 2,
              crossAxisCount: 2,
              childAspectRatio: 2,
              children: <Widget>[
                titleTextContainer(titles.name),
                textContainer(name),
                titleTextContainer(titles.team),
                textContainer(team),
                titleTextContainer(titles.pos),
                textContainer(position),
                titleTextContainer(titles.kills),
                textContainer(kills),
                //Row two
                titleTextContainer(titles.deaths),
                textContainer(deaths),
                titleTextContainer(titles.assists),
                textContainer(assists),
                titleTextContainer(titles.kda),
                textContainer(kda),
                titleTextContainer(titles.kp),
                textContainer(kp),
                //row three
                titleTextContainer(titles.cspm),
                textContainer(cspm),
                titleTextContainer(titles.cst),
                textContainer(csTot),
              ]
          ),
        ]));
  }
}

Widget titleTextContainer(String text){
  return new Container(
    child: Center(
      child: Text(text, style:
        TextStyle(fontWeight: FontWeight.bold,
            fontSize: 20.0),),
    ),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            top: BorderSide(width: 1.0, color: Colors.black),
            bottom: BorderSide(width: 1.0, color: Colors.black),
            left: BorderSide(width: 1.0, color: Colors.black),
            right: BorderSide(width: 1.0, color: Colors.black))),
    margin: EdgeInsets.all(2.0),
  );
}

Widget textContainer (String text){
  return new Container(
    child: Center(
      child: Text(text,style: TextStyle(fontSize: 15),),
    ),
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
            top: BorderSide(width: 1.0, color: Colors.black),
            bottom: BorderSide(width: 1.0, color: Colors.black),
            left: BorderSide(width: 1.0, color: Colors.black),
            right: BorderSide(width: 1.0, color: Colors.black))),
    margin: EdgeInsets.all(2.0),
  );
}

//********************************************************************************************************************************
//********************************************************************************************************************************

