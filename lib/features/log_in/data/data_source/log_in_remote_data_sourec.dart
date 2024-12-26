import 'package:flutter/foundation.dart';
import 'package:prokoders_test/core/dio/data_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:prokoders_test/core/dio/error_handler.dart';
import 'package:prokoders_test/features/log_in/domain/model/user_model.dart';

abstract class LogInRemoteDataSource {
  Future<DataState> logInWithEmailAndPassWord(
      {required String email, required String password});
}

class LoginRemoteDataSourceImlp implements LogInRemoteDataSource {
  final FirebaseAuth firebaseAuthInstance;

  LoginRemoteDataSourceImlp({required this.firebaseAuthInstance});

  @override
  Future<DataState> logInWithEmailAndPassWord(
      {required String email, required String password}) async {
    try {
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      final googleUser = UserModel(
          name: userCredential.user?.displayName ?? "Google User",
          email: userCredential.user?.email ?? "",
          id: userCredential.user?.uid ?? "-1");
      UserManager userManager = UserManager();
      userManager.setUser(googleUser);
      return DataSuccess(userManager);
    } on FirebaseAuthException catch (e) {
      debugPrint(e.code);
      return DataFailed(
          ExceptionResponse(statusCode: -10, exceptionMessages: [e.code]));
    }
  }
}
