import 'package:flutter/material.dart';
import 'StatsMainScreen.dart';
import 'LstatPackage.dart';

//TODO navigation tab
//Home, stats, favorites, account, contact
//TODO Home screen
//News? Matches? Player of the Week?
//Version of score moving up/down

class HomeScreenApp extends StatelessWidget {
  final appTitle = 'LStat';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: appTitle,
      home: MyHomeScreen(title: appTitle),
    );
  }
}

class MyHomeScreen extends StatelessWidget {
  final String title;

  MyHomeScreen({Key key, this.title}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: Center(child: Text('Home Screen!'),),
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
    );
  }

}

