import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../app/themes/app_spacing.dart';
import '../../../../app/themes/app_colors.dart';
import '../../../common/widgets/app_loader.dart';
import '../../../common/widgets/error_widget.dart';
import '../bloc/home_bloc.dart';
import '../../../../domain/entities/home_data.dart';

/// Home page
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(LoadHomeData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          IconButton(icon: const Icon(Icons.search), onPressed: () {}),
        ],
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: AppLoader(size: 48));
          } else if (state is HomeError) {
            return AppErrorWidget(
              message: 'Failed to load home data',
              details: state.failure.message,
              onRetry: () => context.read<HomeBloc>().add(LoadHomeData()),
            );
          } else if (state is HomeLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<HomeBloc>().add(LoadHomeData());
              },
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildGreeting(state.homeData),
                    const SizedBox(height: AppSpacing.xl),
                    _buildQuickActions(state.homeData),
                    const SizedBox(height: AppSpacing.xl),
                    _buildRecentActivities(state.homeData),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildGreeting(HomeData homeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${homeData.greeting},',
          style: Theme.of(context).textTheme.headlineMedium,
        ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.2),
        const SizedBox(height: AppSpacing.sm),
        Text(
          homeData.userName,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(delay: 100.ms, duration: 300.ms).slideY(begin: -0.2),
      ],
    );
  }

  Widget _buildQuickActions(HomeData homeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleLarge,
        ).animate().fadeIn(delay: 200.ms, duration: 300.ms),
        const SizedBox(height: AppSpacing.md),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.5,
            crossAxisSpacing: AppSpacing.md,
            mainAxisSpacing: AppSpacing.md,
          ),
          itemCount: homeData.quickActions.length,
          itemBuilder: (context, index) {
            final action = homeData.quickActions[index];
            return Card(
              child: InkWell(
                onTap: () {},
                borderRadius: BorderRadius.circular(AppSpacing.md),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      _getIconData(action.icon),
                      size: 32,
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      action.title,
                      style: Theme.of(context).textTheme.titleMedium,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ).animate().fadeIn(
              delay: (300 + (index * 100)).ms,
              duration: 300.ms,
            );
          },
        ),
      ],
    );
  }

  Widget _buildRecentActivities(HomeData homeData) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recent Activities',
          style: Theme.of(context).textTheme.titleLarge,
        ).animate().fadeIn(delay: 700.ms, duration: 300.ms),
        const SizedBox(height: AppSpacing.md),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: homeData.recentActivities.length,
          itemBuilder: (context, index) {
            final activity = homeData.recentActivities[index];
            return Card(
              margin: const EdgeInsets.only(bottom: AppSpacing.md),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: AppColors.primaryLight,
                  child: Text(
                    activity.title[0],
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                title: Text(activity.title),
                subtitle: Text(activity.description),
                trailing: Text(
                  _formatTime(activity.timestamp),
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ).animate().fadeIn(
              delay: (800 + (index * 100)).ms,
              duration: 300.ms,
            );
          },
        ),
      ],
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'person':
        return Icons.person;
      case 'settings':
        return Icons.settings;
      case 'notifications':
        return Icons.notifications;
      case 'help':
        return Icons.help;
      default:
        return Icons.circle;
    }
  }

  String _formatTime(DateTime timestamp) {
    final now = DateTime.now();
    final difference = now.difference(timestamp);

    if (difference.inMinutes < 60) {
      return '${difference.inMinutes}m ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours}h ago';
    } else {
      return '${difference.inDays}d ago';
    }
  }
}
