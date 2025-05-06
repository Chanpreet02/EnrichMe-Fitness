import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/assignedPlansProvider.dart';
import '../provider/authProvider.dart';  // Import AuthProvider to access all users

class AssignPlanPage extends StatefulWidget {
  final String username;

  AssignPlanPage({required this.username});

  @override
  _AssignPlanPageState createState() => _AssignPlanPageState();
}

class _AssignPlanPageState extends State<AssignPlanPage> {
  String? selectedUser;
  String? selectedPlan;

  final TextEditingController planController = TextEditingController();

  final List<String> availablePlans = ['Plan A: Full Body Workout', 'Plan B: Cardio and Strength', 'Plan C: Yoga and Flexibility'];

  @override
  Widget build(BuildContext context) {
    final allUsers = ['user1', 'user2', 'test'];
    final usersToAssign = allUsers.toList();

    return Scaffold(
      appBar: AppBar(title: Text("Assign Plan")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              // User Dropdown
              DropdownButton<String>(
                hint: Text("Select User to Assign Plan"),
                value: selectedUser,
                items: usersToAssign.map((user) {
                  return DropdownMenuItem<String>(
                    value: user,
                    child: Text(user),
                  );
                }).toList(),
                onChanged: (selected) {
                  setState(() {
                    selectedUser = selected;
                  });
                },
              ),
              SizedBox(height: 20),

              // Plan Dropdown
              DropdownButton<String>(
                hint: Text("Select Plan to Assign"),
                value: selectedPlan,
                items: availablePlans.map((plan) {
                  return DropdownMenuItem<String>(
                    value: plan,
                    child: Text(plan),
                  );
                }).toList(),
                onChanged: (selected) {
                  setState(() {
                    selectedPlan = selected;
                  });
                },
              ),
              SizedBox(height: 20),

              // Assign Plan Button
              ElevatedButton(
                onPressed: () {
                  if (selectedUser != null && selectedPlan != null) {
                    // Assign the plan to the selected user
                    Provider.of<AssignedPlansProvider>(context, listen: false)
                        .assignPlan(selectedUser!, selectedPlan!);

                    // Show success message (optional)
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Plan Assigned to $selectedUser!')),
                    );

                    // Reset the fields
                    setState(() {
                      selectedUser = null;
                      selectedPlan = null;
                    });
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please select both user and plan')),
                    );
                  }
                },
                child: Text("Assign Plan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
