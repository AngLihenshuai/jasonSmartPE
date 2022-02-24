import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'globals.dart' as globals;
import 'register.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  //LoginPage({Key key, this.title}):super(key:key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Login")),
      body: Center(
        child: Column(
          children: [
            Expanded(
              flex: 40,
              child: Image.asset("asset/login.jpg", fit: BoxFit.cover)
            ),
            Text("Login", style: TextStyle(color: Colors.blue, fontSize: 50, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal)),
            SizedBox(height: 10),
            Container(
              margin: EdgeInsets.only(top:20,left:20,bottom:20,right:20),
              width: 400,
              child: TextField(
                controller: emailController,
                obscureText: false,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
                  hintText: "Email",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32)
                  )
                )
              )
            ),
            Container(
              margin: EdgeInsets.only(top:20,left:20,bottom:20,right:20),
              width: 400,
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(20,15,20,15),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32)
                  )
                )
              )
            ),
            SizedBox(height: 10),
            Container(
              width: 200,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                  side: BorderSide(color: Colors.blue)
                ),
                textColor: Colors.white,
                child: Text("Login"),
                onPressed: () {
                  print("We will start the login process");
                  print("email:");
                  print(emailController.text);
                  print("password:");
                  print(passwordController.text);
                  FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text, password: passwordController.text
                  ).then((val){                    
                    print("Login Succesfully");
                    print("#######################Uid is:#######################");
                    print(val.user.uid);
                    globals.uid = val.user.uid; 
                    Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage(uid:val.user.uid)));                    
                  }).catchError((error){
                    print(error);
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: new Text("Login Failed", style: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.bold)),
                          content: new Text("Your login has failed. Please check your email and password again."),
                          actions: <Widget> [
                            new FlatButton(
                              child: new Text("Close"),
                              onPressed: (){
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  });
                }
              )
            ),
            SizedBox(height: 20),
            Container(
              width: 200,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                  side: BorderSide(color: Colors.blue)
                ),
                textColor: Colors.white,
                child: Text("Go to Register"),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => RegisterPage()
                  ));
                }
              )
            ),
            SizedBox(height: 10),
          ],
        )
      )
    );
  }
}