import 'dart:math';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'globals.dart' as globals;
import 'package:firebase_database/firebase_database.dart';

class RecommandPage extends StatefulWidget {
  @override
  _RecommandPageState createState() => _RecommandPageState();
}

class _RecommandPageState extends State<RecommandPage> {
    int longRunTimes;
    int skippingTimes;
    int jumpTimes;
    int shortRunTimes;
    int pingPangTimes;
    double longRunAverage;
    double skippingAverage;
    double jumpAverage;
    double shortRunAverage;
    double pingPangAverage;

    List<LinearSales> longRunPointList = [];
    List<LinearSales> skippingPointList = [];
    List<LinearSales> jumpPointList = [];
    List<LinearSales> shortRunPointList = [];
    List<LinearSales> pingPangPointList = [];
    bool showAvarageRecommand = false;
    bool showTrendRecommand = false;
    bool showAIRecommand = false;
    String avarageRecommandItem = "";
    String trendRecommandItem = "";

    Future getFirebaseData() async {
      await FirebaseDatabase.instance.reference().child("StuID" + globals.uid + '/').once().then((Snapshot) {
            print("get data successfully");
            print(Snapshot.value);            
            longRunPointList = [];
            skippingPointList = [];
            jumpPointList = [];
            shortRunPointList = [];
            pingPangPointList = [];
            longRunTimes = 0;
            skippingTimes = 0;
            jumpTimes = 0;
            shortRunTimes = 0;
            pingPangTimes = 0;
            longRunAverage = 0;
            skippingAverage = 0;
            jumpAverage = 0;
            shortRunAverage = 0;
            pingPangAverage = 0;
            avarageRecommandItem = "";
            print("######################");
            print("Load data");

            Snapshot.value.forEach((key, val) {
              val.forEach((key, val) {
                  if (key == "长跑") {
                    longRunPointList.add(LinearSales(longRunTimes, int.parse(val)));
                    longRunAverage = ((longRunAverage * longRunTimes) + int.parse(val)) / (longRunTimes + 1);
                    longRunTimes += 1;
                  } else if (key == "跳绳") {
                    skippingPointList.add(LinearSales(skippingTimes, int.parse(val)));
                    skippingAverage = ((skippingAverage * skippingTimes) + int.parse(val)) / (skippingTimes + 1);
                    skippingTimes += 1;
                  } else if (key == "立定跳远") {
                    jumpPointList.add(LinearSales(jumpTimes, int.parse(val)));
                    jumpAverage = ((jumpAverage * jumpTimes) + int.parse(val)) / (jumpTimes + 1);
                    jumpTimes += 1;
                  } else if (key == "短跑") {
                    shortRunPointList.add(LinearSales(shortRunTimes, int.parse(val)));
                    shortRunAverage = ((shortRunAverage * shortRunTimes) + int.parse(val)) / (shortRunTimes + 1);
                    shortRunTimes += 1;
                  } else if (key == "乒乓球") {
                    pingPangPointList.add(LinearSales(pingPangTimes, int.parse(val)));
                    pingPangAverage = ((pingPangAverage * pingPangTimes) + int.parse(val)) / (pingPangTimes + 1);
                    pingPangTimes += 1;
                  } else {
                    print("No such item");
                  }
                }
              );        
          });
          getAvarageRecommandItem();
          getTrendRecommandItem();
          setState(() {});
        }
      ).catchError((error){
        print(error);
      });
    }

  void initState() {
    super.initState();
    getFirebaseData();    
  }

  void getAvarageRecommandItem() {
    var averageList = [longRunAverage, skippingAverage, jumpAverage, shortRunAverage, pingPangAverage];
    averageList.sort();
    print(averageList);
    print(averageList.last);
    if (averageList.last == longRunAverage) {
      avarageRecommandItem = "Long Run";
    } else if (averageList.last == skippingAverage) {
      avarageRecommandItem = "Skipping";
    } else if (averageList.last == jumpAverage) {
      avarageRecommandItem = "Jump";
    } else if (averageList.last == shortRunAverage) {
      avarageRecommandItem = "Short Run";
    } else {
      avarageRecommandItem = "Ping Pang";
    }
    print(avarageRecommandItem);
  }

  void getTrendRecommandItem() {
    trendRecommandItem = "No recommand by trend";
    var typeList = [longRunPointList, skippingPointList, jumpPointList, shortRunPointList, pingPangPointList];    
    print("####################");
    for (int i = 0; i < longRunPointList.length; i++) {
      print(longRunPointList[i].sales);
    }
    for (int i = 0; i < typeList.length; i++) {
      if (typeList[i].length > 3) {
        bool recommandByTend = true;
        for (int j = typeList[i].length - 1; j < typeList[i].length; j++) {
          if (typeList[i][j].sales < typeList[i][j - 1].sales) {
            recommandByTend = false;
          }
        }
        if (recommandByTend == true) {
          if (i == 0) {
            trendRecommandItem = "Long Run";
          } else if (i == 1) {
            trendRecommandItem = "Skipping";
          } else if (i == 2) { 
            trendRecommandItem = "Jump";
          } else if (i == 3) { 
            trendRecommandItem = "Short Run";
          } else { 
            trendRecommandItem = "Ping Pang";
          }
        }        
      }
    }
  }  

