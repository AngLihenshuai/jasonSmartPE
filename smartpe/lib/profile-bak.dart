import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'bottomNav.dart';
import 'recommand.dart';
import 'longRunDetail.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
    
  // Future getFirebaseData(String uid) async {
  //   //List PicList = [{"url": "https://firebasestorage.googleapis.com/v0/b/amnesiapuzzle.appspot.com/o/images%2Fw386V3dzLvh9EvQvSp6y1X5H6He2%2F2020-07-16%2017%3A00%3A22.497803.png?alt=media&token=cb535d08-66ce-4fa1-9d58-14bd9551abc0"}];
  //   await FirebaseDatabase.instance.reference().child('StuIDJDXzxmrwKDU95LUS33N4ikaFiNB3/').once().then((Snapshot) {
  //     print("get data successfully");
  //     print(Snapshot.value);
  //     //List PicTemList = [];
  //     Snapshot.value.forEach((key, val) {
  //       print(key);
  //       print(val);
  //       //PicList.add(val);
  //       //PicTemList.add(val);
  //     });
  //     // PicList = PicTemList;
  //   }).catchError(
  //     (Error) {
  //       print(Error);    
  //     }
  //   );
  //     return;
  //   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: 
      
      // Container(
      //   child: Center(child: Text("Text"))
      // ),
      
      // SingleChildScrollView(        
      //     child: Column(
      //         mainAxisSize: MainAxisSize.min,
      //         verticalDirection: VerticalDirection.down,
      ListView(        
              children: [
             Card(
                 child: Container(
                  height: 120,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          //child: 
                          
                         // Expanded(
                            child:Image.asset("asset/jump.png"),
                          //  flex:2 ,
                          //),
                        ),
                      ),
                      //Expanded(
                        //child:
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              //Expanded(
                                //flex: 5,
                                //child: 
                                ListTile(
                                  title: Text("Long Jump", style: TextStyle(fontSize: 30)),
                                  subtitle: Text("Good Score with records", style: TextStyle(color: Colors.greenAccent)),
                                ),
                              //),
                              //Expanded(
                                //flex: 5,
                                //child: 
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child:Text("6 Records"),
                                      onPressed: ()
                                      {},
                                    ),
                                    SizedBox(width: 8,),
                                    TextButton(
                                      child: Text("95 Scores", style: TextStyle(color: Colors.greenAccent)),
                                      onPressed: (){},
                                    ),
                                    SizedBox(width: 8,)
                                  ],
                                ),
                              //)
                            ],
                          ),
                        ),
                        //flex:8 ,
                      //),
                    ],
                  ),
                ),
               // elevation: 8,
                //margin: EdgeInsets.all(10),
              ),

             Card(
                 child: Container(
                  height: 120,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          //child: 
                          //Expanded(
                            child:Image.asset("asset/rope.png"),
                            //flex:2 ,
                          //),
                        ),
                      ),
                      //Expanded(
                        //child:
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              //Expanded(
                                //flex: 5,
                                //child: 
                                ListTile(
                                  title: Text("Rope Skipping", style: TextStyle(fontSize: 30)),
                                  subtitle: Text("Good Score with records", style: TextStyle(color: Colors.greenAccent)),
                                ),
                              //),
                              //Expanded(
                                //flex: 5,
                                //child: 
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child:Text("6 Records"),
                                      onPressed: ()
                                      {},
                                    ),
                                    SizedBox(width: 8,),
                                    TextButton(
                                      child: Text("95 Scores", style: TextStyle(color: Colors.greenAccent)),
                                      onPressed: (){},
                                    ),
                                    SizedBox(width: 8,)
                                  ],
                                ),
                              //)
                            ],
                          ),
                        ),
                        //flex:8 ,
                      //),
                    ],
                  ),
                ),
               // elevation: 8,
                //margin: EdgeInsets.all(10),
              ),

            // Card(
            //     child:Container(
            //       height: 120,
            //       color: Colors.white,
            //       child: Row(
            //         children: [
            //           Center(
            //             child: Padding(
            //               padding: EdgeInsets.all(10),
            //               child: Expanded(
            //                 child:Image.asset("asset/rope.png"),
            //                 flex:2 ,
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child:Container(
            //               alignment: Alignment.topLeft,
            //               child: Column(
            //                 children: [
            //                   Expanded(
            //                     flex: 5,
            //                     child: ListTile(
            //                       title: Text("Rope Skipping", style: TextStyle(fontSize: 30)),
            //                       subtitle: Text("Good Score with records", style: TextStyle(color: Colors.greenAccent)),
            //                     ),
            //                   ),
            //                   Expanded(
            //                     flex: 5,
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: [
            //                         TextButton(
            //                           child:Text("6 Records"),
            //                           onPressed: ()
            //                           {},
            //                         ),
            //                         SizedBox(width: 8,),
            //                         TextButton(
            //                           child: Text("95 Scores", style: TextStyle(color: Colors.greenAccent)),
            //                           onPressed: (){},
            //                         ),
            //                         SizedBox(width: 8,)
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //             flex:8 ,
            //           ),
            //         ],
            //       ),
            //     ),
            //     elevation: 8,
            //     margin: EdgeInsets.all(10),
            //   ),
            Card(
                 child: Container(
                  height: 120,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          //child: Expanded(
                            child:Image.asset("asset/longrun.png"),
                            //flex:2 ,
                          //),
                        ),
                      ),
                      //Expanded(
                        //child:
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              //Expanded(
                                //flex: 5,
                                //child: 
                                ListTile(
                                  title: Text("Long Run", style: TextStyle(fontSize: 30)),
                                  subtitle: Text("Good Score with records", style: TextStyle(color: Colors.greenAccent)),
                                ),
                              //),
                              //Expanded(
                                //flex: 5,
                                //child: 
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child:Text("6 Records"),
                                      onPressed: ()
                                      {},
                                    ),
                                    SizedBox(width: 8,),
                                    TextButton(
                                      child: Text("95 Scores", style: TextStyle(color: Colors.greenAccent)),
                                      onPressed: (){},
                                    ),
                                    SizedBox(width: 8,)
                                  ],
                                ),
                              //)
                            ],
                          ),
                        ),
                        //flex:8 ,
                      //),
                    ],
                  ),
                ),
               // elevation: 8,
                //margin: EdgeInsets.all(10),
              ),

            // Card(
            //     child:Container(
            //       height: 120,
            //       color: Colors.white,
            //       child: Row(
            //         children: [
            //           Center(
            //             child: Padding(
            //               padding: EdgeInsets.all(10),
            //               child: Expanded(
            //                 child:Image.asset("asset/longrun.png"),
            //                 flex:2 ,
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child:Container(
            //               alignment: Alignment.topLeft,
            //               child: Column(
            //                 children: [
            //                   Expanded(
            //                     flex: 5,
            //                     child: ListTile(
            //                       title: Text("Long Run", style: TextStyle(fontSize: 30)),
            //                       subtitle: Text("Good Score with records", style: TextStyle(color: Colors.greenAccent)),
            //                     ),
            //                   ),
            //                   Expanded(
            //                     flex: 5,
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: [
            //                         TextButton(
            //                           child:Text("6 Records"),
            //                           onPressed: ()
            //                           {},
            //                         ),
            //                         SizedBox(width: 8,),
            //                         TextButton(
            //                           child: Text("95 Scores", style: TextStyle(color: Colors.greenAccent)),
            //                           onPressed: (){},
            //                         ),
            //                         SizedBox(width: 8,)
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //             flex:8 ,
            //           ),
            //         ],
            //       ),
            //     ),
            //     elevation: 8,
            //     margin: EdgeInsets.all(10),
            //   ),
                        Card(
                 child: Container(
                  height: 120,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          //child: Expanded(
                            child:Image.asset("asset/pingpong.png"),
                            //flex:2 ,
                          //),
                        ),
                      ),
                      //Expanded(
                        //child:
                        Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              //Expanded(
                                //flex: 5,
                                //child: 
                                ListTile(
                                  title: Text("Ping Pong", style: TextStyle(fontSize: 30)),
                                  subtitle: Text("Good Score with records", style: TextStyle(color: Colors.greenAccent)),
                                ),
                              //),
                              //Expanded(
                                //flex: 5,
                                //child: 
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child:Text("6 Records"),
                                      onPressed: ()
                                      {},
                                    ),
                                    SizedBox(width: 8,),
                                    TextButton(
                                      child: Text("95 Scores", style: TextStyle(color: Colors.greenAccent)),
                                      onPressed: (){},
                                    ),
                                    SizedBox(width: 8,)
                                  ],
                                ),
                              //)
                            ],
                          ),
                        ),
                        //flex:8 ,
                      //),
                    ],
                  ),
                ),
               // elevation: 8,
                //margin: EdgeInsets.all(10),
              ),
            //   Card(
            //     child:Container(
            //       height: 120,
            //       color: Colors.white,
            //       child: Row(
            //         children: [
            //           Center(
            //             child: Padding(
            //               padding: EdgeInsets.all(10),
            //               child: Expanded(
            //                 child:Image.asset("asset/pingpong.png"),
            //                 flex:2 ,
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child:Container(
            //               alignment: Alignment.topLeft,
            //               child: Column(
            //                 children: [
            //                   Expanded(
            //                     flex: 5,
            //                     child: ListTile(
            //                       title: Text("Ping Pong", style: TextStyle(fontSize: 30)),
            //                       subtitle: Text("Good Score with records", style: TextStyle(color: Colors.greenAccent)),
            //                     ),
            //                   ),
            //                   Expanded(
            //                     flex: 5,
            //                     child: Row(
            //                       mainAxisAlignment: MainAxisAlignment.end,
            //                       children: [
            //                         TextButton(
            //                           child:Text("6 Records"),
            //                           onPressed: ()
            //                           {},
            //                         ),
            //                         SizedBox(width: 8,),
            //                         TextButton(
            //                           child: Text("95 Scores", style: TextStyle(color: Colors.greenAccent)),
            //                           onPressed: (){},
            //                         ),
            //                         SizedBox(width: 8,)
            //                       ],
            //                     ),
            //                   )
            //                 ],
            //               ),
            //             ),
            //             flex:8 ,
            //           ),
            //         ],
            //       ),
            //     ),
            //     elevation: 8,
            //     margin: EdgeInsets.all(10),
            //   ),
              Card(
                child:Container(
                  height: 120,
                  color: Colors.white,
                  child: Row(
                    children: [
                      Center(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Image.asset("asset/sprint.png"),

                          // Expanded(
                          //   //child:Image.asset("asset/sprint.png"),
                          //   //child: Image.network('https://www.google.com/imgres?imgurl=https%3A%2F%2Fimg.ixintu.com%2Fdownload%2Fjpg%2F20200718%2F7e6d74c08c2622fa3bac43ed903e9ca8_512_512.jpg!bg&imgrefurl=https%3A%2F%2Fixintu.com%2Fsucai%2F0yqPaWkPq.html&tbnid=VGim1dFqOMwaGM&vet=12ahUKEwjzwe_Ep7fzAhWWpZ4KHULtBwIQMyhSegUIARCDAQ..i&docid=mat_GASMlZB2rM&w=380&h=380&q=%E9%95%BF%E8%B7%91%E5%9B%BE%E6%A0%87&ved=2ahUKEwjzwe_Ep7fzAhWWpZ4KHULtBwIQMyhSegUIARCDAQ'),
                          //   child: Text("Testing"),
                          //   flex:2 ,
                          // ),
                        ),
                      ),
                      //Expanded(child:
                      
                      Container(
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: [
                              // Expanded(
                              //   flex: 5,
                              //   child:                                 
                                ListTile(
                                  title: Text("Sprint", style: TextStyle(fontSize: 30)),
                                  subtitle: Text("Good Score with records", style: TextStyle(color: Colors.greenAccent)),
                                ),
                              //),
                              // Expanded(
                              //   flex: 5,
                              //   child: 
                                
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    TextButton(
                                      child:Text("6 Records"),
                                      onPressed: ()
                                      {},
                                    ),
                                    SizedBox(width: 8,),
                                    TextButton(
                                      child: Text("95 Scores", style: TextStyle(color: Colors.greenAccent)),
                                      onPressed: (){},
                                    ),
                                    SizedBox(width: 8,)
                                  ],
                                ),
                              //)
                            ],
                          ),
                        ),
                      //   flex:8 ,
                      // ),
                    ],
                  ),
                ),
                elevation: 8,
                margin: EdgeInsets.all(10),
              ),
      
            //   Container(
            //       margin: EdgeInsets.all(20),
            //       width: 200,
            //       height: 60.0,
            //       child: RaisedButton(
            //         shape: RoundedRectangleBorder(
            //             borderRadius: BorderRadius.circular(20.0),
            //             side: BorderSide(color: Color(0xff64B6FF))),
            //         textColor: Color(0xff64B6FF),
            //         child: Text(
            //           "create",
            //           style: TextStyle(fontSize: 22),
            //         ),
            //         color: Colors.white,
            //         onPressed: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => RecommandPage()));
            //         },
            //       )),
              
              
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
                      "test",
                      style: TextStyle(fontSize: 22),
                    ),
                    color: Colors.white,
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DetailSubject()));
                    },
                  )),
          ]),
          //)),
      bottomNavigationBar: BottomNavBar(currentIndex: 1),
    );
  }
}