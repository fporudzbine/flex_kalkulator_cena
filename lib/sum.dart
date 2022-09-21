import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'dart:math';

class Sum with ChangeNotifier, DiagnosticableTreeMixin {
  TextEditingController sumStandard = TextEditingController(text: "0");
  TextEditingController sumSpecial = TextEditingController(text: "0");


  void addStandard(double additionValueStandard) {
    var summ = double.parse(sumStandard.text.isEmpty ? sumStandard.text : sumStandard.text.length == 10 ? sumStandard.text.substring(0,3) : sumStandard.text.length == 11 ? sumStandard.text.substring(0,4) : sumStandard.text.length == 8 ? sumStandard.text.substring(0,1) : sumStandard.text.length == 12 ? sumStandard.text.substring(0,5) : sumStandard.text.length == 13 ? sumStandard.text.substring(0,6) : sumStandard.text.length > 13 ? sumStandard.text.substring(0,6) : sumStandard.text.length == 9 ? sumStandard.text.substring(0,2) : sumStandard.text);
    var s = summ + additionValueStandard;
    sumStandard.text = '${s.toStringAsFixed(2)} RSD';
    notifyListeners();
  }
  void addSpecial(double additionValueSpecial) {
    var summ = double.parse(sumSpecial.text.isEmpty ? sumSpecial.text : sumSpecial.text.length == 10 ? sumSpecial.text.substring(0,3) : sumSpecial.text.length == 11 ? sumSpecial.text.substring(0,4) : sumSpecial.text.length == 8 ? sumSpecial.text.substring(0,1) : sumSpecial.text.length == 12 ? sumSpecial.text.substring(0,5) : sumSpecial.text.length == 13 ? sumSpecial.text.substring(0,6) : sumSpecial.text.length > 13 ? sumSpecial.text.substring(0,6) : sumSpecial.text.length == 9 ? sumSpecial.text.substring(0,2) :  sumSpecial.text);
    var s = summ + additionValueSpecial;
    sumSpecial.text = '${s.toStringAsFixed(2)} RSD';
    notifyListeners();
  }

  void subtractStandard(double subtractionValueStandard){
    var summ = double.parse(sumStandard.text.length == 10 ? sumStandard.text.substring(0,3) : sumStandard.text.length == 11 ? sumStandard.text.substring(0,4) : sumStandard.text.length == 8 ? sumStandard.text.substring(0,1) : sumStandard.text.length == 12 ? sumStandard.text.substring(0,5) : sumStandard.text.length == 13 ? sumStandard.text.substring(0,6) : sumStandard.text.length > 13 ? sumStandard.text.substring(0,6) : sumStandard.text.length == 9 ? sumStandard.text.substring(0,2) : sumStandard.text);
    var s = summ - subtractionValueStandard;
    sumStandard.text = '${s.toStringAsFixed(2)} RSD';
    notifyListeners();
  }

  void subtractSpecial(double subtractionValueSpecial){
    var summ = double.parse(sumSpecial.text.isEmpty ? sumSpecial.text : sumSpecial.text.length == 10 ? sumSpecial.text.substring(0,3) : sumSpecial.text.length == 11 ? sumSpecial.text.substring(0,4) : sumSpecial.text.length == 8 ? sumSpecial.text.substring(0,1) : sumSpecial.text.length == 12 ? sumSpecial.text.substring(0,5) : sumSpecial.text.length == 13 ? sumSpecial.text.substring(0,6) : sumSpecial.text.length > 13 ? sumSpecial.text.substring(0,6) : sumSpecial.text.length == 9 ? sumSpecial.text.substring(0,2) :  sumSpecial.text);
    var s = summ - subtractionValueSpecial;
    sumSpecial.text = '${s.toStringAsFixed(2)} RSD';
    notifyListeners();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('count', 0));
  }
}