// ignore_for_file: use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prokoders_test/core/validator/fields_validator.dart';
import 'package:prokoders_test/core/widget/show_snack_bar.dart';
import 'package:prokoders_test/features/items_fetch/presentation/screen/items_screen.dart';
import 'package:prokoders_test/features/log_in/presentation/provider/log_in_provider.dart';
part 'widget/loading_button.dart';
part 'widget/login_page.dart';
part 'widget/log_in_text_form_field.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    final logInState = ref.watch(loginProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text("Log in screen"),
        ),
        body: LoginPage(
          formKey: _formKey,
          isLoading: logInState.isLoading,
          emailTextEditingController: emailTextEditingController,
          passwordTextEditingController: passwordTextEditingController,
          emailValidator: (val) {
            return FieldsValidator.validateEmail(email: val ?? "");
          },
          passwordValidator: (val) {
            return FieldsValidator.validatePassword(password: val ?? "");
          },
          loginFunc: () async {
            if (!(_formKey.currentState?.validate() ?? false)) {
              return;
            }
            await ref.read(loginProvider.notifier).logInWithEmailAndPassword(
                email: emailTextEditingController.text.trim(),
                password: passwordTextEditingController.text.trim());

            final updatedLoginState = ref.read(loginProvider);

            if (updatedLoginState.error != null) {
              showSnackBarMessage(context,
                  message: updatedLoginState.error ?? "");
            }
            if (updatedLoginState.userManager != null) {
              showSnackBarMessage(context,
                  message: "You have successfully logged in.", isError: false);
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) {
                  return const ItemsScreen();
                },
              ));
            }
          },
        ));
  }
}
