import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAll;
  final double scale;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAll,
    required this.scale,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(24 * scale, 16 * scale, 16 * scale, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 14 * scale,
              fontWeight: FontWeight.w500,
              color: const Color(0xFF06161C),
            ),
          ),
          if (onSeeAll != null)
            TextButton(
              onPressed: onSeeAll,
              style: TextButton.styleFrom(padding: EdgeInsets.zero),
              child: Text(
                'See all',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14 * scale,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF2382AA),
                ),
              ),
            ),
        ],
      ),
    );
  }
}