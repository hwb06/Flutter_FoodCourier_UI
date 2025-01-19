import 'package:flutter/material.dart';
import 'package:flutter_food_couriers_ui/screens/home_screen.dart';
import '../constants/colors.dart';
import '../constants/text_styles.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(seconds: 6));
    if (!mounted) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/food_rider.png',
              height: 280,
              width: 280,
            ),
            const SizedBox(height: 20),
            Text(
              'Food Couriers',
              style: AppTextStyles.headline1.copyWith(
                color: AppColors.primary,
                fontSize: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
