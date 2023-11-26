import 'package:flutter/material.dart';
import 'package:caltrack/models//users.dart';

final Map<String, Users> initialData = {
  "sarah02": Users(
    firstName: "Sarah",
    lastName: "John",
    userName: "sarah02",
    password: "securePassword1",
    age: "19",
    height: "67",
    weight: "120",
    gender: "Female",
  ),
  "billy1989": Users(
    firstName: "Billy",
    lastName: "Kole",
    userName: "billy1989",
    password: "securePassword2",
    age: "35",
    height: "69",
    weight: "175",
    gender: "Male",
  ),
  "alice_johnson": Users(
    firstName: "Alice",
    lastName: "Johnson",
    userName: "alice89",
    password: "securePassword3",
    age: "28",
    height: "65",
    weight: "140",
    gender: "Female",
  ),
  "ra_awesome": Users(
    firstName: "Robert",
    lastName: "Anderson",
    userName: "ra_awesome",
    password: "securePass4",
    age: "50",
    height: "70",
    weight: "200",
    gender: "Male",
  ),
};

class UserSpecific with ChangeNotifier {
  final Map<String, Users> _userDatabase = {};
  Users? _currentUser;

  UserSpecific({Map<String, Users>? initialData}) {
    print("Initializing UserSpecific with data: $initialData");
    _userDatabase.addAll(initialData ?? {});
    print("UserDatabase after initialization: $_userDatabase");
  }

  bool login(String userName, String password) {
    print("Entered Username: $userName");
    print("Entered Password: $password");

    if (_userDatabase.containsKey(userName)) {
      print("Usernames in _userDatabase: ${_userDatabase.keys}");

      final user = _userDatabase[userName];
      if (user != null) {
        print("Password for $userName in _userDatabase: ${user.password}");

        if (user.password == password) {
          _currentUser = user;
          notifyListeners();
          return true;
        }
      }
    }
    return false;
  }


  List signUp(
      String firstName,
      String lastName,
      String userName,
      String password,
      String confirmPassword,
      String age,
      String height,
      String weight,
      String gender) {
    if (_userDatabase.containsKey(userName)) {
      return [false, "Sorry, an account with this username already exists!"];
    }
    if (password != confirmPassword) {
      return [false, "Passwords do not match. Please try again."];
    }
    if (gender.toLowerCase() != "female" && gender.toLowerCase() != "male") {
      return [false, "Please input either Female or Male."];
    }

    _userDatabase[userName] = Users(
      firstName: firstName,
      lastName: lastName,
      userName: userName,
      password: password,
      age: age,
      height: height,
      weight: weight,
      gender: gender,
    );

    notifyListeners();
    return [true];
  }

  bool editProfile(
      String firstName,
      String lastName,
      String userName,
      String age,
      String password,
      String height,
      String weight,
      String gender,
      ) {
    final oldUser = _userDatabase[currentUser?.userName];
    if (oldUser == null) {
      return false; // Handle the case where the current user is not found
    }

    oldUser.firstName = firstName;
    oldUser.lastName = lastName;
    oldUser.userName = userName;
    oldUser.password = password;
    oldUser.age = age;
    oldUser.height = height;
    oldUser.weight = weight;
    oldUser.gender = gender;

    _userDatabase[userName] = oldUser;

    if (userName != currentUser?.userName) {
      _userDatabase.remove(currentUser?.userName);
    }

    currentUser?.firstName = firstName;
    currentUser?.lastName = lastName;
    currentUser?.userName = userName;
    currentUser?.password = password;
    currentUser?.age = age;
    currentUser?.height = height;
    currentUser?.weight = weight;
    currentUser?.gender = gender;

    notifyListeners();

    return true;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  Users? get currentUser => _currentUser;
  Map<String, Users> get userDatabase => _userDatabase;
}