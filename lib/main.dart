import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router.dart' as LocalRouter;
import 'constants.dart';
import 'package:caltrack/views/app_navigation.dart';
import 'package:caltrack/view_models/user_specific_view_model.dart';
import 'package:caltrack/views/app_navigation.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => UserSpecific(initialData: initialData),
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: loginRoute, // Adjust this based on your route names
    );
  }
}
