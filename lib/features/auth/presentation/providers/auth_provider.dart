import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/init/injection_container.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  return AuthNotifier();
});

class AuthState {
  final bool isLoading;
  final String? error;
  final String? token;

  AuthState({
    this.isLoading = false,
    this.error,
    this.token,
  });

  AuthState copyWith({
    bool? isLoading,
    String? error,
    String? token,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      token: token ?? this.token,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  AuthNotifier() : super(AuthState());

  Future<void> login(String email, String password, bool rememberMe) async {
    try {
      state = state.copyWith(isLoading: true, error: null);

      // TODO: API call yapılacak
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call

      const token = 'dummy_token';

      if (rememberMe) {
        await getIt<SharedPreferences>().setString('token', token);
      }

      state = state.copyWith(
        isLoading: false,
        token: token,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
        error: e.toString(),
      );
    }
  }
}
