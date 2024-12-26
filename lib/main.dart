import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:prokoders_test/features/log_in/presentation/screen/login_screen.dart';
import 'package:prokoders_test/firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const ProviderScope(child: ProkodersTest(),));
}

class ProkodersTest extends StatelessWidget {
  const ProkodersTest({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prokoders test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
