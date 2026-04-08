import "package:flutter/material.dart";

class ThemeButton extends StatelessWidget{
  const ThemeButton({
    super.key,
    required this.changeThemeMode,
  });

  final Function changeThemeMode;

  @override
  Widget build(BuildContext context){
    // final isBright;
    // 3 FIXME: Use an if/else instead of a boolean expression for clarity
    final isBright = Theme.of(context).brightness == Brightness.light;

    // if(Theme.of(context).brightness == Brightness.light){
    //   isBright = true;
    // }else{
    //   isBright = false;
    // }


    
    // 4 FIXME: Refactor this ternary operator into an if/else statement
    // Icon themeIcon;
    // if (isBright) {
    //   themeIcon = const Icon(Icons.dark_mode_outlined);
    // } else {
    //   themeIcon = const Icon(Icons.light_mode_outlined);
    // }
    return IconButton(
      icon: isBright
          ? const Icon(Icons.dark_mode_outlined)
          : const Icon(Icons.light_mode_outlined),
      // 5 FIXME: Expand this callback into a block for readability
      onPressed: () => changeThemeMode(!isBright),
    );
    // return IconButton(
    //   icon: themeIcon,
    //   onPressed: () {
    //     changeThemeMode(!isBright);
    //   },
    // );
  }
}