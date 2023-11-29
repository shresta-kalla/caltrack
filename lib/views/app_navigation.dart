import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:caltrack/constants.dart';
import 'package:caltrack/view_models/user_specific_view_model.dart';
import 'package:caltrack/views/login_view.dart';
import 'package:caltrack/views/sign_up_view.dart';
import 'package:caltrack/views/dashboard_view.dart';
import 'package:caltrack/constants.dart';

class AppNavigation extends StatefulWidget {
  const AppNavigation({Key? key, this.initialIndex = 0}) : super(key: key);

  // Optional parameter to set the initial index
  final int initialIndex;

  @override
  State<AppNavigation> createState() => AppNavigationState();
}

class AppNavigationState extends State<AppNavigation> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // Set the initial index when the widget is created
    _selectedIndex = 1;
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

      if (_selectedIndex == 0) {
        GoRouter.of(context).go("/login");
      } else if (_selectedIndex == 1) {
        GoRouter.of(context).go("/dashboard");
      } else if (_selectedIndex == 2) {
        GoRouter.of(context).go("/sign_up");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        indicatorColor: Colors.white,
        backgroundColor: Color.fromARGB(255, 180, 140, 255),
        selectedIndex: _selectedIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.person_2_sharp),
            label: 'Profile',
          ),
          NavigationDestination(
            icon: Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: 'Log',
          ),
        ],
      ),
      body: <Widget>[
        LoginPage(),
        DashboardPage(),
        SignUpPage(),
      ][_selectedIndex],
    );
  }
}
