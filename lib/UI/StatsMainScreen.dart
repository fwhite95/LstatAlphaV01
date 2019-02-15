import 'package:flutter/material.dart';
import 'PlayerTab.dart';
import 'MatchesTab.dart';
import 'TeamTab.dart';
import 'LstatPackage.dart';

//TODO tab bar screen
//Has players, matches, teams

//StatsMainScreenFire
//Rebuild using fire store to build list tiles

class StatsMainScreenFire extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(tabs: [
                  Tab(icon: Text("Players")),
                  Tab(icon: Text("Teams")),
                  Tab(icon: Text("Matches")),
                ]),
              ),
              drawer: Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: <Widget>[
                    DrawerHeader(
                      child: Text('Drawer Header'),
                      decoration: BoxDecoration(color: Colors.blue),
                    ),
                    HomeListTile(context, 'Home'),
                    StatsListTile(context, 'Stats'),
                    AccountListTile(context, 'Account'),
                    ContactListTile(context, 'Contact Us')
                  ],
                ),
              ),
              body: TabBarView(children: [
                BuildPlayerListFire(),
                BuildTeamListFire(),
              ]),
            )));
  }
}

/*
//Original Stats main screen
class StatsMainScreen extends StatelessWidget{
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
                    Tab(icon: Text("Matches")),
                  ]),
              title: Text("LStat"),
            ),
            body: TabBarView(
                children: [
                  buildPlayerListView(context),
                ]),
          )),
    );
  }
}
*/
