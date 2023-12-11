import 'package:flutter/material.dart';
import 'package:caltrack/models/dashboard.dart';
import 'package:caltrack/models/users.dart';
import 'package:caltrack/view_models/user_specific_view_model.dart';
import 'package:flutter/foundation.dart';

class DashBoardViewModel with ChangeNotifier {
  final Dashboard dashboard;

  DashBoardViewModel({required this.dashboard});

  String get result {
    return this.dashboard.result;
  }

  String get selectedActivityType {
    return this.dashboard.selectedActivityType;
  }

  String get selectedFoodType {
    return this.dashboard.selectedFoodType;
  }

  String get selectedExerciseType {
    return this.dashboard.selectedExerciseType;
  }

  String get duration {
    return this.dashboard.duration;
  }

  String get age {
    return this.dashboard.age;
  }

  String get gender {
    return this.dashboard.gender;
  }

  String get height {
    return this.dashboard.height;
  }

  String get weight {
    return this.dashboard.weight;
  }

  String get calories {
    return this.dashboard.calories;
  }

  bool get saveToLog {
    return this.dashboard.saveToLog;
  }

  double calculateCalories() {
    double met;

    // Convert height to inches and weight to lbs
    double heightInInches = double.parse(this.height);
    double weightInLbs = double.parse(this.weight);

    // Convert activity duration to hours
    double durationInHours = double.parse(this.duration.split(' ')[0]) / 60;

    // Calculate BMR based on gender
    double bmr = (this.gender.toLowerCase() == 'male')
        ? (13.75 * (weightInLbs / 2.20462)) +
            (5 * heightInInches) -
            (6.76 * double.parse(this.age)) +
            66
        : (9.56 * (weightInLbs / 2.20462)) +
            (1.85 * heightInInches) -
            (4.68 * double.parse(this.age)) +
            655;

    // Assign MET based on selected exercise type
    String activity = this.selectedExerciseType.toLowerCase();
    switch (activity) {
      case 'running':
        met = 11.5;
        break;
      case 'walking':
        met = 5;
        break;
      case 'cycling':
        met = 8;
        break;
      case 'swimming':
        met = 9.5;
        break;
      default:
        met = 0;
    }

    // Calculate burned calories using the formula: Calorie Burn = (BMR / 24) x MET x T
    // http://www.shapesense.com/fitness-exercise/calculators/activity-based-calorie-burn-calculator.aspx
    double calorieBurn = (bmr / 24) * met * durationInHours;

    return calorieBurn;
  }

  void saveToLogFunction() {
    print('Saving to log...');
  }
}
