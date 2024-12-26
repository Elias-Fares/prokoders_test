part of '../login_screen.dart';

class LoginPage extends StatelessWidget {
  final FormFieldValidator<String>? emailValidator;
  final FormFieldValidator<String>? passwordValidator;
  final TextEditingController? emailTextEditingController;
  final TextEditingController? passwordTextEditingController;
  final VoidCallback loginFunc;
  final GlobalKey<FormState> formKey;
  final bool isLoading;

  const LoginPage({
    super.key,
    this.emailValidator,
    this.passwordValidator,
    this.emailTextEditingController,
    this.passwordTextEditingController,
    required this.loginFunc,
    required this.formKey,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                "Log in here with Firebase",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: const Color.fromARGB(255, 4, 28, 49), fontSize: 26),
              ),
              const SizedBox(height: 40),
              LogInTextFormField(
                textEditingController: emailTextEditingController,
                validator: emailValidator,
                hintText: "Enter your email",
                iconData: Icons.email_outlined,
              ),
              const SizedBox(
                height: 26,
              ),
              LogInTextFormField(
                textEditingController: passwordTextEditingController,
                validator: passwordValidator,
                hintText: "Enter your password",
                iconData: Icons.password_outlined,
                isPassword: true,
              ),
              const SizedBox(height: 50),
              LoadingButton(
                title: "Log in",
                onTap: loginFunc,
                isLoading: isLoading,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
