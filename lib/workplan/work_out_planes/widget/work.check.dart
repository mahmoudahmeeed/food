import 'package:fitgenie/pages/work_out_planes/work_data/work_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:get/get.dart';

class WorkPlan extends StatefulWidget {
   final int index;
  const WorkPlan({super.key,required this.index});

  @override
  State<WorkPlan> createState() => _WorkPlanState();
}

class _WorkPlanState extends State<WorkPlan> {
   Color color = Theme.of(Get.context!).colorScheme.secondary.withOpacity(0.4);
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
     List<Map<String, dynamic>> work = WorkData.Work[widget.index]["items"];
     return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Row(
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 300),
            curve: Curves.fastOutSlowIn,
            reverseDuration: const Duration(milliseconds: 1000),
            child: Container(
              padding:
              const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              width: Get.width * 0.76,
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withOpacity(0.4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(work[widget.index]["workname"]),
                       Spacer(),
                       Text(work[widget.index]["workhoues"]),
                    ],
                  ),
                  isExpanded ?const Text("Squad") : Container(),
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                color = color == Colors.green
                    ? Theme.of(Get.context!)
                    .colorScheme
                    .secondary
                    .withOpacity(0.4)
                    : Colors.green;
              });
            },
            child: Icon(
              color == Colors.green
                  ? Icons.check_circle_outline
                  : Icons.circle_outlined,
              color: color,
            ),
          )
        ],
      ),
    );
  }
}

  