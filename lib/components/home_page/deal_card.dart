import 'package:flutter/material.dart';

class DealCard extends StatelessWidget {
  final String name;
  final String price;
  final String original;
  final String discount;
  final double scale;
  final String? imagePath;
  final bool active;

  const DealCard({
    super.key,
    required this.name,
    required this.price,
    required this.original,
    required this.discount,
    required this.scale,
    this.imagePath,
    this.active = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 163 * scale,
      height: 214 * scale,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16 * scale),
        border: Border.all(color: const Color(0xFFDEDEDE)),
      ),
      child: Stack(
        children: [
          // Discount badge — ліво-верх
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              width: 34 * scale,
              height: 34 * scale,
              decoration: BoxDecoration(
                color: const Color(0xFFE9F5FA),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16 * scale),
                ),
              ),
              child: Center(
                child: Text(
                  discount.split('%')[0] + '%\nOff',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 7 * scale,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF2382AA),
                    height: 1.2,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          // Camera icon — право-верх
          Positioned(
            top: 10 * scale,
            right: 10 * scale,
            child: Icon(
              Icons.camera_alt_outlined,
              color: const Color(0xFFDEDEDE),
              size: 20 * scale,
            ),
          ),
          // Product image — центр верху
          Positioned(
            top: 24 * scale,
            left: 0,
            right: 0,
            child: Center(
              child: SizedBox(
                width: 70 * scale,
                height: 96 * scale,
                child: imagePath != null
                    ? Image.asset(imagePath!, fit: BoxFit.contain)
                    : Icon(
                        Icons.shopping_bag_outlined,
                        size: 60 * scale,
                        color: Colors.grey.shade300,
                      ),
              ),
            ),
          ),
          // + кнопка
          Positioned(
            bottom: 88 * scale,
            right: 10 * scale,
            child: active
                ? Container(
                    width: 135 * scale,
                    height: 32 * scale,
                    decoration: BoxDecoration(
                      color: const Color(0xFF2382AA),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 8 * scale),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 18 * scale,
                        ),
                        Text(
                          "1 pcs",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 14 * scale,
                          ),
                        ),
                        Icon(Icons.add, color: Colors.white, size: 18 * scale),
                      ],
                    ),
                  )
                : Container(
                    width: 36 * scale,
                    height: 36 * scale,
                    decoration: const BoxDecoration(
                      color: Color(0xFF2382AA),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 18 * scale,
                    ),
                  ),
          ),
          // Інфо блок — низ
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                16 * scale,
                0,
                16 * scale,
                12 * scale,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ціна
                  Text(
                    price,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFFFF324B),
                    ),
                  ),
                  SizedBox(height: 2 * scale),
                  // Стара ціна + знижка
                  Row(
                    children: [
                      Text(
                        original,
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 12 * scale,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF1B1C1E).withOpacity(0.48),
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(width: 4 * scale),
                      Text(
                        discount,
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 8 * scale,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2382AA),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 2 * scale),
                  // Назва
                  Text(
                    name,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 12 * scale,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xFF1B1C1E),
                      height: 1.3,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
