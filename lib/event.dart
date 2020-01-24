import 'events_list.dart';
import 'package:flutter/material.dart';

double convertStringTimeToDouble(s) {
  return double.parse(s.split(':')[0]) + double.parse(s.split(':')[1]) / 60;
}

abstract class TimeTable {
  static String closing = '22:00';
  static String opening = '06:30';

  //Times();
  static double get left => convertStringTimeToDouble(opening);
  static double get right => convertStringTimeToDouble(closing);
  static double get multiplier => 1 / (right - left);
}



class Event {
  String site, name, type, info, day, start, finish;

  Event({
    this.site,
    this.name,
    this.type,
    this.info,
    this.day,
    this.start,
    this.finish,
  });

  double get left =>
      (convertStringTimeToDouble(start) - TimeTable.left) *
      TimeTable.multiplier;
  double get right =>
      (convertStringTimeToDouble(finish) - TimeTable.left) *
      TimeTable.multiplier;

  String get shortName =>
      this.name.replaceAll('Les Mills ', '').replaceAll(' Virtual', '');

  bool get isVirtual => name.toLowerCase().contains('virtual');
  Color get color {
    String tmp = this.name.toLowerCase();
    if (tmp.contains('pump')) {return Colors.red;}
    if (tmp.contains('spin') ||tmp.contains('trip') || tmp.contains('sprint') || tmp.contains('rpm') ) {return Colors.blue;}
    if (tmp.contains('yoga')) {return Colors.yellow;}
    if (tmp.contains('pilates')) {return Colors.green;}
    if (tmp.contains('zumba')) {return Colors.green;}
    if (tmp.contains('aqua')) {return Colors.pink;}
    if (tmp.contains('combat')) {return Colors.teal;}
    if (tmp.contains('tai chi')) {return Colors.indigoAccent;}

    if (tmp.contains('grit') || tmp.contains('hiit') ) {return Colors.deepOrangeAccent;}


    if (tmp.contains('padwork') || tmp.contains('boxer')) {return Colors.purple;}
  return Colors.grey;
  }
}

class LeisureCentre {
  List days = [
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
    'sunday'
  ];
  List<Event> events = [];
  String openingTime;
  String closingTime;
  LeisureCentre({
    this.openingTime,
    this.closingTime,
  }) {
    eventsList.forEach((e) {
      events.add(Event(
        site: e['site'],
        name: e['name'],
        type: e['type'],
        info: e['info'],
        day: e['day'],
        start: e['time'].split(' - ')[0],
        finish: e['time'].split(' - ')[1],
      ));
    });
  }
  List virtualEventList() => events.where((e) => e.isVirtual).toList();
  List classList(className) => events
      .where((e) => e.name.toLowerCase().contains(className.toLowerCase()))
      .toList();


}
