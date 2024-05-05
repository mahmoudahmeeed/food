import 'package:flutter/material.dart';
import 'package:flutter_application_1/breakfast.dart';
import 'package:flutter_application_1/button.dart';
import 'package:flutter_application_1/dinner.dart';
import 'package:flutter_application_1/snacks.dart';


class Workplan extends StatefulWidget {
  const Workplan({super.key});

  @override
  State<Workplan> createState() => _mealfoodState();
}

class _mealfoodState extends State<Workplan> {
  int isActiveTap=0;
  List meal=[
     {
      "name": "Leg",
      "Image": "images/205-125630-benefits-leg-exercises_700x400.jpg",
      "title" : "Work plan",
      "subtitle":"",
      "tag" : "1"
     },
      {
      "name": "Abdominal",
      "Image": "images/تمارين-شد-البطن-بالصور_slideshow_1947_31445e591d7-1ab0-4f79-8bba-71e0b936b581.jpg",
      "title" : "Work plan",
      "subtitle":"",
      "tag" : "2"
     },
      {
      "name": "Back exercises",
      "Image": "images/images.jpeg",
      "title" : "Work plan",
      "subtitle":"",
      "tag" : "3"
     },
     {
      "name": "Shoulder",
      "Image": "images/images3.jpeg",
      "title" : "Work plan",
      "subtitle":"",
      "tag" : "3"
     },
      {
      "name": "Chest",
      "Image": "images/images.2jpeg.webp",
      "title" : "Work plan",
      "subtitle":"",
      "tag" : "3"
     },
  ];
  @override
  Widget build(BuildContext context) {
    var media =MediaQuery.sizeOf(context);
    return  Scaffold(
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.white,
        title: const Text("Work plan",
        style: TextStyle(color: Colors.black,
        fontSize: 20,fontWeight: FontWeight.w700,),),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal:20 ),
        itemCount: meal.length,
        itemBuilder: (context,index){
          var W0bg=meal[index] ;
          return Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(10),
            ),
            clipBehavior:Clip.antiAlias ,
            child:Stack(
              children: [
                Image.asset(W0bg["Image"].toString(),
                width: media.width,
                height: media.width*0.5,
                 fit: BoxFit.cover,),
                 Container(
                  width: media.width,
                  height: media.width*0.5,
                  decoration: BoxDecoration(
                    color: index%2==0? Colors.black.withOpacity(0.7)
                    :Colors.grey.withOpacity(0.35),
                    
                  ),
                 ),
                 Padding(
                   padding: const EdgeInsets.symmetric(vertical: 25,horizontal: 20),
                   child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                       Text( W0bg["title"],
        style: const TextStyle(
          color: Colors.yellow,
          fontSize: 14,
          fontWeight: FontWeight.w500,),),
           Text(
            W0bg["name"],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.w700,),),
           Text(
            W0bg["subtitle"],
        style: const TextStyle(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w500,),),
           SizedBox(
          height: 100,
         
         ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: 90,
                height: 25,
                child: RoundButton(title:"See more",
                fontSize: 20,
                fontWeight: FontWeight.w500, onPressed: () { 
                  print(W0bg["tag"]);
                  switch(W0bg["tag"]="1"){
                    case "1":
                    Navigator.of(context).push(
                       MaterialPageRoute(builder: (context)=>breakfast()));
                    break;
                    case "2":
                    Navigator.of(context).push(
                       MaterialPageRoute(builder: (context)=>Snaks()));
                    break;
                    default:
                    Navigator.of(context).push(
                       MaterialPageRoute(builder: (context)=>Dinner()));
                       break;
                  }

                 },),
              ),
            ],
          )
                    ],
                   ),
                 )
              ],
            ) ,
          );
          
        })
    );
  }
}