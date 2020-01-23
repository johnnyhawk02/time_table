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
  String currentDay = 'monday';
  LeisureCentre mdw = LeisureCentre();
  @override
  Widget build(BuildContext context) {
    List tempList = mdw.classList('');
    List myList;
    final pages = List<Widget>.generate(7, (i) {
      myList = tempList.where((e) => e.day == mdw.days[i]).toList();
      return Center(
        child: GridView.count(
          crossAxisCount: 2,
          childAspectRatio: 8.0 / 4.0,
          children: List.generate(myList.length, (index) {
            return Card(
              color: myList[index].name.toLowerCase().contains('pump')
                  ? Colors.blue
                  : myList[index].name.toLowerCase().contains('sprint')
                      ? Colors.yellow
                      : myList[index].name.toLowerCase().contains('zumba')
                          ? Colors.green
                          : myList[index].name.toLowerCase().contains('cx')
                              ? Colors.orange
                              : myList[index]
                                      .name
                                      .toLowerCase()
                                      .contains('yoga')
                                  ? Colors.pink
                                  : myList[index]
                                          .name
                                          .toLowerCase()
                                          .contains('spin')
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
                      myList[index].shortName,
                      style: GoogleFonts.roboto(
                        textStyle: Theme.of(context).textTheme.display1,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "${myList[index].start} to ${myList[index].finish} ",
                      style: TextStyle(fontSize: 20.0),
                    ),
                  ],
                ),
              ),
            ); //robohash.org api provide you different images for any number you are giving
          }),
        ),
      );
    });
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text(currentDay),
      ),
      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flexible(
              flex: 1,
              fit: FlexFit.loose,
              child: Container (
                color: Colors.blue,
                child: Card(),
              ),),
          Flexible(
            flex: 5,
            fit: FlexFit.loose,
            child: PageView(
              children: pages,
              onPageChanged: (int page) {
                setState(() {
                  currentDay = mdw.days[page];
                });
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.android),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
