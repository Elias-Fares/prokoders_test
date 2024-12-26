import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prokoders_test/core/dio/data_state.dart';
import 'package:prokoders_test/features/log_in/data/data_source/log_in_remote_data_sourec.dart';
import 'package:prokoders_test/features/log_in/data/repository/log_in_repository.dart';
import 'package:prokoders_test/features/log_in/domain/model/user_model.dart';
import 'package:prokoders_test/features/log_in/domain/use_case/user_log_in.dart';
part 'login_state.dart';
part 'log_in_notifier.dart';

final logInDataRemoteSourceProvider = Provider(
  (ref) {
    final firebaseAuthInstance = FirebaseAuth.instance;
    return LoginRemoteDataSourceImlp(
        firebaseAuthInstance: firebaseAuthInstance);
  },
);

final logInRepositoryProvider = Provider(
  (ref) {
    final logInRemoteDataSource = ref.read(logInDataRemoteSourceProvider);
    return LoginRepository(logInRemoteDataSource: logInRemoteDataSource);
  },
);

final logInUseCaseProvider = Provider(
  (ref) {
    final loginRepository = ref.read(logInRepositoryProvider);
    return UserLoginUseCase(loginRepository: loginRepository);
  },
);

final loginProvider = StateNotifierProvider<LoginNotifier, LogInState>(
  (ref) {
    return LoginNotifier(ref);
  },
);



