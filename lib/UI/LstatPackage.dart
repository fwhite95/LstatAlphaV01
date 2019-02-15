import 'package:flutter/material.dart';
import 'StatsMainScreen.dart';
import 'HomeScreen.dart';

//List tiles for navigation drawer

Widget StatsListTile(BuildContext context, String title){

  return ListTile(
    title: Text(title),
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StatsMainScreenFire()));
    },
  );
}

Widget AccountListTile(BuildContext context, String title){

  return ListTile(
    title: Text(title),
    onTap: () {

      Navigator.pop(context);
    },
  );
}

Widget ContactListTile(BuildContext context, String title){

  return ListTile(
    title: Text(title),
    onTap: () {

      Navigator.pop(context);
    },
  );
}

Widget HomeListTile(BuildContext context, String title){

  return ListTile(
    title: Text(title),
    onTap: () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => HomeScreenApp()));
    },
  );
}

//************************************************************
//************************************************************

class FirestoreTitles {
  String name = 'Name';
  String team = 'Team';
  String pos = 'Position';
  String kills = 'Kills';
  String deaths = 'Deaths';
  String assists = 'Assists';
  String kda = 'KDA';
  String kp = 'Kill Participation';
  String cspm = 'CS Per Minute';
  String cst = 'CS Total';

  String getName(){return this.name;}
  String getTeam(){return this.team;}
  String getPos(){return this.pos;}
  String getKills(){return this.kills;}
  String getDeaths(){return this.deaths;}
  String getAssists(){return this.assists;}
  String getKda(){return this.kda;}
  String getKp(){return this.kp;}
  String getCspm(){return this.cspm;}
  String getCst(){return this.cst;}

}

class TeamNames {

  static final String hundredT = '100 Thieves';
  static final String cNine = 'Cloud9';
  static final String cg = 'Clutch Gaming';
  static final String clg = 'Counter Logic Gaming';
  static final String ef = 'Echo Fox';
  static final String fq = 'FlyQuest';
  static final String ggs = 'Golden Guardians';
  static final String opg = 'Optic Gaming';
  static final String tl = 'Team Liquid';
  static final String tsm = 'Team Solomid';

  static List<String> teamNames = [hundredT, cNine,
  cg, clg, ef, fq, ggs, opg, tl, tsm];


}