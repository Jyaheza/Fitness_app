import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import 'workout_item.dart'; // Assuming you have a WorkoutItem widget for displaying workout types

class WorkoutListView extends StatelessWidget {
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scheduled Workouts'),
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
      body: ListView(
        children: [
          WorkoutItem(name: 'Chest'),
          WorkoutItem(name: 'Legs'),
          WorkoutItem(name: 'Back'),
          // Add more WorkoutItem widgets for additional workout types
        ],
      ),
    );
  }
}
