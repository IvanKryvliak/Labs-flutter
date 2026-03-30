import 'package:flutter/material.dart';
import '../components/home_page/home_bar.dart';
import '../components/home_page/search_bar.dart' show HomeSearchBar;
import '../components/home_page/promo_banner.dart';
import '../components/home_page/section_header.dart';
import '../components/home_page/category_item.dart';
import '../components/home_page/deal_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final scale = (screenWidth / 390).clamp(0.7, 1.6);

        return Scaffold(
          backgroundColor: Colors.white,
          appBar: const HomeAppBar(),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeSearchBar(),
                PromoBanner(scale: scale),
                SectionHeader(
                  title: 'Categories 🙂',
                  onSeeAll: () {},
                  scale: scale,
                ),
                _buildCategoriesGrid(scale),
                SectionHeader(
                  title: 'Best deals 🔥',
                  onSeeAll: () {},
                  scale: scale,
                ),
                _buildDealsList(scale),
                SizedBox(height: 16 * scale),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoriesGrid(double scale) {
    // Рядок 1 - змішані іконки та зображення
    final row1 = [
      {'name': 'Fruits', 'image': 'images/meat.png'},
      {'name': 'Vegetables', 'image': 'images/vegetable.png'},
      {'name': 'Diary', 'image': 'images/fruit.png'},
      {'name': 'Meat', 'image': 'images/milk.png'},
    ];
    // Рядок 2
    final row2 = [
      {'name': 'Meat', 'image': 'images/egg.png'},
      {'name': 'Diary', 'image': 'images/flour.png'},
      {'name': 'Vegetables', 'image': 'images/shapun.png'},
      {'name': 'Fruits', 'image': 'images/cosmetics.png'},
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24 * scale),
      child: Column(
        children: [
          SizedBox(height: 12 * scale),
          _buildCategoryRow(row1, scale),
          SizedBox(height: 12 * scale),
          _buildCategoryRow(row2, scale),
          SizedBox(height: 8 * scale),
        ],
      ),
    );
  }

  Widget _buildCategoryRow(List<Map<String, String>> items, double scale) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: items.map((item) {
        // Отримуємо іконку з безпечною перевіркою
        final iconData = item.containsKey('icon') 
            ? item['icon'] as IconData 
            : Icons.category;
            
        final imagePath = item.containsKey('image') 
            ? item['image'] 
            : null;
        
        return CategoryItem(
          name: item['name'] as String,
          icon: iconData,
          color: const Color(0xFFE9F5FA),
          scale: scale,
          imagePath: imagePath,
        );
      }).toList(),
    );
  }

  Widget _buildDealsList(double scale) {
    final deals = [
      {
        'name': 'Bell Pepper Nutella karmen lopu...',
        'price': '480da',
        'original': '630da',
        'discount': '52%',
        'image': 'images/bell_pepper.png',
      },
      {
        'name': 'Bell Pepper Nutella karmen lopu...',
        'price': '315da',
        'original': '580da',
        'discount': '52%',
        'image': 'images/bell_pepper2.png',
      },
      {
        'name': 'Danone Yogurt x4',
        'price': '220da',
        'original': '390da',
        'discount': '44%',
        'image': 'images/yogurt.png',
      },
      {
        'name': 'SKYR Dairy 500g',
        'price': '310da',
        'original': '450da',
        'discount': '31%',
        'image': 'images/skyr.png',
      },
    ];

    return SizedBox(
      height: 214 * scale,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.fromLTRB(24 * scale, 8 * scale, 24 * scale, 0),
        itemCount: deals.length,
        itemBuilder: (context, index) {
          final deal = deals[index];
          return Padding(
            padding: EdgeInsets.only(right: 8 * scale),
            child: DealCard(
              name: deal['name']!,
              price: deal['price']!,
              original: deal['original']!,
              discount: '${deal['discount']} Off',
              scale: scale,
              imagePath: deal['image'],
            ),
          );
        },
      ),
    );
  }
}