import 'package:flutter/material.dart';
import 'package:form_validator/form_validator.dart';
import 'package:go_router/go_router.dart';
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

  @override
  Widget build(BuildContext context) {
    Users? currentUser = context.watch<UserSpecific>().currentUser;

    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        backgroundColor: Colors.yellow[200],
        elevation: 1,
        centerTitle: false,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black),
          onPressed: (() => GoRouter.of(context).pop()),
        ),
        title: const Text('Edit Profile'),
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
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: ((value) =>
                        setState(() => firstNameInput = value!)),
                    validator: firstNameValidator,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      labelText: "First Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: currentUser?.firstName ?? "",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: ((value) =>
                        setState(() => lastNameInput = value!)),
                    validator: lastNameValidator,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      labelText: "Last Name",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: currentUser?.lastName ?? "",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: ((value) => setState(() => userInput = value!)),
                    validator: userInputValidator,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      labelText: "UserName",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: currentUser?.userName ?? "",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    obscureText: isHidden,
                    onSaved: ((value) =>
                        setState(() => passwordInput = value!)),
                    validator: passwordValidator,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
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
                      hintText: "**********",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: (value) => setState(() => ageInput = value!),
                    validator: ageInputValidator,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      labelText: "Age",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: currentUser?.age.toString() ?? "",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: (value) =>
                        setState(() => genderInput = value!), // Add this line
                    validator: genderInputValidator, // Add this line
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      labelText: "Gender", // Add this line
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: currentUser?.gender ?? "",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: (value) => setState(() => heightInput = value!),
                    validator: heightInputValidator,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      labelText: "Height",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: currentUser?.height.toString() ?? "",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: TextFormField(
                    obscureText: false,
                    onSaved: (value) => setState(() => weightInput = value!),
                    validator: weightInputValidator,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 5),
                      labelText: "Weight",
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: currentUser?.weight.toString() ?? "",
                      hintStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () => GoRouter.of(context).pop(),
                      child: const Text(
                        "Cancel",
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 2,
                          color: Colors.black,
                        ),
                      ),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                    ElevatedButton(
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

                          formKey.currentState?.reset();

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
                        primary: const Color.fromARGB(255, 18, 156, 57),
                        padding: const EdgeInsets.symmetric(horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
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
