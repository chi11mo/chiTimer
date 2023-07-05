import 'package:flutter/material.dart';

class CurrentSetView extends StatefulWidget {
  final String setName;
  final int duration;
  final AnimationController animationController;

  CurrentSetView({
    required this.setName,
    required this.duration,
    required this.animationController,
  });

  @override
  _CurrentSetViewState createState() => _CurrentSetViewState();
}

class _CurrentSetViewState extends State<CurrentSetView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Assuming you have a `WorkoutSetCard` that takes a `WorkoutSet` as a parameter
        // Add your WorkoutSetCard here
        AnimatedBuilder(
          animation: widget.animationController,
          builder: (BuildContext context, Widget? child) {
            return Text("time"'${(widget.animationController.value ?? 0) * widget.duration}');
          },
        ),
      ],
    );
  }
}
