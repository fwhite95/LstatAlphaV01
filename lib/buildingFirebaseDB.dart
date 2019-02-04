import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:convert';


Widget _addData(BuildContext context){

  return Scaffold(
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
                    child: _buildDB(context, Text(new_data[index]['NAME']),
                      Text(new_data[index]['TEAM']),
                      Text(new_data[index]['POSITION']),
                      Text((new_data[index]['KDA (RATIO)']).toString()),
                      Text((new_data[index]['KILLS (TOTAL)']).toString()),
                      Text((new_data[index]['DEATHS (TOTAL)']).toString()),
                      Text((new_data[index]['ASSISTS (TOTAL)']).toString()),
                      Text((new_data[index]['KILL PARTICIPATION']).toString()),
                      Text((new_data[index]['CS (PER MINUTE)']).toString()),
                      Text((new_data[index]['CS (TOTAL)']).toString()),),
                  );
                });
          }),
    ),
  );

}

Widget _buildDB(BuildContext context, Widget name,
    Widget position,
    Widget team, Widget kda,
    Widget kills, Widget deaths, Widget assists,
    Widget kp, Widget cspm, Widget csTot){
  Firestore.instance.collection('books').document('new')
      .setData({ 'title': 'title', 'author': 'author' });
}


