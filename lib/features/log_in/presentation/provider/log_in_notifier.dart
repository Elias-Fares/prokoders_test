part of 'log_in_provider.dart';
class LoginNotifier extends StateNotifier<LogInState> {
  final Ref ref;

  LoginNotifier(this.ref)
      : super(LogInState(userManager: null, isLoading: false, error: null));
  Future<void> logInWithEmailAndPassword(
      {required String email, required String password}) async {
    final getUseCase = ref.read(logInUseCaseProvider);
    state = state.copyWith(isLoading: true);
    final response =
        await getUseCase.call(LogInParams(email: email, password: password));
    if (response is DataSuccess) {
      state =
          LogInState(userManager: response.data, isLoading: false, error: null);
    } else {
      state = LogInState(
          userManager: null,
          error: response.exceptionResponse?.exceptionMessages.firstOrNull ??
              "Error Occured",
          isLoading: false);
    }
  }
}
