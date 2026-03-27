import 'package:flutter/material.dart';

class CartSummary extends StatelessWidget {
  final double scale;

  const CartSummary({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16 * scale),
      padding: EdgeInsets.all(24 * scale),
      decoration: BoxDecoration(
        color: const Color(0xFFE9F5FA),
        borderRadius: BorderRadius.vertical(top: Radius.circular(24 * scale)),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 16 * scale),
            child: Text(
              'Add more items to meet the 1500da min order value',
              style: TextStyle(
                fontFamily: 'Urbanist',
                fontSize: 12 * scale,
                fontWeight: FontWeight.w400,
                color: const Color(0xFF2382AA),
              ),
              textAlign: TextAlign.center,
            ),
          ),
          // Підсумок
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Total (without tax)',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 12 * scale,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF06161C),
                ),
              ),
              Text(
                '800.00da',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 14 * scale,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFFFF324B),
                ),
              ),
            ],
          ),
          SizedBox(height: 16 * scale),
          Container(
            width: double.infinity,
            height: 53 * scale,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8DC0D6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100),
                ),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Checkout',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16 * scale,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12 * scale),
                  Icon(
                    Icons.arrow_forward,
                    size: 14 * scale,
                    color: Colors.white,
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