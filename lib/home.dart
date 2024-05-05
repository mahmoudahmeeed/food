import 'package:flutter/material.dart';
import 'package:flutter_application_1/mealfood.dart';
import 'package:flutter_application_1/setting.dart';
import 'package:flutter_application_1/workplan/work_plan.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            MaterialButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: (){Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>mealfood())
                );
                },
                child: Text("Meal Food"),),


                MaterialButton(
                  color: Colors.blue,
              textColor: Colors.white,
                  onPressed: (){Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>Workplan())
                );
                },
                child: Text("Work plan "),),
                SizedBox(height: 20,),
                 MaterialButton(
                  color: Colors.blue,
              textColor: Colors.white,
                  onPressed: (){Navigator.of(context).push(
                  MaterialPageRoute(builder: (context)=>setting())
                );
                },
                child: Text("Setting "),),
                
          ],
        ),
      ),
    );
  }
}