import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'router.dart' as LocalRouter;
import 'constants.dart';
import 'package:caltrack/views/app_navigation.dart';
import 'package:caltrack/view_models/user_specific_view_model.dart';
import 'package:caltrack/models/log.dart';
import 'package:caltrack/view_models/log_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => UserSpecific(initialData: initialData)),
        ChangeNotifierProvider(
            create: (context) => LogSpecific(LoginitialData: LoginitialData)),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: LocalRouter.Router.generateRoute,
      initialRoute: loginRoute,
    );
  }
}
