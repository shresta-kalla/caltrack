import 'package:flutter/material.dart';
import 'package:caltrack/view_models/user_specific_view_model.dart';
import 'package:provider/provider.dart';
import 'router.dart' as LocalRouter;
import 'constants.dart';
import 'package:caltrack/views/app_navigation.dart';

void main() {
  runApp(
    MaterialApp(
      home: ChangeNotifierProvider(
        create: (context) => UserSpecific(initialData: initialData),
        child: AppNavigation(),
      ),
    ),
  );
}
