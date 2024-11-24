import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Timer Provider
final splashTimerProvider = Provider<Timer>((ref) {
  return Timer(const Duration(seconds: 3), () {
    ref.read(navigationProvider.notifier).state = true;
  });
});

// Navigation Provider
final navigationProvider = StateProvider<bool>((ref) => false);

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Navigation state kontrolü
    final isNavigated = ref.watch(navigationProvider);

    // Eğer yönlendirme durumu true ise login ekranına geç
    if (isNavigated) {
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, '/login');
      });
    }

    return Scaffold(
      body: Stack(
        children: [
          Center(child: Text('Splash Screen')),
          Positioned(
            bottom: 50,
            right: 20,
            child: ElevatedButton(
              onPressed: () {
                // Skip butonuna basıldığında navigasyonu hemen true yap
                ref.read(navigationProvider.notifier).state = true;
              },
              child: Text('Skip'),
            ),
          ),
        ],
      ),
    );
  }
}
