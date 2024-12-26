
import 'package:prokoders_test/core/dio/data_state.dart';
import 'package:prokoders_test/features/log_in/data/data_source/log_in_remote_data_sourec.dart';

class LoginRepository {
  final LogInRemoteDataSource logInRemoteDataSource;

  LoginRepository({required this.logInRemoteDataSource});
  Future<DataState> logInWithEmailAndPassWord(
      {required String email, required String password}) async {
        final response = await logInRemoteDataSource.logInWithEmailAndPassWord(email: email, password: password);
    return response;
  }
}
