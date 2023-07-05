import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../WorkoutTemplate.dart';
import 'WorkoutCard.dart';

class AddWorkoutPage extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Workout'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter workout name',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, WorkoutCard(title: controller.text));
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}