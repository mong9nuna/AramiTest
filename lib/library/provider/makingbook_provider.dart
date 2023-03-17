import 'package:flutter/material.dart';

class MakingBookProvider extends ChangeNotifier {
  List<Map<String, dynamic>> containers = [];
  String selectID = '';

  add(Map<String, dynamic> item) {
    containers.add(item);
    notifyListeners();
  }

  remove(String textID) {
    containers.removeWhere(
          (element) {
        return element['textID'] == textID;
      },
    );
    notifyListeners();
  }

  showCheck(String textID){

  }
}
