import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../routes/route_names.dart';
import '../../core/di/injection.dart' as di;
import '../../presentation/common/pages/splash_page.dart';
import '../../presentation/features/home/pages/home_page.dart';
import '../../presentation/features/home/bloc/home_bloc.dart';

/// GoRouter configuration
class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: RouteNames.splash,
    routes: [
      GoRoute(
        path: RouteNames.splash,
        name: RouteNames.splash,
        builder: (context, state) => const SplashPage(),
      ),
      GoRoute(
        path: RouteNames.home,
        name: RouteNames.home,
        builder: (context, state) => BlocProvider(
          create: (context) => di.getIt<HomeBloc>(),
          child: const HomePage(),
        ),
      ),
      // Add more routes here as needed
    ],
    errorBuilder: (context, state) =>
        Scaffold(body: Center(child: Text('Page not found: ${state.uri}'))),
  );
}
