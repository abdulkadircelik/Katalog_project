import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Renk sabitleri
class AppColors {
  static const darkBlue = Color(0xFF1D1B4C);
  static const purple = Color(0xFF6D61F2);
  static const orange = Color(0xFFFA7022);
}

final splashTimerProvider =
    StateNotifierProvider<SplashTimerNotifier, bool>((ref) {
  return SplashTimerNotifier();
});

class SplashTimerNotifier extends StateNotifier<bool> {
  SplashTimerNotifier() : super(false) {
    _startTimer();
  }

  void _startTimer() {
    Future.delayed(const Duration(seconds: 3), () {
      state = true;
    });
  }

  void skipTimer() {
    state = true;
  }
}

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  void _navigateToNext(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) =>
            const LoginScreen(), // LoginScreen'i bir sonraki adımda oluşturacağız
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<bool>(splashTimerProvider, (previous, shouldNavigate) {
      if (shouldNavigate) {
        _navigateToNext(context);
      }
    });

    return Scaffold(
      backgroundColor: AppColors.darkBlue,
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Logo
            Center(
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
                color: AppColors.purple,
              ),
              // SvgPicture.asset(
              //   'assets/icons/logo.svg',
              //   width: 100,
              //   height: 100,
              //   color: AppColors.purple,
              // ),
            ),

            // Skip Button
            Positioned(
              bottom: 50,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  TextButton(
                    onPressed: () {
                      ref.read(splashTimerProvider.notifier).skipTimer();
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                        color: AppColors.orange,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
