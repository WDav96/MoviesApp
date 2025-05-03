import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "Home"),

        BottomNavigationBarItem(
          icon: Icon(Icons.category_outlined),
          label: "Categories",
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.star_border),
          label: "Favorites",
        ),
      ],
    );
  }
}
