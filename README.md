# EnrichMe Flutter Developer Coding Assignment

## Project Overview

This project is a core component of the **EnrichMe** app, focused on implementing fitness plan features using Flutter. The app includes functionalities for displaying fitness plans, user registration, assigning fitness plans, and showing the assigned plans to users. Firebase is used for authentication to simulate user login and management.

## Table of Contents
1. [Fitness Plan List Implementation](#fitness-plan-list-implementation)
2. [User Registration and Login](#user-registration-and-login)
3. [Coach's Fitness Plan Assignment Page](#coachs-fitness-plan-assignment-page)
4. [Assigned Fitness Plans for a User](#assigned-fitness-plans-for-a-user)
5. [Basic State Management](#basic-state-management)
6. [Setup Instructions](#setup-instructions)
7. [Technology Stack](#technology-stack)

---

## 1. Fitness Plan List Implementation

### Requirement:
The app displays a list of fitness plans, each plan containing a title, description, and type (e.g., cardio, strength). Mock data is used to simulate the list, displayed via a `ListView`.

### Code:
The `FitnessPlanListPage` class is responsible for displaying the list of fitness plans.

```dart
class FitnessPlanListPage extends StatelessWidget {
  final String loggedInUser;

  FitnessPlanListPage({required this.loggedInUser});

  final List<String> plans = [
    "Plan A: Full Body Workout",
    "Plan B: Cardio and Strength",
    "Plan C: Yoga and Flexibility",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("All Fitness Plans")),
      body: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (_, index) => ListTile(
          title: Text(plans[index]),
        ),
      ),
    );
  }
}
