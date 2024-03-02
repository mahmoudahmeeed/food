import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Snaks extends StatefulWidget {
  const Snaks({super.key});

  @override
  State<Snaks> createState() => _SnaksState();
}

class _SnaksState extends State<Snaks> {
  @override
  Widget build(BuildContext context) {
    DateTime today=DateTime.now();
    void _onDaySelected(DateTime day,DateTime focusedDay){
      setState(() {
        today=day;
      });
    }
     return  Scaffold(
      body: Container(
        child:TableCalendar(
          locale:
          'en_us',
          rowHeight:35,
          headerStyle:HeaderStyle(formatButtonVisible: false,titleCentered: true),
          focusedDay: today,
          onDaySelected: _onDaySelected,
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, today),
         firstDay: DateTime.utc(2022,01,01),
          lastDay: DateTime.utc(2040,01,01)) ,
      ),
    );
  }
}