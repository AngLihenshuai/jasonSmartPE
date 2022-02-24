import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'bottomNav.dart';
import 'recommand.dart';
import 'globals.dart' as globals;

//import 'recommand.dart';
//import 'longRunDetail.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {    
    
    double longRunAverage = 0;
    var skippingAverage;            
    var jumpAverage;
    var shortRunAverage;
    var pingPangAverage;

    Future getFirebaseData() async {
      await FirebaseDatabase.instance.reference().child("StuID" + globals.uid + '/').once().then((Snapshot) {
        print("get data successfully");
        print(Snapshot.value);      
        List longRunScore = [];            
        List skippingScore = [];
        List jumpScore = [];
        List shortRunScore = [];
        List pingPangScore = [];
        Snapshot.value.forEach((key, val) {
          val.forEach((key, val) {
              if (key == "长跑") {
                longRunScore.add(int.parse(val));
              } else if (key == "跳绳") {
                skippingScore.add(int.parse(val));
              } else if (key == "立定跳远") {
                jumpScore.add(int.parse(val));
              } else if (key == "短跑") {
                shortRunScore.add(int.parse(val));
              } else if (key == "乒乓球") {
                pingPangScore.add(int.parse(val));
              } else {
                print("No such item");
              }
            }
          );        
          //print();
        });
        var longRunSum = longRunScore.reduce((a, b) => a + b);
        longRunAverage = longRunSum / longRunScore.length;
        var skippingSum = skippingScore.reduce((a, b) => a + b);
        skippingAverage = skippingSum / skippingScore.length;
        var jumpSum = jumpScore.reduce((a, b) => a + b);
        jumpAverage = jumpSum / jumpScore.length;
        var shortRunSum = shortRunScore.reduce((a, b) => a + b);
        shortRunAverage = shortRunSum / shortRunScore.length;
        var pingPangSum = pingPangScore.reduce((a, b) => a + b);
        pingPangAverage = pingPangSum / pingPangScore.length;
        print(longRunAverage);
        print(skippingAverage);
        print(jumpAverage);
        print(shortRunAverage);
        print(pingPangAverage);
        // PicList = PicTemList;
        setState(() {});
      }).catchError(
        (Error) {
          print(Error);    
        }
      );
        return;
    }

  void initState() {
    super.initState();
    getFirebaseData();
  }

  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: ListView(
      padding: const EdgeInsets.all(8),
      children:       
      <Widget>[
        ListTile(
          title: Text("Jumping", style: TextStyle(fontSize: 25)),
          subtitle: Text("Average Score " + jumpAverage.toString(), style: TextStyle(fontSize: 16)),
          leading: CircleAvatar(backgroundImage: AssetImage("asset/jump.png")),
          trailing: jumpAverage == null? Icon(Icons.star, color: Colors.white) :jumpAverage >= 100? Icon(Icons.star, color: Colors.greenAccent) :jumpAverage >= 60? Icon(Icons.star, color: Colors.yellowAccent) : Icon(Icons.star, color: Colors.redAccent)
          ),        
        ListTile( 
          title: Text("Skipping", style: TextStyle(fontSize: 25)),
          subtitle: Text("Average Score " + skippingAverage.toString(), style: TextStyle(fontSize: 16)),
          leading: CircleAvatar(backgroundImage: AssetImage("asset/rope.png")),
          trailing: skippingAverage == null? Icon(Icons.star, color: Colors.white) :skippingAverage >= 100? Icon(Icons.star, color: Colors.greenAccent) :skippingAverage >= 60? Icon(Icons.star, color: Colors.yellowAccent) : Icon(Icons.star, color: Colors.redAccent)),                  
        ListTile( 
          title: Text("Long Run",
          style: TextStyle(fontSize: 25)),
          subtitle: Text("Average Score " + longRunAverage.toString(), style: TextStyle(fontSize: 16)),
          leading:  CircleAvatar(backgroundImage: AssetImage("asset/longrun.png")), 
          trailing: longRunAverage == null? Icon(Icons.star, color: Colors.white) :longRunAverage >= 100? Icon(Icons.star, color: Colors.greenAccent) :longRunAverage >= 60? Icon(Icons.star, color: Colors.yellowAccent) : Icon(Icons.star, color: Colors.redAccent)),
        ListTile( 
          title: Text("Sprint", style: TextStyle(fontSize: 25)),
          subtitle: Text("Average Score " + shortRunAverage.toString(), style: TextStyle(fontSize: 16)),
          leading:  CircleAvatar(backgroundImage: AssetImage("asset/sprint.png")),          
          trailing: shortRunAverage == null? Icon(Icons.star, color: Colors.white) :shortRunAverage >= 100? Icon(Icons.star, color: Colors.greenAccent) :shortRunAverage >= 60? Icon(Icons.star, color: Colors.yellowAccent) : Icon(Icons.star, color: Colors.redAccent)),
        ListTile( 
          title: Text("Ping Pong", style: TextStyle(fontSize: 25)),
          subtitle: Text("Average Score " + pingPangAverage.toString(), style: TextStyle(fontSize: 16)),
          leading:  CircleAvatar(backgroundImage: AssetImage("asset/pingpong.png")),
          trailing: pingPangAverage == null? Icon(Icons.star, color: Colors.white) :pingPangAverage >= 100? Icon(Icons.star, color: Colors.greenAccent) :pingPangAverage >= 60? Icon(Icons.star, color: Colors.yellowAccent) : Icon(Icons.star, color: Colors.redAccent)),
        Container(
            margin: EdgeInsets.all(20),
            width: 200,
            height: 60.0,
            child: RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: BorderSide(color: Color(0xff64B6FF))),
              textColor: Color(0xff64B6FF),
              child: Text(
                "Recommandition",
                style: TextStyle(fontSize: 22),
              ),
              color: Colors.white,
              onPressed: () {                
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => RecommandPage()
                  ));
              },
            )),
      ],
    ),          
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}