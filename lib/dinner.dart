import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Dinner extends StatefulWidget {
  const Dinner({super.key});

  @override
  State<Dinner> createState() => _DinnerState();
}

class _DinnerState extends State<Dinner> {
  @override
  Widget build(BuildContext context) {
     DateTime today=DateTime.now();
     void _onDaySelected2(DateTime day,DateTime focusedDay){
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
          onDaySelected: _onDaySelected2,
          availableGestures: AvailableGestures.all,
          selectedDayPredicate: (day) => isSameDay(day, today),
         firstDay: DateTime.utc(2022,01,01),
          lastDay: DateTime.utc(2040,01,01)) ,
      ),
    );
  }
}