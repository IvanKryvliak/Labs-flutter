import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color color;
  final double scale;
  final String? imagePath;

  const CategoryItem({
    super.key,
    required this.name,
    required this.icon,
    required this.color,
    required this.scale,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 73 * scale,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 73 * scale,
            height: 73 * scale,
            decoration: const BoxDecoration(
              color: Color(0xFFE9F5FA),
              shape: BoxShape.circle,
            ),
            child: imagePath != null
                ? Padding(
                    padding: EdgeInsets.all(16 * scale),
                    child: Image.asset(
                      imagePath!,
                      fit: BoxFit.contain,
                    ),
                  )
                : Icon(
                    icon,
                    color: const Color(0xFF2382AA),
                    size: 30 * scale,
                  ),
          ),
          SizedBox(height: 4 * scale),
          Text(
            name,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 14 * scale,
              fontWeight: FontWeight.w400,
              color: const Color(0xFF06161C),
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}