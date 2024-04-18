import 'package:flutter/material.dart';

import '../settings/settings_view.dart';

class WorkoutListView extends StatelessWidget {
  static const routeName = '/';

  // Define a list of workout data
  final List<Map<String, dynamic>> workoutData = [
    {'name': 'Chest', 'image': 'assets/images/chest1.jpeg'},
    {'name': 'Legs', 'image': 'assets/images/back.jpg'},
    {'name': 'Back', 'image': 'assets/images/leg.webp'},
    // Add more workout types with their respective images
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
              // Navigate to the settings page
              Navigator.pushNamed(context, SettingsView.routeName);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: workoutData.length,
        itemBuilder: (BuildContext context, int index) {
          // Extract workout data
          final workout = workoutData[index];
          return InkWell(
            onTap: () {
              // Handle tap on workout item
              // You can navigate to a detail page or perform any other action
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
