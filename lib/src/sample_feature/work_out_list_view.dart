import 'package:final_project/src/sample_feature/arms_page.dart';
import 'package:final_project/src/sample_feature/back_page.dart';
import 'package:final_project/src/sample_feature/shoulders_page.dart';
import 'package:flutter/material.dart';
import '../settings/settings_view.dart';

class WorkoutListView extends StatelessWidget {
  static const routeName = '/';

  final List<Map<String, dynamic>> workoutData = [
    {'name': 'Chest', 'image': 'assets/images/chest1.jpeg'},
    {'name': 'Legs', 'image': 'assets/images/leg.webp'},
    {'name': 'Back', 'image': 'assets/images/back.webp'},
    {'name': 'Arms', 'image': 'assets/images/arms.jpeg'},
    {'name': 'Shoulders', 'image': 'assets/images/shoulder.webp'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose Workout'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.pushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: workoutData.length,
        itemBuilder: (BuildContext context, int index) {
          final workout = workoutData[index];
          return InkWell(
            onTap: () {
              if (workout['name'] == 'Shoulders') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ShouldersPage()),
                );
              } else if (workout['name'] == 'Arms') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ArmsPage()),
                );
              } else if (workout['name'] == 'Back') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => BackPage()),
                );
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / workoutData.length,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(workout['image']),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Text(
                  workout['name'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
