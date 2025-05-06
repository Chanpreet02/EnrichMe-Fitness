import 'package:flutter/material.dart';
import 'assignPlanPage.dart';
import 'fitnessPlanView.dart';
import 'assignedPlansPage.dart';
import 'package:provider/provider.dart';
import '../provider/authProvider.dart';
import 'loginScreen.dart';

class HomeScreen extends StatelessWidget {
  final String username;

  const HomeScreen({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    final isCoach = username == "test";

    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome, $username!"),
        actions: [
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              Provider.of<AuthProvider>(context, listen: false).logout();
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          if (isCoach)
            ListTile(
              leading: Icon(Icons.assignment),
              title: Text("Assign Fitness Plan"),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AssignPlanPage(username: username,))),
            ),
          ListTile(
            leading: Icon(Icons.fitness_center),
            title: Text("All Fitness Plans"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => FitnessPlanListPage(loggedInUser: username))),
          ),
          ListTile(
            leading: Icon(Icons.check_circle),
            title: Text("Your Assigned Plans"),
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AssignedPlansPage(username: username))),
          ),
        ],
      ),
    );
  }
}
