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

---

## 2. User Registration and Login (Mocked Data)

### Requirement:
A simple login system with hardcoded mock credentials (username: `test`, password: `password123`). Upon successful login, the user is navigated to the fitness plan list screen.

---

## 3. Coach's Fitness Plan Assignment Page

### Requirement:
The coach can assign fitness plans to users. It includes dropdowns for selecting a user and a fitness plan. The coach can press a button to assign the selected plan to the selected user.

---

## 4. Assigned Fitness Plans for a User

### Requirement:
Display a list of all fitness plans assigned to a specific user. After logging in, users should see their assigned plans.

---

## 5. Basic State Management

### Requirement:
Implement state management using Provider to handle the logged-in user's state and update the UI accordingly.

---

## 6. Setup Instructions

1. **Clone the repository:**
   ```bash
   git clone <your-repository-link>
   cd <project-folder>
2. **Install dependencies:**
     ```bash
     flutter pub get
3. **Run the project**
     ```bash
     flutter run

---

## 7. Technology Stack
Flutter: Used for building the mobile app.

Firebase: Used for user authentication (optional for the internship task).

Provider: Used for state management across the app.
