/// App flavor configuration for multi-environment support
enum Flavor {
  /// Development environment
  dev,

  /// Staging environment
  staging,

  /// Production environment
  prod,
}

/// Flavor configuration helper
class FlavorConfig {
  /// Current app flavor
  static Flavor _currentFlavor = Flavor.dev;

  /// Get current flavor
  static Flavor get currentFlavor => _currentFlavor;

  /// Set current flavor
  static void setFlavor(Flavor flavor) {
    _currentFlavor = flavor;
  }

  /// Check if current flavor is dev
  static bool get isDev => _currentFlavor == Flavor.dev;

  /// Check if current flavor is staging
  static bool get isStaging => _currentFlavor == Flavor.staging;

  /// Check if current flavor is prod
  static bool get isProd => _currentFlavor == Flavor.prod;

  /// Get flavor name
  static String get flavorName => _currentFlavor.name.toUpperCase();
}
