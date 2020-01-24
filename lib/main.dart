import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:menu/menu.dart';

import 'classes_page.dart';
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
  String classFilter = '';

  String currentDay = 'monday';
  LeisureCentre mdw = LeisureCentre();

  var _value;
  @override
  Widget build(BuildContext context) {
    List tempList = mdw.classList(classFilter);

    print('got tempList');
    List myList;
    var tmpClass = ['pump','sprint','yoga','zumba','boxer'];
    final choices = List<Widget>.generate(tmpClass.length, (i) {

      return ChoiceChip(
       pressElevation: 0.0,
       selectedColor: Colors.blue,
       backgroundColor: Colors.grey[100],
       label: Text(tmpClass[i]),
       selected: _value == tmpClass[i],
       onSelected: (bool selected) {
         setState(() {
           _value = selected ? tmpClass[i] : null;
           classFilter = _value == tmpClass[i] ? tmpClass[i]:'';
         },);
       },
     );
    });

    final pages = List<Widget>.generate(7, (i) {
      myList = tempList.where((e) => e.day == mdw.days[i]).toList();
      return ClassesPage(
        myList: myList,
      );
    });
    final pagesAllDays = List<Widget>.generate(1, (i) {
      myList = tempList;//.where((e) => e.day == mdw.days[i]).toList();
      return ClassesPage(
        myList: myList,
      );
    });
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: Text('$currentDay - ${classFilter==""?'all classes':classFilter}'),
      ),

      body: Flex(
        direction: Axis.vertical,
        children: <Widget>[
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: GridView.count(
              crossAxisCount: 5,

              children:  choices
            ),
          ),
          Flexible(
            flex: 18,
            fit: FlexFit.tight,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
              child: PageView(
                children: pagesAllDays,//pages,
                onPageChanged: (int page) {
                  setState(() {
                    currentDay = mdw.days[page];
                  });
                },
              ),
            ),
          ),
        ],
      ),
//      floatingActionButton: FloatingActionButton(
//        onPressed: () {},
//        tooltip: 'Increment',
//        child: Icon(Icons.android),
//      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
