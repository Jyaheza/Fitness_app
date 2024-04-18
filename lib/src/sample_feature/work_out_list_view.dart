import 'package:final_project/src/sample_feature/meal_suggestion.dart';
import 'package:flutter/material.dart';
import 'openai_service.dart';
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

  final OpenAIService openAIService = OpenAIService();

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
            onTap: () async {
              // Pass workout name to OpenAIService
              String? suggestedMeal =
                  await openAIService.suggestMeal(workout['name']);
              if (suggestedMeal != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MealSuggestionsPage(workoutName: workout['name']),
                  ),
                );
              } else {
                // Handle error or show a message
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                      content: Text(
                          'Failed to suggest a meal for ${workout['name']}')),
                );
              }
            },
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height:
                      MediaQuery.of(context).size.height / workoutData.length,
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
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: ElevatedButton(
                    onPressed: () async {
                      // Pass workout name to OpenAIService
                      String? suggestedMeal =
                          await openAIService.suggestMeal(workout['name']);
                      if (suggestedMeal != null) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text('Suggested meal: $suggestedMeal')),
                        );
                      } else {
                        // Handle error or show a message
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content: Text(
                                  'Failed to suggest a meal for ${workout['name']}')),
                        );
                      }
                    },
                    child: Text('Get Meal Suggestion'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
