import 'package:flutter/material.dart';

class PromoBanner extends StatelessWidget {
  final double scale;

  const PromoBanner({super.key, required this.scale});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110 * scale,
      child: ListView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 24 * scale),
        children: [
          _BannerCard(
            scale: scale,
            color: const Color(0xFF83D234),
            topLabel: 'Ramadan Offers',
            mainLabel: 'Get 25%',
            buttonLabel: 'Grab Offer',
            buttonColor: const Color(0xFF6BA821),
            backgroundImage: 'images/banner.png',
          ),
          SizedBox(width: 8 * scale),
          _BannerCard(
            scale: scale,
            color: const Color(0xFF2382AA),
            topLabel: 'Shop now',
            mainLabel: 'Pay Later !',
            buttonLabel: 'OCTOBER 7',
            buttonColor: const Color(0xFF3CC5FF),
            isPayLater: true,
            backgroundImage: 'images/banner.png',
          ),
          SizedBox(width: 8 * scale),
          _BannerCard(
            scale: scale,
            color: const Color(0xFFFD4755),
            topLabel: 'Ramadan Offers',
            mainLabel: 'Get 25%',
            buttonLabel: 'Grab Offer',
            buttonColor: const Color(0xFF6BA821),
            backgroundImage: 'images/banner.png',
          ),
        ],
      ),
    );
  }
}

class _BannerCard extends StatelessWidget {
  final double scale;
  final Color color;
  final String topLabel;
  final String mainLabel;
  final String buttonLabel;
  final Color buttonColor;
  final bool isPayLater;
  final String? backgroundImage;

  const _BannerCard({
    required this.scale,
    required this.color,
    required this.topLabel,
    required this.mainLabel,
    required this.buttonLabel,
    required this.buttonColor,
    this.isPayLater = false,
    this.backgroundImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 342 * scale,
      height: 99 * scale,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16 * scale),
      ),
      child: Stack(
        children: [
          // Фото продуктів — права частина
          if (backgroundImage != null)
            Positioned(
              right: 0,
              top: 0,
              bottom: 0,
              width: 320 * scale,
              child: Image.asset(backgroundImage!, fit: BoxFit.cover),
            ),
          // Кольорове коло — ліва частина
          Positioned(
            left: -150 * scale,
            top: -(120 * scale),
            child: Container(
              width: 300 * scale,
              height: 300 * scale,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Текст
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 175 * scale,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                14 * scale, 10 * scale, 8 * scale, 10 * scale,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    topLabel,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 12 * scale,
                      fontWeight: FontWeight.w500,
                      color: Colors.white.withOpacity(0.9),
                    ),
                  ),
                  SizedBox(height: 1 * scale),
                  Text(
                    mainLabel,
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: isPayLater ? 24 * scale : 26 * scale,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      letterSpacing: -0.5,
                    ),
                  ),
                  SizedBox(height: 2 * scale),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8 * scale,
                      vertical: 2 * scale,
                    ),
                    decoration: BoxDecoration(
                      color: isPayLater ? buttonColor : Colors.white,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: Text(
                      buttonLabel,
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: isPayLater ? 8 * scale : 11 * scale,
                        fontWeight: FontWeight.w600,
                        color: isPayLater
                            ? const Color(0xFF263238)
                            : buttonColor,
                      ),
                    ),
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