import 'package:chi_timer/src/views/workout/DetailedWorkoutPage.dart';
import 'package:chi_timer/src/views/workout/WorkoutSet.dart';
import 'package:chi_timer/src/views/workout/WorkoutTemplate.dart';
import 'package:chi_timer/src/views/workout/widget/AddWorkoutPage.dart';
import 'package:flutter/material.dart';

void main() {
  WorkoutTemplate workoutTemplate = WorkoutTemplate(
    name: 'My Workout',
    sets: [
      WorkoutSet(title: 'Set 1', duration: 30),
      WorkoutSet(title: 'Set 2', duration: 60),
      // Add as many sets as you like
    ],
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Workout Planner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> workouts = [];

  @override
  void initState() {
    super.initState();
    WorkoutTemplate workoutTemplate = WorkoutTemplate(
      name: 'My Workout',
      sets: [
        WorkoutSet(title: 'Set 1', duration: 30),
        WorkoutSet(title: 'Set 2', duration: 60),
        // Add as many sets as you like
      ],
    );

    workouts.add(_buildWorkoutTemplateCard(workoutTemplate));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workout Planner'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: workouts,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final workout = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>
                AddWorkoutPage()),
          );

          if (workout != null) {
            setState(() {
              workouts.add(workout);
            });
          }
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.green,
      ),
    );
  }

  Widget _buildWorkoutTemplateCard(WorkoutTemplate workoutTemplate) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailedWorkoutPage(workoutTemplate: workoutTemplate),
          ),
        );
      },
      child: Card(
        child: ListTile(
          title: Text(workoutTemplate.name),
          subtitle: Text('Sets: ${workoutTemplate.sets.length}'),
        ),
      ),
    );
  }
}
