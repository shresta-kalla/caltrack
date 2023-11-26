import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:caltrack/view_models/user_specific_view_model.dart';
import 'package:provider/provider.dart';
import 'package:form_validator/form_validator.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  bool isHidden = true;
  bool isConfirmPasswordHidden = true;

  final _formKey = GlobalKey<FormState>();

  String firstNameInput = "";
  String lastNameInput = "";
  String userNameInput = "";
  String passwordInput = "";
  String confirmPasswordInput = "";
  String ageInput = "";
  String genderInput = "";
  String heightInput = "";
  String weightInput = "";

  var firstNameValidator =
  ValidationBuilder(requiredMessage: "First Name is required!").build();
  var lastNameValidator =
  ValidationBuilder(requiredMessage: "Last Name is required!").build();
  var userNameValidator =
  ValidationBuilder(requiredMessage: "UserName is required!").build();
  var passwordValidator =
  ValidationBuilder(requiredMessage: "Password is required!").build();
  var ageValidator =
  ValidationBuilder(requiredMessage: "Age is required!").build();
  var heightValidator =
  ValidationBuilder(requiredMessage: "Height is required!").build();
  var weightValidator =
  ValidationBuilder(requiredMessage: "Weight is required!").build();
  var genderValidator =
  ValidationBuilder(requiredMessage: "Gender is required!").build();
  var confirmPasswordValidator =
  ValidationBuilder(requiredMessage: "Confirm Password is required!")
      .build();

  List? isError;

  @override
  Widget build(BuildContext context) {
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
                  "Sign Up",
                  style: GoogleFonts.adamina(
                    fontWeight: FontWeight.bold,
                    fontSize: 40,
                  ),
                ),
                const SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField(
                        "First Name",
                        firstNameValidator,
                            (value) => setState(() => firstNameInput = value!),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        "Last Name",
                        lastNameValidator,
                            (value) => setState(() => lastNameInput = value!),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        "Username",
                        userNameValidator,
                            (value) => setState(() => userNameInput = value!),
                      ),
                      const SizedBox(height: 5),
                      _buildPasswordField(
                        "Password",
                        passwordValidator,
                            (value) => setState(() => passwordInput = value!),
                        isHidden,
                        _togglePasswordView,
                      ),
                      const SizedBox(height: 5),
                      _buildPasswordField(
                        "Confirm Password",
                        confirmPasswordValidator,
                            (value) =>
                            setState(() => confirmPasswordInput = value!),
                        isConfirmPasswordHidden,
                        _toggleConfirmPasswordView,
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        "Age",
                        ageValidator,
                            (value) => setState(() => ageInput = value!),
                      ),
                      const SizedBox(height: 5),
                      _buildTextField(
                        "Gender",
                        genderValidator,
                            (value) => setState(() => genderInput = value!),
                      ),
                      const SizedBox(height: 5),
                      _buildHeightWeightFields("Height", heightValidator, heightInput, "inches"),
                      const SizedBox(height: 5),
                      _buildHeightWeightFields("Weight", weightValidator, weightInput, "lbs"),
                      const SizedBox(height: 5),
                      _buildRegisterButton(),
                      const SizedBox(height: 8),
                      isError != null
                          ? Text(
                        isError![1],
                        style: const TextStyle(color: Colors.red),
                      )
                          : const SizedBox()
                    ],
                  ),
                ),
                const SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a member?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, "/login");
                      },
                      child: const Text(
                        " Login!",
                        style: TextStyle(
                          color: Color.fromARGB(255, 180, 140, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      String hintText,
      String? Function(String?)? validator,
      void Function(String?)? onSaved,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 4.0),
          child: TextFormField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14),
            ),
            validator: validator,
            onSaved: onSaved,
          ),
        ),
      ),
    );
  }


  Widget _buildPasswordField(
      String hintText,
      String? Function(String?)? validator,
      void Function(String?)? onSaved,
      bool isHidden,
      VoidCallback togglePasswordView,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: TextFormField(
            obscureText: isHidden,
            validator: validator,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14),
              suffixIcon: InkWell(
                onTap: togglePasswordView,
                child: Icon(
                  isHidden ? Icons.visibility : Icons.visibility_off,
                  color: Colors.grey,
                ),
              ),
            ),
            onSaved: onSaved,
          ),
        ),
      ),
    );
  }


  Widget _buildHeightWeightFields(
      String hintText,
      String? Function(String?)? validator,
      String value,
      String unit,
      ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 200,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border.all(color: Colors.white),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 4.0, bottom: 4.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: TextStyle(fontSize: 14),
                ),
                validator: validator,
                onSaved: (value) => setState(() => heightInput = value!),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          const SizedBox(width: 5),
          Text(
            unit,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildRegisterButton() {
    return InkWell(
      onTap: () {
        if (_formKey.currentState!.validate()) {
          _formKey.currentState?.save();

          var createAccount =
          context.read<UserSpecific>().signUp(
            firstNameInput,
            lastNameInput,
            userNameInput,
            passwordInput,
            confirmPasswordInput,
            ageInput,
            heightInput,
            weightInput,
            genderInput,
          );

          if (createAccount[0] == false) {
            setState((() => isError = createAccount));
          } else {
            setState((() => isError = null));
            GoRouter.of(context).go("/login");
          }
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 180, 140, 255),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Center(
            child: Text(
              "Register",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  void _toggleConfirmPasswordView() {
    setState(() {
      isConfirmPasswordHidden = !isConfirmPasswordHidden;
    });
  }
}
