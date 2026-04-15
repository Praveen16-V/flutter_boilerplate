import '../../../domain/entities/home_data.dart';

/// Home remote datasource
class HomeRemoteDataSource {
  /// Get home data from API
  Future<HomeData> getHomeData() async {
    // Simulate API call
    // In production, this would make an actual API call using ApiClient
    await Future.delayed(const Duration(milliseconds: 500));

    // Mock data
    return HomeData(
      greeting: 'Good Morning',
      userName: 'John Doe',
      quickActions: [
        QuickAction(
          id: '1',
          title: 'Profile',
          icon: 'person',
          route: '/profile',
        ),
        QuickAction(
          id: '2',
          title: 'Settings',
          icon: 'settings',
          route: '/settings',
        ),
        QuickAction(
          id: '3',
          title: 'Notifications',
          icon: 'notifications',
          route: '/notifications',
        ),
        QuickAction(id: '4', title: 'Help', icon: 'help', route: '/help'),
      ],
      recentActivities: [
        RecentActivity(
          id: '1',
          title: 'Activity 1',
          description: 'This is a recent activity',
          timestamp: DateTime.now().subtract(const Duration(hours: 2)),
        ),
        RecentActivity(
          id: '2',
          title: 'Activity 2',
          description: 'Another recent activity',
          timestamp: DateTime.now().subtract(const Duration(hours: 5)),
        ),
        RecentActivity(
          id: '3',
          title: 'Activity 3',
          description: 'More recent activity',
          timestamp: DateTime.now().subtract(const Duration(days: 1)),
        ),
      ],
    );
  }
}
