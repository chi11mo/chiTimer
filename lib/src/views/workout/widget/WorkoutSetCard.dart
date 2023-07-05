import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../WorkoutSet.dart';



class WorkoutSetCard extends StatelessWidget {
  final WorkoutSet workoutSet;

  WorkoutSetCard({required this.workoutSet});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(workoutSet.title, style: TextStyle(fontSize: 20)),
          Text('${workoutSet.duration} seconds', style: TextStyle(fontSize: 16)),
        ],
      ),
    );
  }
}