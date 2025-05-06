import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/assignedPlansProvider.dart';

class AssignedPlansPage extends StatelessWidget {
  final String username;

  AssignedPlansPage({required this.username});

  @override
  Widget build(BuildContext context) {
    final assignedPlansProvider = Provider.of<AssignedPlansProvider>(context);
    final plans = assignedPlansProvider.getPlansForUser(username);  // Fetch plans for current user

    return Scaffold(
      appBar: AppBar(title: Text("Your Assigned Plans")),
      body: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(plans[index]),
        ),
      ),
    );
  }
}
