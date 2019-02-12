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
