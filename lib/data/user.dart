import 'dart:io';

import 'package:flutter/foundation.dart';

class User extends ChangeNotifier {
  File? _profileImage;
  String _imagePath = 'lib/assets/images/meme_guy.jpg';
  String _name = 'Jack Nicholas';
  String _phone = '(561) 348 - 2967';
  String _email = 'Jack@yahoo.com';
  String _about =
      'I love long walks on the beach. I love long walks on the beach. I love long walks on the beach. I love long walks on the beach. I love long walks on the beach.';

  File? get profileImage => _profileImage;
  String get imagePath => _imagePath;
  String get name => _name;
  String get phone => _phone;
  String get email => _email;
  String get about => _about;

  set profileImage(File? newImage) {
    _profileImage = newImage;
    notifyListeners();
  }

  set imagePath(String newImagePath) {
    _imagePath = newImagePath;
    notifyListeners();
  }

  set name(String newName) {
    _name = newName;
    notifyListeners();
  }

  set phone(String newPhone) {
    _phone = newPhone;
    notifyListeners();
  }

  set email(String newEmail) {
    _email = newEmail;
    notifyListeners();
  }

  set about(String newAbout) {
    _about = newAbout;
    notifyListeners();
  }
}
