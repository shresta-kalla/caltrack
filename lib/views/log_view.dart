import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:caltrack/view_models/user_specific_view_model.dart';
import 'package:provider/provider.dart';
import 'package:form_validator/form_validator.dart';
import 'package:caltrack/models/log.dart';
import 'package:caltrack/view_models/log_view_model.dart';

class LogPage extends StatefulWidget {
  const LogPage({Key? key}) : super(key: key);

  @override
  State<LogPage> createState() => LogPageState();
}

class LogPageState extends State<LogPage> {
  String date = "";
  String result = "";
  TextEditingController _datedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<String> logEntries = [];

  @override
  Widget build(BuildContext context) {
    var logSpecific = context.watch<LogSpecific>();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 35),
                Text(
                  "Log",
                  style: GoogleFonts.adamina(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                SizedBox(height: 15),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(width: 15),
                            Text(
                              'Enter Date:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'BeautifulFont',
                              ),
                            ),
                            SizedBox(width: 15),
                            Expanded(
                              child: Container(
                                padding: EdgeInsets.only(right: 15.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: _datedController,
                                        onChanged: (value) {
                                          setState(() {
                                            date = value;
                                          });
                                        },
                                        decoration: InputDecoration(
                                          hintText: 'YYYY-MM-DD',
                                          contentPadding: EdgeInsets.all(10.0),
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                        ),
                                        keyboardType: TextInputType.number,
                                        style: TextStyle(
                                            fontFamily: 'BeautifulFont'),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState?.save();
                                          // Call loadLogData to add log data for the entered date
                                          List<String> selectedDateData =
                                              context
                                                  .read<LogSpecific>()
                                                  .getResult(date);

                                          setState(() {
                                            logEntries = selectedDateData;
                                            _datedController.clear();
                                          });
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                        ),
                                      ),
                                      child: Text("Enter"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        // View Today button
                        ElevatedButton(
                          onPressed: () {
                            // Call getResult to get log data for today
                            List<String> logData = context
                                .read<LogSpecific>()
                                .getResult(_getFormattedCurrentDate());

                            setState(() {
                              logEntries = logData;
                              date = _getFormattedCurrentDate();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                            primary: const Color.fromARGB(255, 180, 140, 255),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Text("View Today"),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Column(
                    children: [
                      Text(
                        "Results",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        "Selected Date: $date",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),

                // Display log data based on selected date
                if (logEntries.isNotEmpty)
                  Column(
                    children: logEntries
                        .map((logEntry) => Container(
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.5),
                                ),
                              ),
                              child: ListTile(
                                title: Text(logEntry),
                              ),
                            ))
                        .toList(),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getFormattedCurrentDate() {
    DateTime currentDate = DateTime.now();
    return "${currentDate.year}-${currentDate.month.toString().padLeft(2, '0')}-${currentDate.day.toString().padLeft(2, '0')}";
  }
}
