import 'package:flutter/material.dart';
import 'package:timetable/event.dart';

class ClassesAllDays extends StatelessWidget {
  const ClassesAllDays({
    Key key,
    @required this.myList,
  }) : super(key: key);

   final List myList;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 1,
        childAspectRatio: 5,
        children: List.generate(myList.length, (index) {
          return Card(

            color: Colors.white,
            elevation: 4,
            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(18.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Stack(
                 children: <Widget>[
                   // CLASS NAME
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "${myList[index].day} ${myList[index].shortName}",
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ),
                  // VIRTUAL

                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "${myList[index].start} to ${myList[index].finish} ",
                      style: TextStyle(fontSize: 15.0),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      backgroundColor: myList[index].color,
                      //myList[index].shortName.toLowerCase().contains('pump')?Colors.red:Colors.blue,
                      //child: Text(myList[index].isVirtual?'V':''),
                      child: myList[index].isVirtual?Text('v'):Icon(Icons.accessibility),
                      maxRadius: 26,
                      foregroundColor: Colors.white,
                    ),
                  ),

                ],

              ),
            ),); //robohash.org api provide you different images for any number you are giving
        }),
      ),
    );
  }
}
