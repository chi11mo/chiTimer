import 'dart:async';

import 'package:chi_timer/src/views/workout/widget/AddWorkoutSetPage.dart';
import 'package:chi_timer/src/views/workout/widget/WorkoutSetCard.dart';
import 'package:chi_timer/src/views/workout/widget/current_set_view.dart';
import 'package:flutter/material.dart';


import 'WorkoutSet.dart';
import 'WorkoutTemplate.dart';


class DetailedWorkoutPage extends StatefulWidget {
  final WorkoutTemplate? workoutTemplate;
  final String? title;

  DetailedWorkoutPage({this.workoutTemplate, this.title});
  @override
  Widget build(BuildContext context) {
    if (workoutTemplate != null) {
      // Display details using workoutTemplate
      return Scaffold(
        appBar: AppBar(
          title: Text(workoutTemplate!.name),
        ),
        // Rest of your code
      );
    } else if (title != null) {
      // Display details using title
      return Scaffold(
        appBar: AppBar(
          title: Text(title!),
        ),
        // Rest of your code
      );
    } else {
      return Scaffold(
        body: Center(
          child: Text('No workout template or title provided.'),
        ),
      );
    }
  }
  @override
  _DetailedWorkoutPageState createState() => _DetailedWorkoutPageState();
}

class _DetailedWorkoutPageState extends State<DetailedWorkoutPage>
    with TickerProviderStateMixin {

  List<WorkoutSet> workoutSets = [];

  int currentIndex = 0;
  bool isWorkoutInProgress = false;
  Timer? _timer;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
  }

  void startWorkout() {
    setState(() {
      currentIndex = 0;
      isWorkoutInProgress = true;
    });
    startTimer(workoutSets[currentIndex].duration);
  }

  void startTimer(int duration) {
    _animationController?.duration = Duration(seconds: duration);
    _animationController?.forward(from: 0);
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (!mounted) return;
      if (duration < 1) {
        timer.cancel();
        if (currentIndex < workoutSets.length - 1) {
          setState(() {
            currentIndex++;
          });
          startTimer(workoutSets[currentIndex].duration);
        } else {
          setState(() {
            isWorkoutInProgress = false;
          });
        }
      } else {
        setState(() {
          duration--;
        });
      }
    });
  }

  @override
  void dispose() {
    _animationController?.dispose();
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
       // title: Text(widget.title),
      ),
      body: isWorkoutInProgress
          ? CurrentSetView(
        setName: workoutSets[currentIndex].title,
        duration: workoutSets[currentIndex].duration,
        animationController: _animationController!,
      )
          : GridView.count(
        crossAxisCount: 2,
        children: workoutSets.map<Widget>((workoutSet) => WorkoutSetCard(workoutSet: workoutSet)).toList(),
      ),
      floatingActionButton: isWorkoutInProgress ? null : FloatingActionButton(
        onPressed: () async {
          final workoutSet = await Navigator.push<WorkoutSet>(
            context,
            MaterialPageRoute(builder: (context) => AddWorkoutSetPage()),
          );

          if (workoutSet != null) {
            setState(() {
              workoutSets.add(workoutSet);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
      bottomNavigationBar: isWorkoutInProgress ? null : BottomAppBar(
        child: ElevatedButton(
          onPressed: workoutSets.isEmpty ? null : startWorkout,
          child: Text('Start Workout'),
        ),
      ),
    );
  }
}