import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../DetailedWorkoutPage.dart';

class WorkoutCard extends StatelessWidget {
  final String title;

  WorkoutCard({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DetailedWorkoutPage(title: title)),
        );
      },
      child: Card(
        child: Center(child: Text(title)),
      ),
    );
  }
}

