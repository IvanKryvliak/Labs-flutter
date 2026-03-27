import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = (screenWidth / 390).clamp(0.7, 1.6);

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24 * scale, vertical: 8 * scale),
      child: Container(
        height: 42 * scale,
        padding: EdgeInsets.symmetric(horizontal: 16 * scale),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFDEDEDE)),
          borderRadius: BorderRadius.circular(16 * scale),
        ),
        child: Row(
          children: [
            Icon(
              Icons.search,
              color: const Color(0xFF2382AA),
              size: 14 * scale,
            ),
            SizedBox(width: 8 * scale),
            Expanded(
              child: Text(
                'What are u looking for ?',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14 * scale,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF98A2B3),
                ),
              ),
            ),
            Icon(
              Icons.camera_alt_outlined,
              color: const Color(0xFFDEDEDE),
              size: 20 * scale,
            ),
          ],
        ),
      ),
    );
  }
}