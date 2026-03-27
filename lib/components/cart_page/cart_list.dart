import 'package:flutter/material.dart';

class CartItemsList extends StatelessWidget {
  final double scale;

  const CartItemsList({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'name': 'Bell Pepper Red x4',
        'price': '220da',
        'oldPrice': '390da',
        'image': 'images/yogurt.png',
        'quantity': 1,
        'isActive': true,
      },
      {
        'name': 'Butternut Squash',
        'price': '220da',
        'oldPrice': '390da',
        'image': 'images/skyr.png',
        'quantity': 1,
        'isActive': true,
      },
      {
        'name': 'Arabic Ginger',
        'price': '220da',
        'oldPrice': '390da',
        'image': 'images/bell_pepper2.png',
        'quantity': 1,
        'isActive': true,
      },
      {
        'name': 'Organic Banana',
        'price': '220da',
        'oldPrice': '390da',
        'image': 'images/fruit.png',
        'quantity': 1,
        'isActive': true,
      },
      {
        'name': 'Organic Banana',
        'price': '220da',
        'oldPrice': '390da',
        'image': 'images/milka.png',
        'quantity': 1,
        'isActive': false,
      },
    ];

    return Column(
      children: List.generate(items.length, (index) {
        final item = items[index];

        return CartItem(
          scale: scale,
          name: item['name'] as String,
          price: item['price'] as String,
          oldPrice: item['oldPrice'] as String,
          imagePath: item['image'] as String,
          quantity: item['quantity'] as int,
          isActive: item['isActive'] as bool,
          onQuantityChanged: (_) {},
        );
      }),
    );
  }
}

class CartItem extends StatelessWidget {
  final double scale;
  final String name;
  final String price;
  final String oldPrice;
  final String imagePath;
  final int quantity;
  final bool isActive;
  final Function(int) onQuantityChanged;

  const CartItem({
    super.key,
    required this.scale,
    required this.name,
    required this.price,
    required this.oldPrice,
    required this.imagePath,
    required this.quantity,
    required this.isActive,
    required this.onQuantityChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 24 * scale,
        vertical: 12 * scale,
      ),
      child: Row(
        children: [
          Stack(
            children: [
              Container(
                width: 71 * scale,
                height: 62 * scale,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFFDEDEDE)),
                  borderRadius: BorderRadius.circular(16 * scale),
                ),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    width: 58 * scale,
                    height: 58 * scale,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              /// ACTIVE CHECK
              if (isActive)
                Positioned(
                  top: -2,
                  left: -2,
                  child: Container(
                    width: 22 * scale,
                    height: 22 * scale,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE9F5FA),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.check,
                      size: 14 * scale,
                      color: Color(0xFF2382AA),
                    ),
                  ),
                ),
            ],
          ),
          SizedBox(width: 12 * scale),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// PRICE ROW
                Row(
                  children: [
                    Text(
                      price,
                      style: TextStyle(
                        fontSize: 14 * scale,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFFFF324B),
                      ),
                    ),
                    SizedBox(width: 6 * scale),
                    Text(
                      oldPrice,
                      style: TextStyle(
                        fontSize: 12 * scale,
                        decoration: TextDecoration.lineThrough,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 4 * scale),

                Text(
                  name,
                  style: TextStyle(
                    fontSize: 14 * scale,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),

          /// QUANTITY BUTTON
          Container(
            width: 116 * scale,
            height: 36 * scale,
            padding: EdgeInsets.symmetric(horizontal: 12 * scale),
            decoration: BoxDecoration(
              color: const Color(0xFF2382AA),
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    if (quantity > 1) {
                      onQuantityChanged(quantity - 1);
                    }
                  },
                  child: Icon(Icons.remove,
                      color: Colors.white, size: 18 * scale),
                ),

                Text(
                  '$quantity pcs',
                  style: TextStyle(
                    fontSize: 14 * scale,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),

                GestureDetector(
                  onTap: () {
                    onQuantityChanged(quantity + 1);
                  },
                  child:
                      Icon(Icons.add, color: Colors.white, size: 18 * scale),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
