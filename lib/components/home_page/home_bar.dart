import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final scale = (screenWidth / 390).clamp(0.7, 1.6);

        return AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          titleSpacing: 0,
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16 * scale),
            child: Row(
              children: [
                // Location button
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10 * scale,
                    vertical: 6 * scale,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: const Color(0xFF2382AA)),
                    borderRadius: BorderRadius.circular(16 * scale),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.location_on,
                        color: const Color(0xFF2382AA),
                        size: 14 * scale,
                      ),
                      SizedBox(width: 4 * scale),
                      Text(
                        'Algiers, 476CP...',
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 12 * scale,
                          fontWeight: FontWeight.w500,
                          color: const Color(0xFF313233),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 8 * scale),
                // Vertical divider
                Container(
                  width: 1,
                  height: 30 * scale,
                  color: const Color(0xFF979899),
                ),
                SizedBox(width: 8 * scale),
                // Delivery info
                Icon(
                  Icons.delivery_dining,
                  color: const Color(0xFF2382AA),
                  size: 20 * scale,
                ),
                SizedBox(width: 4 * scale),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Free delivery',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 10 * scale,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF979899),
                      ),
                    ),
                    Text(
                      '800da +',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 11 * scale,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF333333),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            // Avatar
            Container(
              width: 42 * scale,
              height: 42 * scale,
              margin: EdgeInsets.only(right: 16 * scale),
              decoration: BoxDecoration(
                color: const Color(0xFFE9F5FA),
                shape: BoxShape.circle,
                border: Border.all(
                  color: const Color(0xFF2382AA).withValues(alpha: 0.1),
                  width: 1,
                ),
              ),
              child: Icon(
                Icons.person,
                color: const Color(0xFF2382AA),
                size: 22 * scale,
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}