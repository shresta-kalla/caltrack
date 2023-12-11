class Dashboard {
  String result;
  String selectedActivityType;
  String selectedFoodType;
  String selectedExerciseType;
  String duration;
  String age;
  String gender;
  String height;
  String weight;
  String calories;
  bool saveToLog;

  Dashboard({
    required this.result,
    required this.selectedActivityType,
    required this.selectedFoodType,
    required this.selectedExerciseType,
    required this.duration,
    required this.age,
    required this.gender,
    required this.height,
    required this.weight,
    required this.calories,
    required this.saveToLog,
  });

  factory Dashboard.fromJson(Map<String, dynamic> json) {
    return Dashboard(
      result: json["result"],
      selectedActivityType: json["selectedActivityType"],
      selectedFoodType: json["selectedFoodType"],
      selectedExerciseType: json["selectedExerciseType"],
      duration: json["duration"],
      age: json["age"],
      gender: json["gender"],
      height: json["height"],
      weight: json["weight"],
      calories: json["calories"],
      saveToLog: json["saveToLog"],
    );
  }
}
