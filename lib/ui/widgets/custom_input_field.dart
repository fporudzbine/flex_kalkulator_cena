
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../labels.dart';
import '../../sum.dart';
import 'package:provider/provider.dart';

class CustomInputField extends StatefulWidget {
  CustomInputField(
      {
        this.isForBuyOut = false,
        this.label = "",
        required this.controller,
        this.isChecked = false,
        this.startingValueStandardWeight = "",
        this.startingValueStandardDelivery = "",
        this.startingValueSpecialDelivery = "",
        this.startingValueSpecialType = "",
      }
      );

  final bool isForBuyOut;
  final String label;
  final bool isChecked;
  String startingValueStandardWeight;
  String startingValueStandardDelivery;
  String startingValueSpecialDelivery;
  String startingValueSpecialType;
  TextEditingController controller;

  @override
  State<CustomInputField> createState() => _CustomInputFieldState();
}

class _CustomInputFieldState extends State<CustomInputField> {


  @override
  Widget build(BuildContext context) {
    switch(widget.label){
      case kRSD:
        (widget.startingValueStandardWeight == "0kg - 0.5kg" && widget.startingValueStandardDelivery == 'Danas za danas') ? widget.controller.text = "600,00 RSD" :
        (widget.startingValueStandardWeight == "0.5kg - 1kg" && widget.startingValueStandardDelivery == 'Danas za danas') ? widget.controller.text = "620,00 RSD" :
        (widget.startingValueStandardWeight == "1kg - 2kg" && widget.startingValueStandardDelivery == 'Danas za danas') ? widget.controller.text = "640,00 RSD" :
        (widget.startingValueStandardWeight == "2kg - 5kg" && widget.startingValueStandardDelivery == 'Danas za danas') ? widget.controller.text = "780,00 RSD" :
        (widget.startingValueStandardWeight == "5kg - 10kg" && widget.startingValueStandardDelivery == 'Danas za danas') ? widget.controller.text = "900,00 RSD" :
        (widget.startingValueStandardWeight == "10kg - 15kg" && widget.startingValueStandardDelivery == 'Danas za danas') ? widget.controller.text = "930,00 RSD" :
        (widget.startingValueStandardWeight == "15kg - 20kg" && widget.startingValueStandardDelivery == 'Danas za danas') ? widget.controller.text = "950,00 RSD" :
        (widget.startingValueStandardWeight == "20kg - 30kg" && widget.startingValueStandardDelivery == 'Danas za danas') ? widget.controller.text = "1070,00 RSD" :
        (widget.startingValueStandardWeight == "30kg - 50kg" && widget.startingValueStandardDelivery == 'Danas za danas') ? widget.controller.text = "1220,00 RSD" :
        (widget.startingValueStandardWeight == "0kg - 0.5kg" && widget.startingValueStandardDelivery == 'Danas za sutra do 18h') ? widget.controller.text = "350,00 RSD" :
        (widget.startingValueStandardWeight == "0.5kg - 1kg" && widget.startingValueStandardDelivery == 'Danas za sutra do 18h') ? widget.controller.text = "410,00 RSD" :
        (widget.startingValueStandardWeight == "1kg - 2kg" && widget.startingValueStandardDelivery == 'Danas za sutra do 18h') ? widget.controller.text = "450,00 RSD" :
        (widget.startingValueStandardWeight == "2kg - 5kg" && widget.startingValueStandardDelivery == 'Danas za sutra do 18h') ? widget.controller.text = "580,00 RSD" :
        (widget.startingValueStandardWeight == "5kg - 10kg" && widget.startingValueStandardDelivery == 'Danas za sutra do 18h') ? widget.controller.text = "740,00 RSD" :
        (widget.startingValueStandardWeight == "10kg - 15kg" && widget.startingValueStandardDelivery == 'Danas za sutra do 18h') ? widget.controller.text = "970,00 RSD" :
        (widget.startingValueStandardWeight == "15kg - 20kg" && widget.startingValueStandardDelivery == 'Danas za sutra do 18h') ? widget.controller.text = "1020,00 RSD" :
        (widget.startingValueStandardWeight == "20kg - 30kg" && widget.startingValueStandardDelivery == 'Danas za sutra do 18h') ? widget.controller.text = "1210,00 RSD" :
        (widget.startingValueStandardWeight == "30kg - 50kg" && widget.startingValueStandardDelivery == 'Danas za sutra do 18h') ? widget.controller.text = "1560,00 RSD" :
        (widget.startingValueSpecialType == "Bicikl") ? widget.controller.text = "1660,00 RSD" :
        (widget.startingValueSpecialType == "Televizor do 55 incha") ? widget.controller.text = "870,00 RSD" :
        (widget.startingValueSpecialType == "Guma putnička") ? widget.controller.text = "400,00 RSD" :
        (widget.startingValueSpecialType == "Guma poluteretna") ? widget.controller.text = "770,00 RSD" :
        (widget.startingValueSpecialType == "Guma teretna") ? widget.controller.text = "1590,00 RSD" :
        (widget.startingValueSpecialType == "Guma putnička sa felnom") ? widget.controller.text = "510,00 RSD" :
        (widget.startingValueSpecialType == "Guma poluteretna sa felnom") ? widget.controller.text = "1040,00 RSD" :
        (widget.startingValueSpecialType == "Guma teretna sa felnom") ? widget.controller.text = "1820,00 RSD" :
        (widget.startingValueSpecialType == "Traktorska guma") ? widget.controller.text = "1340,00 RSD" :
        (widget.startingValueSpecialType == "Traktorska guma sa felnom") ? widget.controller.text = "1760,00 RSD" :
        (widget.startingValueSpecialType == "Menjač manji") ? widget.controller.text = "1550,00 RSD" :
        (widget.startingValueSpecialType == "Menjač automatski") ? widget.controller.text = "5040,00 RSD" :
        (widget.startingValueSpecialType == "Auto motor") ? widget.controller.text = "5070,00 RSD" :
        widget.controller.text = "0";
        break;
    }
    return Container(
        color: Color(0xFFE2C7A8),
        width: 230,
        height: 45,
        child: TextField(
          controller: widget.controller,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white),
          cursorColor: Colors.white,
          obscureText: false,
          decoration: InputDecoration(
            border: UnderlineInputBorder(borderSide: BorderSide.none),
            hintText: "0",
            hintStyle: TextStyle(color: Colors.white),
            contentPadding: EdgeInsets.only(left: 10),
            focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red),),
          ),
          readOnly: true,
        ),
    );
  }
}
