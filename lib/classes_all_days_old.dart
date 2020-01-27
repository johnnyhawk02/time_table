import 'package:auto_size_text/auto_size_text.dart';
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
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: ListView(
          children: List.generate(myList.length, (index) {
            return Padding(
              padding: const EdgeInsets.all(2.0),
              child: Material(
                //color: myList[index].dayColor,
                elevation: 10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topLeft,
                        child: Row(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
                              child: CircleAvatar(
                                backgroundColor: myList[index].dayColor,
                                //
                                child: Text(myList[index].day.substring(0, 2)),

                                maxRadius: 14,
                                foregroundColor: Colors.white,
                              ),
                            ),
                            AutoSizeText(
                              "${myList[index].shortName} - ${myList[index].start}",
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: myList[index].isVirtual
                              ? Icon(
                                  Icons.tv,
                                  color: myList[index].color,
                                )
                              : Icon(
                                  Icons.accessibility,
                                  color: myList[index].color,
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ); //robohash.org api provide you different images for any number you are giving
          }),
        ),
      ),
    );
  }
}
