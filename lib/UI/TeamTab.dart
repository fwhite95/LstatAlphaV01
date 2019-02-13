import 'package:flutter/material.dart';
import 'dart:convert';

//TODO build team list
//list team tiles
//on click to team info

Widget _buildTeamList(BuildContext context){

  List<Widget> teams = new List();
  teams.add(new Text("100 Thieves",
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,));
  teams.add(new Text("Cloud9",
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,));
  teams.add(new Text("Clutch Gaming",
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,));
  teams.add(new Text("Counter Logic Gaming",
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,));
  teams.add(new Text("Echo Fox",
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,));
  teams.add(new Text("FlyQuest",
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,));
  teams.add(new Text("Golden Guardians",
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,));
  teams.add(new Text("Optic Gaming",
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,));
  teams.add(new Text("Team Liquid",
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,));
  teams.add(new Text("Team Solomid",
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,));

  return ListView.builder(itemCount: teams.length,
      itemBuilder: (context, index){
        return new Container(
            decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                    bottom: BorderSide(width: 1.0, color: Colors.black),
                    left: BorderSide(width: 1.0, color: Colors.black),
                    right: BorderSide(width: 1.0, color: Colors.black))),
            child: ListTile(
              leading: Container(
                  child: Image.asset('Image/cloudnine.png',
                    height: 50.0,
                    width: 50.0,
                    fit: BoxFit.cover,
                  )
              ),
              title: teams[index],
              trailing: Text("3"),
            )
        );
      });

}

//TODO team info
//Logo
//Team members + position
//Possibly match history???