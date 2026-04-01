# PurePlate

## Project Title
**PurePlate** – Three-Page Recipe Application (Flutter Prototype)

---

## Research Problem
People often struggle to find clear, organized recipe information quickly. Navigating through cluttered websites for simple meal details can be frustrating. There is a need for a streamlined, focused interface that presents recipes, ingredients, and nutrition in a straightforward way.

---

## Motivation
The goal of this project is to develop a clean, user-friendly mobile prototype that simplifies the recipe discovery process. By focusing on a linear navigation flow and high-quality UI, the project aims to show how a structured digital cookbook can improve the cooking experience.

---

## Control Flow
* **Home Screen:** The user starts at the Splash/Home screen, which introduces the app.
* **Recipe Discovery:** The user moves to the discovery layer to browse categories or search for specific meals.
* **Recipe Details:** Upon selecting a recipe (like the Chicken Caesar Salad), the app transitions to a detailed view.
* **Data Passing:** The app passes specific parameters to ensure the correct nutritional info and ingredients are displayed.

---

## Implementation Strategy
* **Framework:** Built using **Flutter** and **Dart**.
* **UI Architecture:** Designed with a Widget-based approach across three core pages.
* **Navigation:** Uses **Flutter Navigator** to handle the flow and transfer data between screens.
* **Data Management:** * Recipes are structured as **Dart Objects**.
    * Information is stored in static lists for fast retrieval.
    * The app filters information and **switches between different screens.**

---

## App Structure
* `lib/main.dart` → Entry point and app configuration.
* `pubspec.yaml` → Used to manage dependencies and assets.

---

## How to Run
```bash
flutter pub get
flutter run