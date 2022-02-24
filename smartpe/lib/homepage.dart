import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'bottomNav.dart';
import 'globals.dart' as globals;

class HomePage extends StatefulWidget {
  HomePage({Key key, this.uid}) : super(key : key);
  final String uid;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _sljController = TextEditingController(); //standing long jump
  final _rsController = TextEditingController(); //rope skipping
  final _lrController = TextEditingController(); //long run
  final _ppController = TextEditingController(); //ping pong
  final _sprController = TextEditingController(); //sprint

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("HomePage")),
      resizeToAvoidBottomInset: false,
      body: Container(
          padding: EdgeInsets.all(30.0),
          color: Colors.white,
          child: Center(
              child: Column(children: [
            Padding(padding: EdgeInsets.only(top: 30)),
            Text('Record Test Result',
                style: TextStyle(color: Color(0xffF2A03D), fontSize: 30)),
            Padding(padding: EdgeInsets.only(top: 20)),
            TextFormField(
                decoration: InputDecoration(
                    labelText: "Standing long jump (立定跳远)/cm",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderSide: BorderSide())),
                validator: (val) {
                  if (val.length == 0) {
                    return "Can't be empty";
                  }
                  if (double.tryParse(val) == null) {
                    return "Please input a number";
                  }
                },
                controller: _sljController,
                style: TextStyle(fontFamily: "Poppins")),
            Padding(padding: EdgeInsets.only(top: 20)),
            TextFormField(
                decoration: InputDecoration(
                    labelText: "Rope skipping (跳绳)/次",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderSide: BorderSide())),
                validator: (val) {
                  if (val.length == 0) {
                    return "Can't be empty";
                  }
                  if (double.tryParse(val) == null) {
                    return "Please input a number";
                  }
                },
                controller: _rsController,
                style: TextStyle(fontFamily: "Poppins")),
            Padding(padding: EdgeInsets.only(top: 20)),
            TextFormField(
                decoration: InputDecoration(
                    labelText: "Long run (1000米跑)/秒",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderSide: BorderSide())),
                validator: (val) {
                  if (val.length == 0) {
                    return "Can't be empty";
                  }
                  if (double.tryParse(val) == null) {
                    return "Please input a number";
                  }
                },
                controller: _lrController,
                style: TextStyle(fontFamily: "Poppins")),
            Padding(padding: EdgeInsets.only(top: 20)),
            TextFormField(
                decoration: InputDecoration(
                    labelText: "Ping Pong (乒乓球)/次",
                    fillColor: Colors.white,
                    border: OutlineInputBorder(borderSide: BorderSide())),
                validator: (val) {
                  if (val.length == 0) {
                    return "Can't be empty";
                  }
                  if (double.tryParse(val) == null) {
                    return "Please input a number";
                  }
                },
                controller: _ppController,
                style: TextStyle(fontFamily: "Poppins")),
            Padding(padding: EdgeInsets.only(top: 20)),
            TextFormField(
              decoration: InputDecoration(
                  labelText: "Sprint (50米跑)/0.01秒",
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderSide: BorderSide())),
              validator: (val) {
                if (val.length == 0) {
                  return "Can't be empty";
                }
                if (double.tryParse(val) == null) {
                  return "Please input a number";
                }
              },
              controller: _sprController,
              style: TextStyle(fontFamily: "Poppins"),
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
                width: 200,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: BorderSide(color: Colors.white)),
                  textColor: Colors.white,
                  child: Text("Submit", style: TextStyle(fontSize: 25)),
                  color: Color(0xffF2A03D),
                  onPressed: () {
                    print("onpressed");                    
                    //var timestamp = DateTime.now().millisecondsSinceEpoch;
                    DateTime _now = DateTime.now();
                    var timestamp = 'T' + '${_now.day}${_now.hour}${_now.minute}${_now.second}${_now.millisecond}' + '/';
                    print(timestamp);
                    String folder_url = "StuID" + globals.uid + "/" + timestamp;
                    String slj = _sljController.text.trim();
                    String rs = _rsController.text.trim();
                    String pp = _ppController.text.trim();
                    String lr = _lrController.text.trim();
                    String spr = _sprController.text.trim();
                    // print("立定跳远");
                    // print(slj);
                    // print("跳绳");
                    // print(rs);
                    // print("长跑");
                    // print(lr);
                    // print("乒乓球");
                    // print(pp);
                    // print("短跑");
                    // print(spr);
                    print(lr);
                    if (int.tryParse(slj + rs + pp + lr + spr) == null) {
                      print("Invoid data, please try again");
                      showDialog(
                        context: context,
                        builder: (BuildContext context){
                          return AlertDialog(
                            title: new Text("Wrong Input", style: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.bold)),
                            content: new Text("Wrong Data Type, please use the number onlly"),
                            actions: <Widget> [
                              new FlatButton(
                                child: new Text("OK"),
                                onPressed: (){
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      print("Start to upload data");
                      print("User ID:");
                      print(widget.uid);
                      FirebaseDatabase.instance.reference().child(folder_url).set(
                        {
                          "立定跳远" : slj,
                          "跳绳" : rs,
                          "长跑" : lr,
                          "乒乓球" : pp,
                          "短跑" : spr
                        }
                      ).then((val) {
                          showDialog(
                          context: context,
                          builder: (BuildContext context){
                            return AlertDialog(
                              title: new Text("Success", style: TextStyle(color: Colors.greenAccent, fontSize: 30, fontWeight: FontWeight.bold)),
                              content: new Text("Upload Success"),
                              actions: <Widget> [
                                new FlatButton(
                                  child: new Text("OK"),
                                  onPressed: (){
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }).catchError((err) {
                        print(err);
                      });
                    }},
                ))
          ]))),
      bottomNavigationBar: BottomNavBar(currentIndex: 0),
    );
  }
}
