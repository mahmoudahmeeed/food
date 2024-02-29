import 'package:flutter/material.dart';
import 'package:flutter_application_1/button.dart';
//import 'package:flutter_application_1/button.dart';

class mealfood extends StatefulWidget {
  const mealfood({super.key});

  @override
  State<mealfood> createState() => _mealfoodState();
}

class _mealfoodState extends State<mealfood> {
  int isActiveTap=0;
  List meal=[
     {
      "name": "Breakfast",
      "Image": "images/Healthy-Breakfast-1000x620.jpg",
      "title" : "Meal plan",
      "subtitle":"",
     },
      {
      "name": "Snack",
      "Image": "images/variety-of-healthy-snacks-gourmet-dips-royalty-free-image-1639694989.jpg",
      "title" : "Meal plan",
      "subtitle":"",
     },
      {
      "name": "Dinner",
      "Image": "images/healthy-tuna-pasta-bake-p46-151271-2.jpg",
      "title" : "Meal plan",
      "subtitle":"",
     },
  ];
  @override
  Widget build(BuildContext context) {
    var media =MediaQuery.sizeOf(context);
    return  Scaffold(
      appBar: AppBar(centerTitle: true,
      backgroundColor: Colors.white,
        title: const Text("Meal plan",
        style: TextStyle(color: Colors.black,
        fontSize: 20,fontWeight: FontWeight.w700,),),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal:20 ),
        itemCount: meal.length,
        itemBuilder: (context,index){
          var W0bg=meal[index] as Map? ??{};
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
                fontSize: 14,
                fontWeight: FontWeight.w500, onPressed: () {  },),
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