import 'package:flutter/material.dart';
import 'package:caltrack/models/dashboard.dart';
import 'package:caltrack/models/log.dart';

final Map<String, List<Log>> LoginitialData = {
  "2023-01-17": [
    Log(date: "2023-01-17", result: "Food type: pizza\nCalories: 300")
  ],
  "2023-07-07": [
    Log(
        date: "2023-07-07",
        result:
            "Exercise type: Running\nDuration: 30\nBurned Calories: 276.03 calories"),
    Log(date: "2023-07-07", result: "Food type: fries\nCalories: 365")
  ],
  "2023-12-08": [
    Log(
        date: "2023-12-08",
        result:
            "Exercise type: Swimming\nDuration: 20\nBurned Calories: 131.68 calories")
  ],
  "2023-02-07": [
    Log(date: "2023-02-07", result: "Food type: burger\nCalories: 250")
  ],
};

class LogSpecific with ChangeNotifier {
  final Map<String, List<Log>> _logDatabase = LoginitialData;
  Log? _currentLog;

  LogSpecific({Map<String, List<Log>>? LoginitialData}) {
    _logDatabase.addAll(LoginitialData ?? {});
  }

  List<bool> loadLogData(String date, String result) {
    _logDatabase[date] ??= [];
    _logDatabase[date]!.add(Log(date: date, result: result));

    notifyListeners();
    return [true];
  }

  List<String> getResult(String date) {
    List<String> results = [];

    // Checking if logDatabase contains data for the given date
    if (logDatabase.containsKey(date)) {
      results = logDatabase[date]!.map((log) => log.result).toList();
    } else {
      results.add("No entries for the selected date");
    }

    return results;
  }

  Log? get currentLog => _currentLog;
  Map<String, List<Log>> get logDatabase => _logDatabase;
}
