import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:form_validator/form_validator.dart';
import 'package:intl/intl.dart';
import 'package:caltrack/models/log.dart';
import 'package:caltrack/view_models/log_view_model.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  TextEditingController _caloriesController = TextEditingController();
  TextEditingController _foodTypeController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _heightController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  TextEditingController _durationController = TextEditingController();

  String selectedActivityTypeInput = "Food";
  String selectedFoodTypeInput = "";
  String selectedExerciseTypeInput = "Running";
  String durationInput = "";
  String ageInput = "";
  String genderInput = "";
  String heightInput = "";
  String weightInput = "";
  String caloriesInput = "";

  bool saveToLog = false; // Default log saving option
  bool showResults = false; // Flag to control the visibility of results
  List<String> results = []; // List to store multiple results

  @override
  Widget build(BuildContext context) {
    final logProvider = Provider.of<LogSpecific>(context, listen: false);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Text(
                "Dashboard",
                style: GoogleFonts.adamina(
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              ),
              const SizedBox(height: 15),
              // Input Section
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Select Activity Type:',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'BeautifulFont',
                        ),
                      ),
                      SizedBox(width: 30),
                      DropdownButton<String>(
                        value: selectedActivityTypeInput,
                        onChanged: (String? newValue) {
                          setState(() {
                            selectedActivityTypeInput = newValue!;
                          });
                        },
                        items: <String>['Food', 'Exercise']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: TextStyle(fontFamily: 'BeautifulFont'),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                  SizedBox(height: 15),
                  if (selectedActivityTypeInput == 'Exercise') ...[
                    Row(
                      children: [
                        Text(
                          'Select Exercise Type:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BeautifulFont',
                          ),
                        ),
                        SizedBox(width: 15),
                        DropdownButton<String>(
                          value: selectedExerciseTypeInput,
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedExerciseTypeInput = newValue!;
                            });
                          },
                          items: <String>[
                            'Running',
                            'Cycling',
                            'Walking',
                            'Swimming'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(fontFamily: 'BeautifulFont'),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Enter Duration:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BeautifulFont',
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            controller: _durationController,
                            onChanged: (value) {
                              setState(() {
                                durationInput = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'e.g., 30',
                              suffixText: ' minutes',
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontFamily: 'BeautifulFont'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Enter Age:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BeautifulFont',
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            controller: _ageController,
                            onChanged: (value) {
                              setState(() {
                                ageInput = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'e.g., 21',
                              suffixText: ' years old',
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontFamily: 'BeautifulFont'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Enter Gender:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BeautifulFont',
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            controller: _genderController,
                            onChanged: (value) {
                              setState(() {
                                genderInput = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'female or male',
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            style: TextStyle(fontFamily: 'BeautifulFont'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Enter Height:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BeautifulFont',
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            controller: _heightController,
                            onChanged: (value) {
                              setState(() {
                                heightInput = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'e.g., 64',
                              suffixText: ' inches',
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontFamily: 'BeautifulFont'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 15),
                    Row(
                      children: [
                        Text(
                          'Enter Weight:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BeautifulFont',
                          ),
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: TextFormField(
                            controller: _weightController,
                            onChanged: (value) {
                              setState(() {
                                weightInput = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: '110',
                              suffixText: ' lbs',
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontFamily: 'BeautifulFont'),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (selectedActivityTypeInput == 'Food') ...[
                    Row(
                      children: [
                        Text(
                          'Enter Food Type:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BeautifulFont',
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _foodTypeController,
                            onChanged: (value) {
                              setState(() {
                                selectedFoodTypeInput = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'e.g., Pizza',
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            style: TextStyle(fontFamily: 'BeautifulFont'),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Text(
                          'Enter Calories:',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'BeautifulFont',
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: TextFormField(
                            controller: _caloriesController,
                            onChanged: (value) {
                              setState(() {
                                caloriesInput = value;
                              });
                            },
                            decoration: InputDecoration(
                              hintText: 'e.g., 300 calories',
                              contentPadding: EdgeInsets.all(10.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontFamily: 'BeautifulFont'),
                          ),
                        ),
                      ],
                    ),
                  ],
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Save calculation to Log',
                        style: TextStyle(
                          fontSize: 16,
                          fontFamily: 'BeautifulFont',
                        ),
                      ),
                      Checkbox(
                        value: saveToLog,
                        onChanged: (bool? value) {
                          setState(() {
                            saveToLog = value!;
                          });
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 1),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedActivityTypeInput == 'Exercise') {
                        // Handle exercise activity
                        double burnedCalories = calculateCalories();
                        String exerciseResult =
                            'Exercise Type: $selectedExerciseTypeInput\nDuration: $durationInput\nBurned Calories: ${burnedCalories.toStringAsFixed(2)} calories';
                        print(exerciseResult);
                        results.add(exerciseResult); // Save result to the list

                        // Save to log if the checkbox is checked
                        if (saveToLog) {
                          String currentDate =
                              DateFormat('yyyy-MM-dd').format(DateTime.now());
                          logProvider.loadLogData(currentDate, exerciseResult);
                        }
                      } else {
                        // Handle food activity
                        String foodResult =
                            'Food Type: $selectedFoodTypeInput\nCalories: ${caloriesInput}';
                        print(foodResult);
                        results.add(foodResult); // Save result to the list

                        // Save to log if the checkbox is checked
                        if (saveToLog) {
                          String currentDate =
                              DateFormat('yyyy-MM-dd').format(DateTime.now());
                          logProvider.loadLogData(currentDate, foodResult);
                        }
                      }

                      // Show the results under the button
                      setState(() {
                        showResults = true;
                        selectedActivityTypeInput = "Food";
                        selectedFoodTypeInput = "";
                        selectedExerciseTypeInput = "Running";
                        durationInput = "";
                        ageInput = "";
                        genderInput = "";
                        heightInput = "";
                        weightInput = "";
                        caloriesInput = "";
                      });

                      _caloriesController.clear();
                      _foodTypeController.clear();
                      _weightController.clear();
                      _heightController.clear();
                      _genderController.clear();
                      _ageController.clear();
                      _durationController.clear();
                    },
                    child: Text('Submit',
                        style: TextStyle(fontFamily: 'BeautifulFont')),
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 180, 140, 255),
                    ),
                  ),
                ],
              ),
              // Results Section
              if (showResults) ...[
                SizedBox(height: 1),
                Text(
                  'Results:',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'BeautifulFont',
                  ),
                ),
                SizedBox(height: 5),
                Container(
                  child: Scrollbar(
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        for (String result in results) ...[
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 5),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: result
                                  .split('\n')
                                  .map(
                                    (line) => Text(
                                      line,
                                      style: TextStyle(
                                        fontFamily: 'BeautifulFont',
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void saveToLogFunction(List<String> results) {
    // Implement save the calculation results to the log
    print('Saving to log...');
    for (String result in results) {
      print(result);
    }
  }

  double calculateCalories() {
    double met;

    // Convert height to inches and weight to lbs
    double heightInInches = double.parse(heightInput);
    double weightInLbs = double.parse(weightInput);

    // Convert activity duration to hours
    double durationInHours = double.parse(durationInput.split(' ')[0]) / 60;

    // Calculate BMR based on gender
    double bmr = (genderInput.toLowerCase() == 'male')
        ? (13.75 * (weightInLbs / 2.20462)) +
            (5 * heightInInches) -
            (6.76 * double.parse(ageInput)) +
            66
        : (9.56 * (weightInLbs / 2.20462)) +
            (1.85 * heightInInches) -
            (4.68 * double.parse(ageInput)) +
            655;

    // Assign MET based on selected exercise type
    String activity = selectedExerciseTypeInput.toLowerCase();
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
}
