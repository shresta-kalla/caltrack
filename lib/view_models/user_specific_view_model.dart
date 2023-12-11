import 'package:flutter/cupertino.dart';

import '../models/users.dart';

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
  final Map<String, Users> _userDatabase = initialData;
  Users? _currentUser = initialData.entries.first.value;
  bool _isLoggedIn = false;

  UserSpecific({Map<String, Users>? initialData}) {
    _userDatabase.addAll(initialData ?? {});
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
          print(_currentUser?.userName);
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
      String password,
      String age,
      String gender,
      String height,
      String weight,
      ) {

    final oldUser = _userDatabase[_currentUser?.userName];
    if (oldUser == null) {
      return false;
    }

    oldUser.firstName = firstName;
    oldUser.lastName = lastName;
    oldUser.userName = userName;
    oldUser.password = password;
    oldUser.age = age;
    oldUser.gender = gender;
    oldUser.height = height;
    oldUser.weight = weight;

    _userDatabase[userName] = oldUser;

    if (userName != currentUser?.userName) {
      _userDatabase.remove(currentUser?.userName);
    }

    _currentUser = oldUser;

    notifyListeners();



    return true;
  }

  bool get isLoggedIn => _isLoggedIn;

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  void setLoggedIn(bool value) {
    _isLoggedIn = value;
    notifyListeners();
  }

  Users? get currentUser => _currentUser;
  Map<String, Users> get userDatabase => _userDatabase;
}
