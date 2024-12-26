part of 'log_in_provider.dart';
class LogInState {
  final UserManager? userManager;
  final bool isLoading;
  final String? error;

  LogInState(
      {required this.userManager,
      required this.isLoading,
      required this.error});

  LogInState copyWith(
      {UserManager? userManager, bool? isLoading, String? error}) {
    return LogInState(
        userManager: userManager ?? this.userManager,
        isLoading: isLoading ?? this.isLoading,
        error: error ?? this.error);
  }
}