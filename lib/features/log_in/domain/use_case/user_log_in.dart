import 'package:prokoders_test/core/dio/data_state.dart';
import 'package:prokoders_test/core/use_case/use_case.dart';
import 'package:prokoders_test/features/log_in/data/repository/log_in_repository.dart';


class UserLoginUseCase implements UseCase<DataState, LogInParams> {
  final LoginRepository loginRepository;

  UserLoginUseCase({required this.loginRepository});
  @override
  Future<DataState> call(LogInParams params) async {
    final response = await loginRepository.logInWithEmailAndPassWord(
        email: params.email, password: params.password);
    return response;
  }
}

class LogInParams {
  final String email;
  final String password;

  LogInParams({required this.email, required this.password});
}
