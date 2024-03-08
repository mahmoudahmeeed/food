import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class breakfast extends StatefulWidget {
  const breakfast({super.key});

  @override
  State<breakfast> createState() => _breakfastState();
}

class _breakfastState extends State<breakfast> {
  @override
  Widget build(BuildContext context) {
    DateTime today= DateTime.now();
    void onDaySelected(DateTime day,DateTime focusedDay){
      setState(() {
        today=day;
      });
    }
    return  Scaffold(
      body: Column(
        children: [
          Container(
            child:TableCalendar(
              locale:'en_us',
              rowHeight:35,
               headerStyle:HeaderStyle(formatButtonVisible: false,titleCentered: true),
              focusedDay: today,
              onDaySelected: onDaySelected,
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
             firstDay: DateTime.utc(2022,01,01),
              lastDay: DateTime.utc(2040,01,01),
              ) ,
              
          ),
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.only(left: 38),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.56,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
              color: Color(0xff30384c),

            ),
            child: Stack(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(padding: EdgeInsets.only(top: 50),
                  child: Text("Today",style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),)
                ],
              )
            ]),
          )
        ],
      ),
    );
  }
}