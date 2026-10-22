import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'features/onboarding/presentation/splash_page.dart';

class TahafoozApp extends ConsumerWidget {
  final GlobalKey<NavigatorState>? navigatorKey;
  const TahafoozApp({super.key, this.navigatorKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Tahafooz-e-Namaz',
      navigatorKey: navigatorKey,
      theme: ThemeData(primarySwatch: Colors.indigo),
      home: const SplashPage(),
    );
  }
}
