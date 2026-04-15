/// Home data entity
class HomeData {
  final String greeting;
  final String userName;
  final List<QuickAction> quickActions;
  final List<RecentActivity> recentActivities;

  HomeData({
    required this.greeting,
    required this.userName,
    required this.quickActions,
    required this.recentActivities,
  });
}

/// Quick action entity
class QuickAction {
  final String id;
  final String title;
  final String icon;
  final String route;

  QuickAction({
    required this.id,
    required this.title,
    required this.icon,
    required this.route,
  });
}

/// Recent activity entity
class RecentActivity {
  final String id;
  final String title;
  final String description;
  final DateTime timestamp;
  final String? imageUrl;

  RecentActivity({
    required this.id,
    required this.title,
    required this.description,
    required this.timestamp,
    this.imageUrl,
  });
}
