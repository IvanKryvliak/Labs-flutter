import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Кнопка назад
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 0, top: 24),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFF1F1F5)),
                      ),
                      child: const Icon(
                        Icons.chevron_left,
                        color: Color(0xFF06161C),
                        size: 24,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Іконка
              Container(
                width: 66,
                height: 66,
                decoration: const BoxDecoration(
                  color: Color(0xFFE9F5FA),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: SvgPicture.asset(
                    'assets/icons/rabbit_24.svg',
                    width: 38,
                    height: 38,
                    colorFilter: const ColorFilter.mode(
                      Color(0xFF2382AA),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              // Заголовок
              const Text(
                'Enter your mobile number',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 28,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF06161C),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              // Підзаголовок
              const Text(
                'We will send you a verification code',
                style: TextStyle(
                  fontFamily: 'Urbanist',
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF98A2B3),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),
              // Поле вводу номера
              Container(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Color(0xFF2382AA), width: 2),
                  ),
                ),
                child: Row(
                  children: [
                    const Text(
                      '+213',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF06161C),
                      ),
                    ),
                    Container(
                      width: 1,
                      height: 20,
                      margin: const EdgeInsets.symmetric(horizontal: 8),
                      color: const Color(0xFF06161C),
                    ),
                    const Expanded(
                      child: TextField(
                        keyboardType: TextInputType.phone,
                        style: TextStyle(
                          fontFamily: 'Urbanist',
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFF98A2B3),
                        ),
                        decoration: InputDecoration(
                          hintText: '(000) 000-00-00',
                          hintStyle: TextStyle(
                            fontFamily: 'Urbanist',
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: Color(0xFF98A2B3),
                          ),
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // Кнопка Continue
              SizedBox(
                width: double.infinity,
                height: 53,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      '/home',
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF2382AA),
                    disabledBackgroundColor: const Color(0xFF2382AA),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(
                      fontFamily: 'Urbanist',
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
              // Terms of use
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  text: 'By clicking on "Continue" you are agreeing to our ',
                  style: TextStyle(
                    fontFamily: 'Urbanist',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFA9A9AA),
                  ),
                  children: [
                    TextSpan(
                      text: 'terms of use',
                      style: TextStyle(
                        fontFamily: 'Urbanist',
                        fontSize: 16,
                        color: Color(0xFF06161C),
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFF06161C),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
