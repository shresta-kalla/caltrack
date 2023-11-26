import 'package:flutter/material.dart';
import 'package:caltrack/view_models/user_specific_view_model.dart';
import 'package:provider/provider.dart';
import 'router.dart' as LocalRouter;
import 'constants.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserSpecific(initialData: initialData),
      child: MaterialApp(
        onGenerateRoute: LocalRouter.Router.generateRoute,
        initialRoute: loginRoute,
      ),
    ),
  );
}

