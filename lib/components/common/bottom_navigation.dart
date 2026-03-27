import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.currentIndex,
    this.onTap,
  });

  static const _icons = [
    'assets/icons/home_bottom.svg',
    'assets/icons/items_bottom.svg',
    'assets/images/cart_bottom.png',
    'assets/icons/event_bottom.svg',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final scale = (screenWidth / 390).clamp(0.7, 1.6);

    return Container(
      height: 64 * scale,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF2382AA).withOpacity(0.16),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (index) {
          final isActive = currentIndex == index;
          final isCart = index == 2;

          return GestureDetector(
            onTap: () => onTap?.call(index),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  width: 48 * scale,
                  height: 48 * scale,
                  decoration: isActive && index == 0
                      ? BoxDecoration(
                          color: const Color(0xFF2382AA).withOpacity(0.16),
                          shape: BoxShape.circle,
                        )
                      : null,
                  child: Center(
                    child: _buildIcon(_icons[index], isActive, scale),
                  ),
                ),

                /// Badge cart
                if (isCart)
                  Positioned(
                    right: -2 * scale,
                    top: -2 * scale,
                    child: Container(
                      width: 18 * scale,
                      height: 18 * scale,
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF324B),
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 1),
                      ),
                      child: Center(
                        child: Text(
                          '4',
                          style: TextStyle(
                            fontSize: 10 * scale,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }

  /// ---------- ICON BUILDER ----------
  Widget _buildIcon(String path, bool isActive, double scale) {
    final color = isActive ? const Color(0xFF2382AA) : Colors.grey;

    /// ✅ SVG
    if (path.endsWith('.svg')) {
      return SvgPicture.asset(
        path,
        width: 24 * scale,
        height: 24 * scale,
        theme: SvgTheme(currentColor: color),
      );
    }

    /// ✅ PNG
    return Image.asset(
      path,
      width: 24 * scale,
      height: 24 * scale,
      color: color,
      colorBlendMode: BlendMode.modulate,
    );
  }
}
