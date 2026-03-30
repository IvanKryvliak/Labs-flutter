import 'package:flutter/material.dart';
import '../components/item_page/items_search.dart';
import '../components/item_page/category_chips.dart';
import '../components/home_page/deal_card.dart';

class ItemsPage extends StatelessWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final scale = (screenWidth / 390).clamp(0.7, 1.6);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: const ItemsSearch(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Категорії
                CategoryChips(scale: scale),
                // SizedBox(height: 8 * scale),
                // Онлайн статус
                Container(
                  width: double.infinity,
                  height: 24 * scale,
                  color: const Color(0xFF07C146),
                  child: Center(
                    child: Text(
                      'You are online now',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 12 * scale,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16 * scale),
                // Товари
                _buildItemsGrid(scale),
                SizedBox(height: 16 * scale),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildItemsGrid(double scale) {
    final items = [
      {
        'name': 'Bell Pepper Nutella',
        'price': '480da',
        'original': '630da',
        'discount': '52%',
        'image': 'images/bell_pepper.png',
      },
      {
        'name': 'Bell Pepper Nutella',
        'price': '110da',
        'original': '195da',
        'discount': '52%',
        'image': 'images/prince.png',
      },
      {
        'name': 'Bell Pepper Nutella',
        'price': '315da',
        'original': '630da',
        'discount': '52%',
        'image': 'images/bell_pepper2.png',
      },
      {
        'name': 'Bell Pepper Nutella',
        'price': '100da',
        'original': '140da',
        'discount': '52%',
        'image': 'images/yogurt.png',
      },
      {
        'name': 'Bell Pepper Nutella',
        'price': '250da',
        'original': '380da',
        'discount': '52%',
        'image': 'images/skyr.png',
      },
      {
        'name': 'Bell Pepper Nutella',
        'price': '220da',
        'original': '360da',
        'discount': '52%',
        'image': 'images/milka.png',
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24 * scale),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8 * scale,
          mainAxisSpacing: 8 * scale,
          childAspectRatio: 163 / 214,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return DealCard(
            name: item['name']!,
            price: item['price']!,
            original: item['original']!,
            discount: item['discount']! + '% Off',
            scale: scale,
            imagePath: item['image'],
            active: index == 3,
          );
        },
      ),
    );
  }
}