import 'package:flutter/material.dart';

class CategoryChips extends StatelessWidget {
  final double scale;

  const CategoryChips({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {'name': 'All', 'active': true},
      {'name': 'Spicy', 'active': false},
      {'name': 'Fruits', 'active': false},
      {'name': 'Sweet', 'active': false},
      {'name': 'Kitchen', 'active': false},
      {'name': 'Esqsetional', 'active': false},
    ];

    return SizedBox(
      height: 45 * scale,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24 * scale),
        children: categories.map((category) {
          final isActive = category['active'] as bool;
          final name = category['name'] as String;
          
          return Padding(
            padding: EdgeInsets.only(right: 5 * scale),
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 14 * scale,
                vertical: 10 * scale,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(34.97 * scale),
                color: isActive ? Colors.transparent : Colors.transparent,
              ),
              child: Text(
                name,
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14 * scale,
                  fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
                  color: isActive 
                      ? const Color(0xFF2382AA) 
                      : const Color(0xFF98A2B3),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}