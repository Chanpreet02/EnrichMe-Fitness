import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AssignedPlansProvider with ChangeNotifier {
  Map<String, List<String>> _assignedPlans = {};

  Map<String, List<String>> get assignedPlans => _assignedPlans;

  AssignedPlansProvider() {
    _loadAssignedPlans();
  }

  Future<void> _loadAssignedPlans() async {
    final prefs = await SharedPreferences.getInstance();
    final keys = prefs.getKeys();

    Map<String, List<String>> tempPlans = {};

    for (var key in keys) {
      tempPlans[key] = prefs.getStringList(key) ?? [];
    }

    _assignedPlans = tempPlans;
    notifyListeners();
  }

  Future<void> assignPlan(String user, String plan) async {
    if (_assignedPlans[user] == null) {
      _assignedPlans[user] = [];
    }
    _assignedPlans[user]!.add(plan);

    // Save updated assigned plans to SharedPreferences
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList(user, _assignedPlans[user]!);

    notifyListeners();
  }

  List<String> getPlansForUser(String username) {
    return _assignedPlans[username] ?? [];
  }

  void clear() async {
    _assignedPlans.clear();
    final prefs = await SharedPreferences.getInstance();
    prefs.clear();
    notifyListeners();
  }
}
