import 'dart:convert';
import 'myApp.dart';
import 'package:chernyi_lab_3_1/word_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class StateProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _responseIsEmpty = false;
  bool get responseIsEmpty => _responseIsEmpty;

  Future<void> httpGet() async {
    _isLoading = true;
    notifyListeners();

    final response =
        await http.get(Uri.parse("http://api.urbandictionary.com/v0/random"));

    if (response.contentLength != null) {
      var decoded = jsonDecode(response.body);

      if (decoded["list"] == null || decoded["list"].isEmpty) {
        _responseIsEmpty = true;
        notifyListeners();
      } else {
        var rest = decoded["list"] as List;
        if (response.statusCode == 200) {
          Words(rest);
        } else {
          throw Exception('Failed to load album');
        }
      }
    } else {
      _responseIsEmpty = true;
      notifyListeners();
    }
  }

  void Words(rest) {
    words = rest.map<Word>((json) => Word.fromJson(json)).toList();
    notifyListeners();
  }
}
