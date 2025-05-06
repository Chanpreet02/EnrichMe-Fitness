import 'package:flutter/material.dart';

class FitnessPlanListPage extends StatelessWidget {
  final String loggedInUser;

  FitnessPlanListPage({required this.loggedInUser});

  final List<Map<String, String>> plans = [
    {
      "title": "Plan A: Full Body Workout",
      "description": "A full-body workout plan for strength and endurance.",
      "type": "Strength"
    },
    {
      "title": "Plan B: Cardio and Strength",
      "description": "A combination of cardio and strength training.",
      "type": "Cardio/Strength"
    },
    {
      "title": "Plan C: Yoga and Flexibility",
      "description": "A yoga and flexibility routine to improve mobility.",
      "type": "Flexibility"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Fitness Plans")),
      body: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (_, index) {
          final plan = plans[index];
          return ListTile(
            title: Text(plan["title"]!),
            subtitle: Text("${plan["description"]} - Type: ${plan["type"]}"),
          );
        },
      ),
    );
  }
}
