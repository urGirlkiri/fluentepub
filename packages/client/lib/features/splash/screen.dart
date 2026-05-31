import 'package:fluentepub/config/context.dart';
import 'package:fluentepub/config/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  Future<void> _initializeApp() async {
    context.db.migration;

    FlutterNativeSplash.remove();

    if (mounted) {
      context.goNamed(Routes.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.palette.yaleBlue,
      body: Center(
        child: Image.asset(
          'assets/branding/512x512-dark.png',
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}