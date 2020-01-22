import 'events_list.dart';

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
}

class LeisureCentre {
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
