import "package:flutter/material.dart";
import "components/theme_button.dart";
import "components/color_button.dart";
import "constants.dart";

class Home extends StatefulWidget{
  const Home({
    super.key,
    required this.changeTheme,
    required this.changeColor,
    required this.colorSelected
  });

  final void Function(bool useLightMode) changeTheme;
  final void Function(int) changeColor;
  final ColorSelection colorSelected;

  @override
  State<Home> createState(){
    return _HomeState();
  }
}

class _HomeState extends State<Home>{
  // TODO: Track current Tab
  int tab = 0;

  // TODO: Define tab bar destinations
  List<NavigationDestination> appBarDestination = const [
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: "Category",
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: "Post",
      selectedIcon: Icon(Icons.credit_card),
    ),
    NavigationDestination(
      icon: Icon(Icons.credit_card),
      label: "Restaurant",
      selectedIcon: Icon(Icons.credit_card),
    ),
  ];

  @override
  Widget build(BuildContext context){
    // TODO: Define pages
    final pages = [
      // TODO: Replace with Category Card
      Container(color: Colors.red),
      // TODO: Replace with Post Card
      Container(color: Colors.green),
      // TODO: Repalce with Restaurant Card
      Container(color: Colors.blue)
    ];

    return Scaffold(
      appBar: AppBar(
        elevation: 4.0,
        backgroundColor: Theme.of(context).colorScheme.background,
        actions: [
          ThemeButton(
            changeThemeMode: widget.changeTheme,
          ),
          ColorButton(
            changeColor: widget.changeColor,
            colorSelected: widget.colorSelected
          ),
        ],
      ),
      // TODO: Switch between pages
      body: IndexedStack(
        index: tab,
        children: pages
      ),
      // TODO: Add bottom navigation bar
      // 1
      bottomNavigationBar: NavigationBar(
        // 2
        selectedIndex: tab,
        // 3
        onDestinationSelected: (index){
          setState((){
            tab = index;
          });
        },
        // 4
        destinations: appBarDestination
      ),
    );
  }
}