import 'package:fitgenie/core/widgets/custom_button.dart';
import 'package:fitgenie/pages/work_out_planes/widget/work.check.dart';
import 'package:fitgenie/pages/work_out_planes/work_data/work_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WorkOutDetails extends StatelessWidget {
  final int index;
  const WorkOutDetails({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    List<Map<String, dynamic>> work = WorkData.Work[index]["work"];
    return Container(
      clipBehavior: Clip.antiAlias,
      width: double.infinity,
      decoration: BoxDecoration(
         color: theme.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(bottom: 60, left: 16, right: 16, top: 20),
      child: Column(
        children: [
          Image.asset("assets/images/cardio.png"),
          const SizedBox(height: 20,),
         const Text("Today",
          style: TextStyle(
             color: Colors.white,
              fontSize: 24,),),
              Expanded(
          child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              physics: const BouncingScrollPhysics(),
            itemCount: items.length,
              itemBuilder: (context, index) {
                return WorkPlan(
                 index: index,
                ) ;
              }),
        ),
         Padding(
          padding: const EdgeInsets.all(8.0),
          child: LongButton(
              label: 'Save',
              onTap: () {
                Get.snackbar("Saved", "Work saved successfully",
                    snackPosition: SnackPosition.TOP,
                    padding: const EdgeInsets.all(20),
                    overlayColor: Colors.black.withOpacity(0.5),
                    margin: const EdgeInsets.all(20),
                    backgroundColor: theme.primaryColor.withOpacity(0.8),
                    colorText: Colors.white,
                    duration: const Duration(milliseconds: 1500),
                );
              },
              color: theme.colorScheme.secondary.withOpacity(0.4),
          ),
        ),
        ],
      ),
    );
  }
}
