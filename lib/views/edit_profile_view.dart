import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:caltrack/models/users.dart';
import 'package:caltrack/view_models/user_specific_view_model.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => EditProfileState();
}

class EditProfileState extends State<EditProfile> {
  bool isHidden = true;

  final formKey = GlobalKey<FormState>();


  String firstNameInput = "";
  String lastNameInput = "";
  String userInput = "";
  String passwordInput = "";
  String confirmPasswordInput = "";
  String ageInput = "";
  String genderInput = "";
  String heightInput = "";
  String weightInput = "";

  var firstNameValidator =
  ValidationBuilder(requiredMessage: "First Name is required").build();
  var lastNameValidator =
  ValidationBuilder(requiredMessage: "Last Name is required").build();
  var userInputValidator =
  ValidationBuilder(requiredMessage: "UserName is required").build();
  var passwordValidator =
  ValidationBuilder(requiredMessage: "Password is required").build();
  var confirmPasswordValidator =
  ValidationBuilder(requiredMessage: "Confirm Password is required")
      .build();
  var ageInputValidator =
  ValidationBuilder(requiredMessage: "Age is required").build();
  var genderInputValidator =
  ValidationBuilder(requiredMessage: "Gender is required").build();
  var heightInputValidator =
  ValidationBuilder(requiredMessage: "Height is required").build();
  var weightInputValidator =
  ValidationBuilder(requiredMessage: "Weight is required").build();

  List? isError;
  Widget _styledText(String text, Color color, {double fontSize = 20.0}) {
    return Text(
      text,
      style: GoogleFonts.adamina(
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
        color: color,
      ),
    );
  }
  void showLogoutDialog(BuildContext context) {
    Users? currentUser = Provider.of<UserSpecific>(context, listen: false).currentUser;

    if (currentUser?.userName != null) {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text('Hold on!'),
          content: const Text('Are you sure you want to log out?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text(
                'Cancel',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/login");
              },
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Logout',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    } else {
      Navigator.pushNamed(context, "/login");
    }
  }


  @override
  Widget build(BuildContext context) {
    Users? currentUser = context.watch<UserSpecific>().currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        title: _styledText('Edit Profile', Colors.black, fontSize: 24.0),
        actions: [
          GestureDetector(
            onTap: () {

              showLogoutDialog(context);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.logout, color: Colors.black),
            ),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: Container(
          padding: const EdgeInsets.only(left: 15, top: 20, right: 15),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: ListView(
              children: [
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: ((value) =>
                        setState(() => firstNameInput = value!)),
                    validator: firstNameValidator,
                    initialValue: currentUser?.firstName ?? "",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      labelText: "First Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: ((value) =>
                        setState(() => lastNameInput = value!)),
                    validator: lastNameValidator,
                    initialValue: currentUser?.lastName ?? "",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      labelText: "Last Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: ((value) => setState(() => userInput = value!)),
                    validator: userInputValidator,
                    initialValue: currentUser?.userName ?? "",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      labelText: "UserName",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    obscureText: isHidden,
                    onSaved: ((value) =>
                        setState(() => passwordInput = value!)),
                    validator: passwordValidator,
                    initialValue: currentUser?.password ?? "",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.remove_red_eye,
                            color: Colors.grey),
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
                        },
                      ),
                      labelText: "Password",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: (value) => setState(() => ageInput = value!),
                    validator: ageInputValidator,
                    initialValue: currentUser?.age ?? "",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      labelText: "Age",
                      floatingLabelBehavior: FloatingLabelBehavior.always,

                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: (value) => setState(() => genderInput = value!),
                    validator: genderInputValidator,
                    initialValue: currentUser?.gender ?? "",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      labelText: "Gender",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: (value) => setState(() => heightInput = value!),
                    validator: heightInputValidator,
                    initialValue: currentUser?.height.toString() ?? "",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      labelText: "Height",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: (value) => setState(() => weightInput = value!),
                    validator: weightInputValidator,
                    initialValue: currentUser?.weight.toString() ?? "",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      labelText: "Weight",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState?.save();

                            debugPrint(formKey.currentState.toString());
                            debugPrint(firstNameInput);
                            debugPrint(lastNameInput);
                            debugPrint(userInput);
                            debugPrint(passwordInput);
                            debugPrint(ageInput);
                            debugPrint(genderInput);
                            debugPrint(heightInput);
                            debugPrint(weightInput);

                            var editProfileResult =
                            context.read<UserSpecific>().editProfile(
                              firstNameInput,
                              lastNameInput,
                              userInput,
                              passwordInput,
                              ageInput,
                              genderInput,
                              heightInput,
                              weightInput,
                            );

                            //formKey.currentState?.reset();

                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text("Profile successfully edited"),
                            ));

                            debugPrint(editProfileResult.toString());
                          }
                        },
                        child: const Text(
                          "Save",
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 2,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                          const Color.fromARGB(255, 180, 140, 255),
                          padding: const EdgeInsets.symmetric(horizontal: 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

