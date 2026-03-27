import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF2382AA),      
        child: Center(                        
          child: Container(
            width: 110,                       
            height: 110,                      
            decoration: const BoxDecoration(
              color: Color(0xFF2E99C7),       
              shape: BoxShape.circle,
            ),
            child: Center(
              child: SvgPicture.asset(
                'assets/icons/rabbit_24.svg',
                width: 64,                    
                height: 64,                   
                colorFilter: const ColorFilter.mode(
                  Colors.white,               
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}