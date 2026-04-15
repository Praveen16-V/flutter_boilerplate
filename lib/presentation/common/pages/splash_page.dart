import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routes/route_names.dart';
import '../widgets/app_loader.dart';

/// Splash page for app initialization
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async {
    // Simulate initialization
    await Future.delayed(const Duration(seconds: 2));
    
    if (mounted) {
      context.go(RouteNames.home);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const AppLoader(size: 48),
            const SizedBox(height: 24),
            Text(
              'Flutter Boilerplate',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
    );
  }
}
