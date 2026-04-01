# PurePlate

## Project Title
PurePlate – Recipe Discovery & Nutrition App (Flutter App)

---

## Research Problem
Finding organized recipe information quickly can be difficult. Many cooking apps are cluttered with ads and unnecessary steps, making it hard for users to find simple nutritional data and ingredient lists while cooking.

---

## Motivation
The purpose of this project is to build a streamlined tool that helps users discover recipes and view details in a clean, structured way. The goal is to minimize clutter and maximize the focus on the cooking instructions and health data.

---

## Control Flow
* The application starts from the **Splash Screen**.
* The user moves to the **Recipe Discovery** screen to browse.
* Upon selecting a recipe, the user is redirected to the **Details Page**.
* The Details Page displays:
    * Recipe name and image
    * Ingredient list (List)
    * Nutritional breakdown (Calories, Protein, etc.)

---

## Implementation Strategy
* Built using **Flutter (Dart)**.
* Application is structured into multiple pages:
    * `main.dart` → entry point and routing
    * `home.dart` → splash and home screen
    * `discovery.dart` → recipe list and search
    * `details.dart` → recipe information display
* Data is managed through **Dart Classes** and static lists.
* Processing: The code manages the app's data and **switches between different screens.**
* `pubspec.yaml` was used to manage the app's dependencies and assets.