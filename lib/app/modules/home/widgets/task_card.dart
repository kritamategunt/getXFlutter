import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:to_do_list/app/core/utils/extension.dart';
import 'package:to_do_list/app/data/models/task.dart';
import 'package:to_do_list/app/modules/home/controller.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class TaskCard extends StatelessWidget {
  final homeCtrl = Get.find<HomeController>();
  final Task task;
  TaskCard({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = task.color;
    final squareWidth = Get.width - 12.0.wp;
    return Container(
      width: squareWidth / 2,
      height: squareWidth / 2,
      margin: EdgeInsets.all(3.0.wp),
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
            color: Colors.grey[300]!, blurRadius: 7, offset: const Offset(0, 7))
      ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // TODO change the code when finish CRUD
        children: [
          StepProgressIndicator(
            totalSteps: 100,
            currentStep: 80,
            size: 5,
            padding: 0,
            unselectedGradientColor: LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [Colors.white, Colors.white]),
            selectedGradientColor: (LinearGradient(
                begin: Alignment.bottomLeft,
                end: Alignment.bottomRight,
                colors: [color.withOpacity(0.5), color])),
          ),
          Padding(
            padding: EdgeInsets.all(6.0.wp),
            child: Icon(
              IconData(task.icon, fontFamily: 'MaterialIcons'),
              color: color,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(task.title),
              Text('${task.todos?.length ?? 0} Task')
            ],
          )
        ],
      ),
    );
  }
}
