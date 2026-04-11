# Yummy - Flutter Project

## Yummy App Demo

The completed application should match the visual style and behavior described below.

### 📱 Yummy App Demo
![Yummy App Demo](finished-app-visuals/YummyApp.gif)  
*(Replace with an actual demo GIF once available)*

## Project Overview
A Flutter application that demonstrates a customizable theme, bottom navigation, and three distinct card components: **CategoryCard**, **PostCard**, and **RestaurantLandscapeCard**. Users can switch between light and dark themes, change the app's primary color, and navigate through a clean, responsive interface.

## Features
- Three‑tab bottom navigation (Category, Post, Restaurant)
- Dynamic theme switching (light / dark mode)
- Seed‑based color theming with a popup menu selector
- Responsive card designs for:
    - Food categories with overlaid text and restaurant count
    - Social‑style posts with avatar, comment, and timestamp
    - Restaurant info with landscape image and details
- Stateful theme management via `MaterialApp` `theme` and `darkTheme`
- Clean separation of UI components into a dedicated `components/` folder

## Project Structure
```
yummy/
├── assets/
│   └── (images for categories, posts, restaurants)
├── lib/
│   ├── main.dart                # (to be implemented)
│   ├── home.dart                # (to be implemented)
│   ├── constants.dart           # ✅ provided – ColorSelection enum
│   ├── models/                  # ✅ provided – data models
│   │   ├── food_category.dart
│   │   ├── post.dart
│   │   ├── restaurant.dart
│   │   └── models.dart          
│   └── components/              # (all files to be implemented)
│       ├── category_card.dart
│       ├── post_card.dart
│       ├── restaurant_landscape_card.dart
│       ├── theme_button.dart
│       └── color_button.dart
├── pubspec.yaml
└── ... (other Flutter project files)
```

**Note:** Files marked with ✅ are provided in the starter project. All other Dart files in `lib/` and `lib/components/` will be implemented during this project.

## Setup Instructions

### Step 1: Project Initialization
Obtain the starter Flutter project named `yummy`. It already contains the `models/` folder with the data classes and `constants.dart`. Open the project in your preferred IDE.

### Step 2: Asset Configuration
1. The `assets` folder exists in the project root.
2. Add all required images (e.g., category backgrounds, profile pictures, restaurant photos) to this folder.  
   *Refer to the sample data in the model files for exact filenames.*
3. Verify that `pubspec.yaml` includes the assets directory:
   ```yaml
   flutter:
     assets:
       - assets/
   ```

### Step 3: Review Provided Files
Familiarize yourself with the pre‑existing code:

- **`constants.dart`** – Defines the `ColorSelection` enum with associated colors and labels.
- **`models/food_category.dart`** – Contains the `FoodCategory` class and a sample list `categories`.
- **`models/post.dart`** – Contains the `Post` class and a sample list `posts`.
- **`models/restaurant.dart`** – Contains the `Restaurant` class and a sample list `restaurants`.
- **`models/models.dart`** – Exports all three model files for convenient importing.

You will use these models and constants throughout the implementation.

### Step 4: Implement Main Application (`main.dart`)
Create `lib/main.dart` with the following requirements:

- A stateful widget `Yummy` that holds `ThemeMode themeMode` and `ColorSelection colorSelected`.
- Methods `changeThemeMode(bool useLightMode)` and `changeColor(int value)` that update the state.
- A `MaterialApp` configured with:
    - `title`, `debugShowCheckedModeBanner: false`
    - `themeMode`, `theme` (light), and `darkTheme` using `colorSelected.color` as `colorSchemeSeed`
    - `home: Home(...)` passing the callbacks and current `colorSelected`

Refer to the comments in the provided code snippet for guidance on refactoring ternary operators and structuring the widget tree.

### Step 5: Implement Home Screen (`home.dart`)
Create `lib/home.dart`:

- Accept `changeTheme`, `changeColor`, and `colorSelected` as required parameters.
- Maintain an `int tab` state variable for the current navigation index.
- Define `List<NavigationDestination> appBarDestination` with three items (Category, Post, Restaurant).
- Build three pages (centered on screen) using the appropriate card widgets:
    - `CategoryCard` with `categories[0]`
    - `PostCard` with `posts[0]`
    - `RestaurantLandscapeCard` with `restaurants[0]`
- Use `IndexedStack` to display the selected page.
- Add a `NavigationBar` as the `bottomNavigationBar` that updates `tab` on tap.
- Place `ThemeButton` and `ColorButton` in the `AppBar` actions.

### Step 6: Implement Component Widgets
Create each UI component inside `lib/components/`:

#### a) `theme_button.dart`
- Stateless widget receiving `changeThemeMode` callback.
- Determines current brightness and displays appropriate icon (dark_mode / light_mode).
- Calls `changeThemeMode(!isBright)` when pressed.

#### b) `color_button.dart`
- Stateless widget receiving `changeColor` callback and current `colorSelected`.
- Uses `PopupMenuButton` to show a list of available colors from `ColorSelection.values`.
- Disables the currently selected color in the menu.
- Calls `changeColor(index)` when a new color is chosen.

#### c) `category_card.dart`
- Stateless widget accepting a `FoodCategory`.
- Builds a `Card` with a `Stack` containing:
    - Clipped image with rounded top corners.
    - Positioned "Yummy" text (top‑left) and rotated "Smoothies" text (bottom‑right).
    - `ListTile` showing category name and restaurant count.
- Applies text theme colors using `Theme.of(context).textTheme.apply(...)`.

#### d) `post_card.dart`
- Stateless widget accepting a `Post`.
- Builds a `Card` with padding.
- `Row` containing:
    - `CircleAvatar` with `post.profileImageUrl`.
    - `SizedBox` spacing.
    - `Expanded` column with comment (max 2 lines, ellipsis) and timestamp.

#### e) `restaurant_landscape_card.dart`
- Stateless widget accepting a `Restaurant`.
- Builds a `Card` with a `Column`:
    - Clipped top image with `AspectRatio(2)`.
    - `ListTile` with restaurant name and attributes.

### Step 7: Build and Run
Execute `flutter run` to launch the app. Verify that:
- The bottom navigation switches between the three cards.
- Theme toggle and color selector update the UI instantly.
- All images load correctly from the assets.

## Implementation Notes
- The `ColorSelection` enum from `constants.dart` is used to seed both light and dark themes.
- Use `IndexedStack` in `home.dart` to preserve page state when switching tabs.
- Overlay text on `CategoryCard` uses `RotatedBox(quarterTurns: 1)` for vertical orientation.
- All card components should adapt to theme brightness by applying `Theme.of(context).textTheme.apply(displayColor: ...)`.
- The `models.dart` barrel file allows importing all models with a single statement: `import '../models/models.dart';`.

## Troubleshooting
- **Images not appearing**: Verify asset filenames match exactly those referenced in the model sample data. Ensure `pubspec.yaml` includes the assets folder.
- **Theme changes not reflecting**: Confirm that `setState` is called inside `changeThemeMode` and `changeColor` in `main.dart`.
- **Navigation bar unresponsive**: Check that `onDestinationSelected` updates the `tab` index and calls `setState` in `home.dart`.
- **Missing imports**: If you encounter "undefined class" errors, make sure to import the necessary files (e.g., `import '../models/models.dart';` in card widgets).

Your Yummy app is now ready to showcase a flexible, theme‑aware Flutter UI with a polished card‑based navigation experience!