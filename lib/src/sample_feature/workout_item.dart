import 'package:flutter/material.dart';

class WorkoutItem extends StatelessWidget {
  final String name;

  WorkoutItem({required this.name});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(name),
      onTap: () {
        // Handle tap event if needed
      },
    );
  }
}
