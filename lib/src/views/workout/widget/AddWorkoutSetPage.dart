import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../WorkoutSet.dart';
import 'WorkoutSetCard.dart';

class AddWorkoutSetPage extends StatelessWidget {
  final titleController = TextEditingController();
  final durationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Workout Set'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Enter workout set name',
              ),
            ),
            TextField(
              controller: durationController,
              decoration: InputDecoration(
                labelText: 'Enter workout set duration (in seconds)',
              ),
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, WorkoutSet(
                  title: titleController.text,
                  duration: int.parse(durationController.text),
                ));
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}