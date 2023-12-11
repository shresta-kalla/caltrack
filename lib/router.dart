import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'constants.dart';
import 'package:caltrack/views/login_view.dart';
import 'package:caltrack/views/sign_up_view.dart';
import 'package:caltrack/models/users.dart';
import 'package:caltrack/view_models/user_specific_view_model.dart';
import 'package:caltrack/models/dashboard.dart';
import 'package:caltrack/view_models/dashboard_view_model.dart';
import 'package:caltrack/views/edit_profile_view.dart';
import 'package:caltrack/views/dashboard_view.dart';
import 'package:caltrack/views/app_navigation.dart';
import 'package:caltrack/models/log.dart';
import 'package:caltrack/view_models/log_view_model.dart';
import 'package:caltrack/views/log_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case loginRoute:
        return MaterialPageRoute(
          builder: (_) => _buildUserSpecificProvider(LoginPage()),
        );
      case signUpRoute:
        return MaterialPageRoute(
          builder: (_) => _buildUserSpecificProvider(SignUpPage()),
        );
      case dashboardRoute:
        return MaterialPageRoute(
          builder: (_) => _buildUserSpecificProvider(DashboardPage()),
        );
      case appNavigationRoute:
        return MaterialPageRoute(
          builder: (_) => _buildUserSpecificProvider(AppNavigation()),
        );
      case profileRoute:
        return MaterialPageRoute(
          builder: (_) => _buildUserSpecificProvider(EditProfile()),
        );
      case logRoute:
        return MaterialPageRoute(
          builder: (_) => _buildUserSpecificProvider(LogPage()),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }

  static ChangeNotifierProvider<UserSpecific> _buildUserSpecificProvider(
      Widget child) {
    return ChangeNotifierProvider<UserSpecific>(
      create: (context) => UserSpecific(),
      child: child,
    );
  }
}
