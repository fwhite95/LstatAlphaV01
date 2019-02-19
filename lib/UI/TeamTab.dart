import 'package:flutter/material.dart';
import 'dart:convert';
import 'LstatPackage.dart';

//TODO build team list
//list team tiles
//on click to team info

class BuildTeamListFire extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView.builder(itemCount: TeamNames.teamNames.length,
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
                title: Text(TeamNames.teamNames[index]),
                trailing: Text('${index+1}'),
              )
          );
        });
  }
}

Widget teamText(String team){
return new Text(team,
  style: TextStyle(
      fontSize: 20.0, fontWeight: FontWeight.bold),
  textAlign: TextAlign.center,);
}

//Team Page for onTap
class teamPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}


//TODO team info
//Logo
//Team members + position
//Possibly match history???