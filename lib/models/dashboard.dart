class Dashboard {
  String result;
  String selectedActivityType;
  String duration;
  String calories;
  String selectedFoodType;
  String selectedExerciseType;
  bool saveToLog;

  Dashboard({
    required this.selectedActivityType,
    required this.selectedExerciseType,
    required this.selectedFoodType,
    required this.duration,
    required this.calories,
    required this.result,
    required this.saveToLog,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
      selectedActivityType: json["selectedActivityType"],
      selectedExerciseType: json["selectedExerciseType"],
      selectedFoodType: json["selectedFoodType"],
      duration: json["duration"],
      calories: json["calories"],
      result: json["result"],
      saveToLog: json["saveToLog"],
    );
  }
}
