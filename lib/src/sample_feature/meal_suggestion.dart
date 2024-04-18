import 'package:flutter/material.dart';

class MealSuggestionsPage extends StatelessWidget {
  final String workoutName;

  const MealSuggestionsPage({Key? key, required this.workoutName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Example meal suggestions (replace this with your actual logic)
    List<String> mealSuggestions = [
      'Grilled chicken with steamed vegetables',
      'Salmon with quinoa and roasted asparagus',
      'Turkey sandwich with avocado and spinach',
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Meal Suggestions for $workoutName'),
      ),
      body: ListView.builder(
        itemCount: mealSuggestions.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text('Meal ${index + 1}'),
              subtitle: Text(mealSuggestions[index]),
            ),
          );
        },
      ),
    );
  }
}
