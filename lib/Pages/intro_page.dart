import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final maxWidth = constraints.maxWidth;
          final maxHeight = constraints.maxHeight;

          return Stack(
            clipBehavior: Clip.hardEdge,
            children: [
              // Ellipse 1 — розмите коло ліво-верх
              Positioned(
                left: maxWidth * -0.305,
                top: maxHeight * -0.101,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 88, sigmaY: 88),
                  child: Container(
                    width: maxWidth * 0.708,
                    height: maxWidth * 0.708,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF2382AA).withOpacity(0.11),
                    ),
                  ),
                ),
              ),
              // Ellipse 2 — розмите коло право-центр
              Positioned(
                left: maxWidth * 0.436,
                top: maxHeight * 0.098,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 88, sigmaY: 88),
                  child: Container(
                    width: maxWidth * 0.708,
                    height: maxWidth * 0.708,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF2382AA).withOpacity(0.11),
                    ),
                  ),
                ),
              ),
              // Фото продуктів — нижня частина
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                height: maxHeight * 0.45,
                child: Image.asset(
                  'assets/images/grocery_bag.jpg',
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
              // Листок 1 — право-верх
              Positioned(
                right: maxWidth * 0.05,
                top: maxHeight * 0.037,
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(0, 0, -0.21)
                    ..setEntry(0, 1, 0.98)
                    ..setEntry(1, 0, 0.98)
                    ..setEntry(1, 1, 0.21),
                  child: Image.asset(
                    'assets/images/kindpng_7336354.png',
                    width: maxWidth * 0.116,
                    height: maxWidth * 0.116,
                  ),
                ),
              ),
              // Листок 2 — право-середина, розмитий
              Positioned(
                right: maxWidth * 0.02,
                top: maxHeight * 0.456,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5.5, sigmaY: 5.5),
                  child: Transform(
                    transform: Matrix4.identity()
                      ..setEntry(0, 0, -0.21)
                      ..setEntry(0, 1, 0.98)
                      ..setEntry(1, 0, 0.98)
                      ..setEntry(1, 1, 0.21),
                    child: Image.asset(
                      'assets/images/kindpng_7336354.png',
                      width: maxWidth * 0.116,
                      height: maxWidth * 0.116,
                    ),
                  ),
                ),
              ),
              // Листок 3 — ліво, над фото
              Positioned(
                left: maxWidth * 0.092,
                top: maxHeight * 0.535,
                child: Transform(
                  transform: Matrix4.identity()
                    ..setEntry(0, 0, -0.91)
                    ..setEntry(0, 1, -0.41)
                    ..setEntry(1, 0, -0.41)
                    ..setEntry(1, 1, 0.91),
                  child: Image.asset(
                    'assets/images/kindpng_7336354.png',
                    width: maxWidth * 0.085,
                    height: maxWidth * 0.085,
                  ),
                ),
              ),
              // Основний контент — центрований
              Positioned(
                left: maxWidth * 0.092,
                right: maxWidth * 0.092,
                top: maxHeight * 0.112,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Іконка кролика
                    Container(
                      width: maxWidth * 0.169,
                      height: maxWidth * 0.169,
                      decoration: const BoxDecoration(
                        color: Color(0xFFE9F5FA),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: SvgPicture.asset(
                          'assets/icons/rabbit_24.svg',
                          width: maxWidth * 0.097,
                          height: maxWidth * 0.097,
                          colorFilter: const ColorFilter.mode(
                            Color(0xFF2382AA),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: maxHeight * 0.038),
                    // Заголовок
                    Text(
                      'Get your groceries delivered to your home',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: (maxWidth * 0.072).clamp(20, 32),
                        fontWeight: FontWeight.w700,
                        color: const Color(0xFF06161C),
                        height: 1.29,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: maxHeight * 0.028),
                    // Підзаголовок
                    Text(
                      'The best delivery app in town for delivering your daily fresh groceries',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: (maxWidth * 0.041).clamp(13, 18),
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF98A2B3),
                        height: 1.31,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: maxHeight * 0.047),
                    // Кнопка Shop now
                    Container(
                      width: (maxWidth * 0.487).clamp(160, 240),
                      height: (maxHeight * 0.063).clamp(48, 60),
                      decoration: BoxDecoration(
                        color: const Color(0xFF2382AA),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          'Shop now',
                          style: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: (maxWidth * 0.041).clamp(13, 18),
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}