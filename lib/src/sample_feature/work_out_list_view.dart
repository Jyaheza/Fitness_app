import 'package:final_project/src/sample_feature/arms_page.dart';
import 'package:final_project/src/sample_feature/back_page.dart';
import 'package:final_project/src/sample_feature/chest_page.dart';
import 'package:final_project/src/sample_feature/legs_workout.dart';
import 'package:final_project/src/sample_feature/shoulders_page.dart';
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
              } else if (workout['name'] == 'Chest') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChestPage()),
                );
              } else if (workout['name'] == 'Legs') {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LegsPage()),
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
                      style: const TextStyle(
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
                        String selectedWorkOut = workout['name'];
                        String? suggestedMeal =
                            await openAIService.suggestMeal(selectedWorkOut);
                        if (suggestedMeal != null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Pre-workout Meal for $selectedWorkOut: \n$suggestedMeal'),
                              backgroundColor: Colors.green[700],
                              duration: const Duration(seconds: 10),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  'Failed to suggest a meal for ${workout['name']}'),
                              backgroundColor: Colors.red[
                                  700], // Optional: Customize SnackBar color
                            ),
                          );
                        }
                      },
                      child: const Text('Pre-workout Meal'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor:
                            Colors.white.withOpacity(0.5), // Text color
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 0, // No shadow
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 15),
                      ),
                    )),
              ],
            ),
          );
        },
      ),
    );
  }
}
