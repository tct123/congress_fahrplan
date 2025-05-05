/*
congress_fahrplan
This is the dart file containing the Conference class.
SPDX-License-Identifier: GPL-2.0-only
Copyright (C) 2019 - 2021 Benjamin Schilling
*/

import 'package:congress_fahrplan/model/day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Conference {
  final String? acronym;
  final String? title;
  final String? start;
  final String? end;
  int? daysCount;
  final String? timeslotDuration;
  final List<Day>? days;
  final List<String>? namesOfRooms;

  Conference({
    this.acronym,
    this.title,
    this.start,
    this.end,
    this.timeslotDuration,
    this.days,
    this.namesOfRooms,
  });

  factory Conference.fromJson(var json) {
    Conference c = Conference(
      acronym: json['acronym'],
      title: json['title'],
      start: json['start'],
      end: json['end'],
      timeslotDuration: json['timeslot_duration'],
      days: jsonToDayList(json['days']),
    );
    c.daysCount = 0;
    for (Day d in c.days!) {
      if (d.talks!.isNotEmpty) {
        c.daysCount = c.daysCount! + 1;
      }
    }
    return c;
  }

  static List<Day> jsonToDayList(var json) {
    List<Day> days = [];
    for (var j in json) {
      Day d = Day.fromJson(j);
      if (d.talks!.isNotEmpty) {
        days.add(d);
      }
    }
    return days;
  }

  List<Widget> buildDayTabs() {
    List<Column> dayColumns = [];
    for (Day d in days!) {
      if (d.talks!.isNotEmpty) {
        List<Widget> widgets = [];
        widgets.addAll(d.talks!);
        dayColumns.add(
          Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: d.talks!.length,
                  itemBuilder: (context, index) {
                    return d.talks![index];
                  },
                ),
              ),
            ],
          ),
        );
      }
    }
    return dayColumns;
  }

  List<Widget> getDaysAsText() {
    List<Widget> dayTexts = [];
    for (Day d in days!) {
      if (d.talks!.isEmpty) {
        continue;
      }
      String weekday = DateFormat.E().format(d.date!);

      String dateString = '${d.date!.month}-${d.date!.day}';
      String semanticsDay =
          '${DateFormat.EEEE().format(d.date!)} ${DateFormat.yMMMMd().format(d.date!)}';
      dayTexts.add(
        Semantics(
          label: semanticsDay,
          child: ExcludeSemantics(
            child: Column(
              children: [
                Text(
                  weekday,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
                Text(
                  dateString,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return dayTexts;
  }
}
