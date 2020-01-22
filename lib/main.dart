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
    List myList = mdw.classList('b');
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 8.0 / 4.0,
          children: List.generate(myList.length, (index) {
            return Card(
              color: myList[index].day == 'monday'
                  ? Colors.blue
                  : myList[index].day == 'tueday'
                      ? Colors.yellow
                      : myList[index].day == 'wednesday'
                          ? Colors.green
                          : myList[index].day == 'thursday'
                              ? Colors.orange
                              : myList[index].day == 'friday'
                                  ? Colors.pink
                                  : myList[index].day == 'saturday'
                                      ? Colors.teal
                                      : Colors.amber,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      myList[index].day + ': ' + myList[index].shortName,
                      style: GoogleFonts.lato(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                    Text(
                      "${myList[index].start} to ${myList[index].finish} ",
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ],
                ),
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