  Widget _simpleLine() {
    var seriesList = [
      charts.Series<LinearSales, int>(
        id: 'Longrun',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.blueAccent),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        //dashPatternFn: (_, __) => [8, 2, 4, 2],
        data: longRunPointList,
        //data: data1,
      ),
      charts.Series<LinearSales, int>(
        id: 'Skipping',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.redAccent),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        //dashPatternFn: (_, __) => [8, 2, 4, 2],
        data: skippingPointList,
      ),
      charts.Series<LinearSales, int>(
        id: 'Jump',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.greenAccent),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        //dashPatternFn: (_, __) => [8, 2, 4, 2],
        data: jumpPointList,
      //)..setAttribute(charts.rendererIdKey, 'customArea'),
      ),
      charts.Series<LinearSales, int>(
        id: 'ShortRun',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.orangeAccent),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        //dashPatternFn: (_, __) => [8, 2, 4, 2],
        data: shortRunPointList,
      ),
      charts.Series<LinearSales, int>(
        id: 'PingPang',
        colorFn: (_, __) => charts.ColorUtil.fromDartColor(Colors.pinkAccent),
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        //dashPatternFn: (_, __) => [8, 2, 4, 2],
        data: pingPangPointList,
      ),
    ];

    return charts.LineChart(seriesList, animate: true, customSeriesRenderers: [
      charts.LineRendererConfig(
        // RendererId
        customRendererId: 'customArea',

        // 圆点大小
        radiusPx: 5.0,
        stacked: false,
        // 线的宽度
        strokeWidthPx: 2.0,
        // 是否显示线
        includeLine: true,
        // 是否显示圆点
        includePoints: true,
        // 是否显示包含区域
        includeArea: true,
        // 区域颜色透明度 0.0-1.0
        areaOpacity: 0.2,
      ),
    ]);
    //charts.LineChart(seriesList, animate: true);
  }

  BoxDecoration subjectDecoration() {
    return BoxDecoration(
      border: Border(
        left: BorderSide(
          color: Colors.blue[100],
          width: 15,
        ),
        top: BorderSide( 
          color: Colors.blue[300],
          width: 10.0,
        ),
        right: BorderSide(
          color: Colors.blue[500],
          width: 5.0,
        ),
        bottom: BorderSide(
          color: Colors.blue[800],
          width: 3.0,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("recommandPage")),
        body: Column(children: [
            SizedBox(height: 10),
            Container(height: 30, 
              child: Text("Trend Graph", style: TextStyle(color: Colors.blueAccent, fontSize: 25))
            ),
            SizedBox(height: 10),
            Container(height: 240, child: _simpleLine()),
            SizedBox(height: 30),
            Container(height: 30, 
                    child: Text("Recommandations", style: TextStyle(color: Colors.blueAccent, fontSize: 25))
                  ),
            SizedBox(height: 10),
            Container(
              decoration:BoxDecoration(
                border: Border.all(
                  //color: Colors.greenAccent,
                  width: 5.0,
                ),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: [
                  Container(              
                    child: 
                        ElevatedButton(onPressed: () {
                          setState(() {
                            showAvarageRecommand = !showAvarageRecommand;
                          });
                        }, child: Text("Recommand by Average Score")),                                
                        padding: EdgeInsets.all(5),
                    ),
                  showAvarageRecommand == true 
                  ?Container(
                      child: Text(avarageRecommandItem),                      
                      decoration: subjectDecoration(),
                      padding: EdgeInsets.all(5),
                  )
                  : Text(""), 
                  Container(
                    child: 
                        ElevatedButton(onPressed: () {
                          setState(() {
                            showTrendRecommand = !showTrendRecommand;
                          });
                        }, child: Text("Recommand by Score Trend")),
                        padding: EdgeInsets.all(5),
                    ),
                  showTrendRecommand == true
                  ?Container(
                      child: Text(trendRecommandItem), 
                      decoration: subjectDecoration(),
                      padding: EdgeInsets.all(5),
                    ): Text(""),
                  Container(
                    child: 
                        ElevatedButton(onPressed: () {
                          setState(() {
                            showAIRecommand = !showAIRecommand;
                          });
                        }, child: Text("Recommand by AI")),
                        padding: EdgeInsets.all(5),
                    ),
                  showAIRecommand == true 
                  ? Container(
                      child: Text("ShortRun"),
                      decoration: subjectDecoration(),
                      padding: EdgeInsets.all(5),
                    ): Text(""),
                  ],
                ),
              ),
            ]
          ));
    }
  }

  class LinearSales {
    final int year;
    final int sales;
    LinearSales(this.year, this.sales);
  }