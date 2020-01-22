import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'event.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Timetable',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Timetable'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  LeisureCentre mdw = LeisureCentre();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 8.0 / 3.0,
          children: List.generate(mdw.events.length, (index) {
            return Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    mdw.events[index].day,
                    style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.body1),
                  ),
                  Text(
                    mdw.events[index].name,
                    style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.body1),
                  ),
                  Text(
                    "${mdw.events[index].start} to ${mdw.events[index].finish} ",
                    style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.body2),
                  ),
                ],
              ),
            ); //robohash.org api provide you different images for any number you are giving
          }),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.android),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
