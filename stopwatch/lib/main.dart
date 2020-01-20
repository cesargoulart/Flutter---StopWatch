import 'package:flutter/material.dart';

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

  void initState(){
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }
  Widget timer (){
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 6,
            child: Text(
              "6"
            ),

          ),
          Expanded(
            flex: 1,
            child: Text(
              "1"
            ),

          ),
          Expanded(
            flex: 3,
            child: Text(
              "3"
            ),

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