import 'package:flutter/material.dart';
import '../components/item_page/items_search.dart';
import '../components/cart_page/cart_list.dart';
import '../components/cart_page/cart_summary.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = constraints.maxWidth;
        final scale = (screenWidth / 390).clamp(0.7, 1.6);

        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          appBar: const ItemsSearch(),
          body: SafeArea(
            child: Column(
              children: [
                _buildDeliveryProgress(scale),

                Expanded(
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      CartItemsList(scale: scale),
                      SizedBox(height: 16 * scale),
                    ],
                  ),
                ),

                CartSummary(scale: scale),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDeliveryProgress(double scale) {
    return Padding(
      padding: EdgeInsets.fromLTRB(
        24 * scale,
        12 * scale,
        24 * scale,
        8 * scale,
      ),
      child: Row(
        children: [
          _step("Cart items", true, scale),
          SizedBox(width: 8 * scale),
          _step("Checkout", false, scale),
          SizedBox(width: 8 * scale),
          _step("Delivery", false, scale),
        ],
      ),
    );
  }

  Widget _step(String title, bool active, double scale) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// TEXT
          Text(
            title,
            style: TextStyle(
              fontFamily: 'Urbanist',
              fontSize: 14 * scale,
              fontWeight: FontWeight.w500,
              color: active ? const Color(0xFF2382AA) : const Color(0xFF979899),
            ),
          ),

          SizedBox(height: 8 * scale),

          /// BAR
          Container(
            height: 4 * scale,
            decoration: BoxDecoration(
              color: active ? const Color(0xFF2382AA) : const Color(0xFFE0E0E0),
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ],
      ),
    );
  }
}
