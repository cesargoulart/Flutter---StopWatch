import 'dart:async';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Time",
      theme: ThemeData(
        primarySwatch: Colors.blue
       ),
       home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> with TickerProviderStateMixin{

  TabController tb;
  int hour = 0;
  int mini = 0;
  int second = 0;
  bool started = true;
  bool stopped = true;
  String timetodisplay = "";
  bool checktimer = true;

  @override
  void initState(){
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  void start(){
    setState(() {
      started = false;
      stopped = false;
    });
    var timeForTimer = ((hour * 60 * 60) + (mini * 60) + second);
    Timer.periodic(Duration(
      seconds: 1,

    ), (Timer t){
      setState(() {
        if(timeForTimer < 1 || checktimer == false) {
          t.cancel();
          if (timeForTimer == 0) {
          

          }
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder:  (context) => Homepage(),
            ));

        }
        else if (timeForTimer < 60) {
          timetodisplay = timeForTimer.toString();
          timeForTimer = timeForTimer - 1;
        } else if (timeForTimer < 3600) {
          int m = timeForTimer ~/ 60;
          int s = timeForTimer - (60 * m);
          timetodisplay = m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer - 1;

        } else {
          int h = timeForTimer ~/ 3600;
          int t = timeForTimer - (3600 * h);
          int m = t ~/ 60; 
          int s = t - (60 * m);
          timetodisplay = 
            h.toString() + ":" + m.toString() + ":" + s.toString();
          timeForTimer = timeForTimer - 1;

        }
        
      });
  });
  }
    void stop(){
      setState(() {
        started = true;
        stopped = true;
        checktimer = false;

      });

  }


  Widget timer (){
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10.0,

                    ),
                    child: Text(
                      "HH",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    ),

                  ),
                  NumberPicker.integer(
                    initialValue: hour,
                    minValue: 0,
                    maxValue: 23,
                    listViewWidth: 60.0,
                    onChanged: (val) {
                      setState(() {
                        hour = val;
                      });

                    },
                  )

                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10.0,

                    ),
                    child: Text(
                      "Min",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    ),

                  ),
                  NumberPicker.integer(
                    initialValue: mini,
                    minValue: 0,
                    maxValue: 23,
                    listViewWidth: 60.0,
                    onChanged: (val) {
                      setState(() {
                        mini = val;
                      });

                    },
                  )

                ],
              ),

              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: 10.0,

                    ),
                    child: Text(
                      "Seg",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w700),
                    ),

                  ),
                  NumberPicker.integer(
                    initialValue: second,
                    minValue: 0,
                    maxValue: 23,
                    listViewWidth: 60.0,
                    onChanged: (val) {
                      setState(() {
                        second = val;
                      });

                    },
                  )

                ],
              ),
            ],

            ), 

          ),
          Expanded(
            flex: 1,
            child: Text(
              timetodisplay,
              style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.w600),
            ),

          ),
          Expanded(
            flex: 3,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                RaisedButton(
                  onPressed: started ? start : null,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0,
                  ),
                  color: Colors.green,
                  child: Text(
                    "Começar",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                  ),
                ),
                RaisedButton(
                  onPressed: stopped ? null : stop,
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 10.0
                  ),
                  color: Colors.red,
                  child: Text("Parar",
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white
                  )
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                )
              ],
            )

           
          ),
        ],
        
      ),

    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Projecto do Tempo"
        ),
        centerTitle: true,
        bottom: TabBar(
          tabs: <Widget>[
            Text("Tempo"
            ),
            Text(
              "Cronometro")
          ],
          labelPadding: EdgeInsets.only(
            bottom: 10.0
          ),
          labelStyle: TextStyle(
            fontSize: 18.0
          ),
          unselectedLabelColor: Colors.white60,
          controller: tb,
        ),
      ),
      body: TabBarView(
        children: <Widget>[
          timer(),
          Text(
            "Cronometro"
          )
        ],  
        controller: tb  
      ),
    );
  }
}