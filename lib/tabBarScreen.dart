import 'package:flutter/material.dart';
import 'dart:convert';


class TabScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              bottom: TabBar(
                  tabs: [
                    Tab(icon: Text("Players")),
                    Tab(icon: Text("Teams")),
                    Tab(icon: Text("Rankings")),
                  ]),
              title: Text("LStat"),
            ),
            body: TabBarView(
                children: [
                  _buildPlayerList(context),
                  _buildTeamList(context),
                  _buildRankingList(context)
                ]),
          )),
    );
  }
}

//TODO Player List

Widget _buildPlayerList(BuildContext context){

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
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => _buildPlayerPage(context, playerText(new_data[index]['NAME']),
                              Text(new_data[index]['TEAM']),
                              Text(new_data[index]['POSITION']),
                              playerText((new_data[index]['KDA (RATIO)']).toString()),
                              playerText((new_data[index]['KILLS (TOTAL)']).toString()),
                              playerText((new_data[index]['DEATHS (TOTAL)']).toString()),
                              playerText((new_data[index]['ASSISTS (TOTAL)']).toString()),
                              playerText((new_data[index]['KILL PARTICIPATION']).toString()),
                              playerText((new_data[index]['CS (PER MINUTE)']).toString()),
                              playerText((new_data[index]['CS (TOTAL)']).toString()),
                        ))
                        );
                      },
                      //TODO add onTap Functionality
                    ),
                  );
                });
          }),
    ),
  );

}

//*********************************************************************************
//******************************************************************************
//TODO Team List

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

Widget _buildPlayerPage(BuildContext context, Widget name,
    Widget position,
    Widget team, Widget kda,
    Widget kills, Widget deaths, Widget assists,
    var kp, var cspm, var csTot
    ){
  return Scaffold(
    appBar: AppBar(
      title: name,
    ),
    body: ListView(
      padding: EdgeInsets.all(10.0),
      children: <Widget>[
        Container(
          color: Colors.black,
          padding: EdgeInsets.symmetric(vertical: 10.0),
          child: Image.asset('resources/images/impact.png',
            fit: BoxFit.contain,
            height: 150.0,),
          height: 150.0,
        ),
        //ListView(),
        //ListView(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              height: 50.0,
              width: 100.0,
              color: Colors.black12,
              child: Center(
                child: kda,
              ),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 50.0,
              width: 100.0,
              color: Colors.black12,
              child: Center(child: kills,),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 50.0,
              width: 100.0,
              color: Colors.black12,
              child: Center(child: deaths,),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(10.0),
              height: 50.0,
              width: 100.0,
              color: Colors.black12,
              child: Center(child: assists,),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 50.0,
              width: 100.0,
              color: Colors.black12,
              child: Center(child: kp,),
            ),
            Container(
              margin: EdgeInsets.all(10.0),
              height: 50.0,
              width: 100.0,
              color: Colors.black12,
              child: Center(child: cspm,),
            ),
          ],
        ),
      ],
    ),
  );
}

Text playerText(String data){
  return new Text(data,
    style: TextStyle(
        fontSize: 20.0, fontWeight: FontWeight.bold),
    textAlign: TextAlign.center,);
}

//TODO Ranking List

Widget _buildRankingList(BuildContext context){

}
