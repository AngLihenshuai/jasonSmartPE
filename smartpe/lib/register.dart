import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'login.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = new TextEditingController();
  final passwordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Register")),
      body: Column(
        children: [
          Expanded(
            flex:40,
            child: Image.asset("asset/login.jpg", fit: BoxFit.cover)
          ),
          Text("Sign Up", style: TextStyle(color: Colors.blue, fontSize: 50, fontWeight: FontWeight.bold, fontStyle: FontStyle.normal)),
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
                child: Text("Register"),
                onPressed: () {
                  print("We will start the signup process");
                  print("email:");
                  print(emailController.text);
                  print("password:");
                  print(passwordController.text);
                  FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text, password: passwordController.text).then((val){
                    print(val);
                    print("Successfully created an account");
                  }).catchError((error){
                    print(error);
                    showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: new Text("SignUp Failed", style: TextStyle(color: Colors.redAccent, fontSize: 30, fontWeight: FontWeight.bold)),
                          content: new Text("Your SignUp has failed. Email already exist."),
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
                child: Text("Go to Login"),
                onPressed: () {
                  Navigator.push(context,MaterialPageRoute(
                    builder: (context) => LoginPage()
                  ));
                }
              )
            ),
            SizedBox(height: 10),
        ],
      )
    );
  }
}