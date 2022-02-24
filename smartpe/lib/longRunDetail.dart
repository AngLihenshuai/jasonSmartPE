import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DetailSubject extends StatefulWidget {
  @override
  _DetailSubjectState createState() => _DetailSubjectState();
}

getData() {
  print("Clicking...");
  FirebaseDatabase.instance.reference().child('').once().then((Snapshot) {
    print("get data successfully");
    print(Snapshot.value);
    Snapshot.value.forEach((key, val) {
      print(key);
      print(val);
    });
  }).catchError((Error) {
    print(Error);
  });
}

class _DetailSubjectState extends State<DetailSubject> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail")),
        body: Center(
          child: RaisedButton(
            child: Text('Get Jason Data'),
            onPressed: () {
              getData();
            },
          ),
        ));
  }
}
