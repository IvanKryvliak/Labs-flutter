import 'package:flutter/material.dart';

class ItemsSearch extends StatelessWidget implements PreferredSizeWidget {
  const ItemsSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final scale = (screenWidth / 390).clamp(0.7, 1.6);

        return AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.only(left: 24 * scale),
            child: GestureDetector(
              child: Container(
                width: 42 * scale,
                height: 42 * scale,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFF1F1F5)),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.arrow_back_ios_new,
                  size: 21 * scale,
                  color: const Color(0xFF06161C),
                ),
              ),
            ),
          ),
          title: Container(
            height: 42 * scale,
            padding: EdgeInsets.symmetric(horizontal: 16 * scale),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: const Color(0xFFF1F1F5)),
              borderRadius: BorderRadius.circular(67 * scale),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: const Color(0xFF2382AA),
                  size: 14 * scale,
                ),
                SizedBox(width: 8 * scale),
                Text(
                  'Search products...',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 14 * scale,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF979899),
                  ),
                ),
              ],
            ),
          ),
          centerTitle: false,
          leadingWidth: 66 * scale,
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}