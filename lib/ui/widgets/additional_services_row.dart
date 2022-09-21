import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../labels.dart';
import '../../sum.dart';

class AdditionalServicesRow extends StatefulWidget {
  AdditionalServicesRow(
      {required this.label,
      this.isForBuyOut = false,
      required this.controller,
      required this.isStandard});

  final String label;
  final bool isForBuyOut;
  final bool isStandard;
  TextEditingController controller;

  @override
  State<AdditionalServicesRow> createState() => _AdditionalServicesRowState();
}

class _AdditionalServicesRowState extends State<AdditionalServicesRow> {
  bool isChecked = false;
  String cutRSD = '';
  double prevValue = 0;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 1000 ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 20,
          width: 177,
          child: Text(
            widget.label,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
        SizedBox(width: 460),
        Row(
          children: [
           (widget.label != kBuyOut && widget.label != kSendValue) ? Checkbox(
                value: widget.label == kSMSReports ? false : isChecked,
                onChanged: widget.label == kSMSReports
                    ? null
                    : (newValue) {
                        setState(() {
                          isChecked = newValue!;
                          switch (widget.label) {
                            case kReturnReceipt:
                              isChecked
                                  ? widget.controller.text = "120.00 RSD"
                                  : widget.controller.text = "0";
                              isChecked
                                  ? cutRSD =
                                      widget.controller.text.substring(0, 3)
                                  : widget.controller.text;
                              break;
                            case kBackDocumentation:
                              isChecked
                                  ? widget.controller.text = "120.00 RSD"
                                  : widget.controller.text = "0";
                              isChecked
                                  ? cutRSD =
                                      widget.controller.text.substring(0, 3)
                                  : widget.controller.text;
                              break;
                            case kPaidResponse:
                              isChecked
                                  ? widget.controller.text = "200.00 RSD"
                                  : widget.controller.text = "0";
                              isChecked
                                  ? cutRSD =
                                      widget.controller.text.substring(0, 3)
                                  : widget.controller.text;
                              break;
                            case kSMSReports:
                              isChecked
                                  ? widget.controller.text = "15.00 RSD"
                                  : widget.controller.text = "0";
                              isChecked
                                  ? cutRSD =
                                      widget.controller.text.substring(0, 2)
                                  : widget.controller.text;
                              break;
                            case kPersonalDelivery:
                              isChecked
                                  ? widget.controller.text = "120.00 RSD"
                                  : widget.controller.text = "0";
                              isChecked
                                  ? cutRSD =
                                      widget.controller.text.substring(0, 3)
                                  : widget.controller.text;
                              break;
                              // case kBuyOut:
                              //    cutRSD = widget.controller.text.substring(0, 1);
                              //  break;
                              // case kSendValue:
                              //    cutRSD = widget.controller.text.substring(0, 1);
                              // break;
                          }
                        });
                        int value = int.parse(cutRSD);
                        if (widget.isStandard) {
                          isChecked
                              ? context.read<Sum>().addStandard(value.toDouble())
                              : context.read<Sum>().subtractStandard(value.toDouble());
                        } else {
                          isChecked
                              ? context.read<Sum>().addSpecial(value.toDouble())
                              : context.read<Sum>().subtractSpecial(value.toDouble());
                        }
                      }) : Container(
             width: 47,
           ),
            if(widget.label != kBuyOut && widget.label != kSendValue) Text(" = "),
            Container(
              color: Color(0xffB59F80),
              width: 230,
              height: 45,
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    prevValue = double.parse(cutRSD);
                  } else {
                    switch (widget.label) {
                      case kBuyOut:
                        cutRSD = widget.controller.text;
                        break;
                      case kSendValue:
                        cutRSD = widget.controller.text;
                        break;
                    }
                    int value = int.parse(cutRSD);
                    double currValue = widget.label == kBuyOut ? (value*0.012 <= 120 ? 120 : value*0.012) : widget.label == kSendValue ? (value*0.011 <= 90 ? 90 : value*0.011) : 0;
                    if (widget.isStandard && widget.label == kBuyOut){
                      (currValue != 120 && prevValue == 0) ? context.read<Sum>().addStandard(currValue- prevValue*0.012) : (currValue == 120 && prevValue == 0) ? context.read<Sum>().addStandard(currValue- prevValue*0.012) : (currValue != 120 && prevValue < 12000) ? context.read<Sum>().addStandard(currValue- 120) : (currValue == 120 && prevValue < 12000) ? context.read<Sum>().addStandard(currValue- 120) : (currValue != 120 && prevValue >=12000) ? context.read<Sum>().addStandard(currValue- prevValue*0.012) : (currValue == 120 && prevValue >=12000) ? context.read<Sum>().addStandard(currValue - prevValue*0.012) : context.read<Sum>().addStandard(0);
                    } else if(widget.isStandard && widget.label == kSendValue){
                      (currValue != 90 && prevValue == 0) ? context.read<Sum>().addStandard(currValue- prevValue*0.011) : (currValue == 90 && prevValue == 0) ? context.read<Sum>().addStandard(currValue- prevValue*0.011) : (currValue != 90 && prevValue < 9000) ? context.read<Sum>().addStandard(currValue- 90) : (currValue == 90 && prevValue < 9000) ? context.read<Sum>().addStandard(currValue- 90) : (currValue != 90 && prevValue >=9000) ? context.read<Sum>().addStandard(currValue- prevValue*0.011) : (currValue == 120 && prevValue >=9000) ? context.read<Sum>().addStandard(currValue - prevValue*0.011) : context.read<Sum>().addStandard(0);
                    }else if(!widget.isStandard && widget.label == kBuyOut){
                      (currValue != 120 && prevValue == 0) ? context.read<Sum>().addSpecial(currValue- prevValue*0.012) : (currValue == 120 && prevValue == 0) ? context.read<Sum>().addSpecial(currValue- prevValue*0.012) : (currValue != 120 && prevValue < 12000) ? context.read<Sum>().addSpecial(currValue- 120) : (currValue == 120 && prevValue < 12000) ? context.read<Sum>().addSpecial(currValue- 120) : (currValue != 120 && prevValue >=12000) ? context.read<Sum>().addSpecial(currValue- prevValue*0.012) : (currValue == 120 && prevValue >=12000) ? context.read<Sum>().addSpecial(currValue - prevValue*0.012) : context.read<Sum>().addSpecial(0);
                    } else if(!widget.isStandard && widget.label == kSendValue){
                      (currValue != 90 && prevValue == 0) ? context.read<Sum>().addSpecial(currValue- prevValue*0.011) : (currValue == 90 && prevValue == 0) ? context.read<Sum>().addSpecial(currValue- prevValue*0.011) : (currValue != 120 && prevValue < 9000) ? context.read<Sum>().addSpecial(currValue- 90) : (currValue == 90 && prevValue < 9000) ? context.read<Sum>().addSpecial(currValue- 90) : (currValue != 90 && prevValue >=9000) ? context.read<Sum>().addSpecial(currValue- prevValue*0.011) : (currValue == 90 && prevValue >=9000) ? context.read<Sum>().addSpecial(currValue - prevValue*0.011) : context.read<Sum>().addSpecial(0);
                    }
                    setState(() {
                      widget.controller.text = "${currValue.toStringAsFixed(2)} RSD";
                    });
                  }
                },
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
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                    ),
                  ),
                  readOnly: widget.isForBuyOut ? false : true,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 60),
      ],
    ) : Padding(
      padding: EdgeInsets.only(left: 50.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 20,
            width: 177,
            child: Text(
              widget.label,
              style: TextStyle(fontSize: 16, color: Colors.black),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Row(
              children: [
                (widget.label != kBuyOut && widget.label != kSendValue) ? Checkbox(
                    value: widget.label == kSMSReports ? false : isChecked,
                    onChanged: widget.label == kSMSReports
                        ? null
                        : (newValue) {
                      setState(() {
                        isChecked = newValue!;
                        switch (widget.label) {
                          case kReturnReceipt:
                            isChecked
                                ? widget.controller.text = "120.00 RSD"
                                : widget.controller.text = "0";
                            isChecked
                                ? cutRSD =
                                widget.controller.text.substring(0, 3)
                                : widget.controller.text;
                            break;
                          case kBackDocumentation:
                            isChecked
                                ? widget.controller.text = "120.00 RSD"
                                : widget.controller.text = "0";
                            isChecked
                                ? cutRSD =
                                widget.controller.text.substring(0, 3)
                                : widget.controller.text;
                            break;
                          case kPaidResponse:
                            isChecked
                                ? widget.controller.text = "200.00 RSD"
                                : widget.controller.text = "0";
                            isChecked
                                ? cutRSD =
                                widget.controller.text.substring(0, 3)
                                : widget.controller.text;
                            break;
                          case kSMSReports:
                            isChecked
                                ? widget.controller.text = "15.00 RSD"
                                : widget.controller.text = "0";
                            isChecked
                                ? cutRSD =
                                widget.controller.text.substring(0, 2)
                                : widget.controller.text;
                            break;
                          case kPersonalDelivery:
                            isChecked
                                ? widget.controller.text = "120.00 RSD"
                                : widget.controller.text = "0";
                            isChecked
                                ? cutRSD =
                                widget.controller.text.substring(0, 3)
                                : widget.controller.text;
                            break;
                          // case kBuyOut:
                          //   if(isChecked){
                          //     cutRSD = widget.controller.text;
                          //   }
                          //   break;
                          // case kSendValue:
                          //   if(isChecked){
                          //     cutRSD = widget.controller.text;
                          //   }
                          //   break;
                        }
                      });
                      int value = int.parse(cutRSD);
                      if (widget.isStandard) {
                        isChecked
                            ? context.read<Sum>().addStandard(value.toDouble())
                            : context.read<Sum>().subtractStandard(value.toDouble());
                      } else {
                        isChecked
                            ? context.read<Sum>().addSpecial(value.toDouble())
                            : context.read<Sum>().subtractSpecial(value.toDouble());
                      }
                    }) : Container(
              width: 47,
            ),
                if(widget.label != kBuyOut && widget.label != kSendValue) Text(" = "),
                Container(
                  color: Color(0xffB59F80),
                  width: 230,
                  height: 45,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      if (hasFocus) {
                        prevValue = double.parse(cutRSD);
                      } else {
                        switch (widget.label) {
                          case kBuyOut:
                            cutRSD = widget.controller.text;
                            break;
                          case kSendValue:
                            cutRSD = widget.controller.text;
                            break;
                        }
                        int value = int.parse(cutRSD);
                        double currValue = widget.label == kBuyOut ? (value*0.012 <= 120 ? 120 : value*0.012) : widget.label == kSendValue ? (value*0.011 <= 90 ? 90 : value*0.011) : 0;
                        if (widget.isStandard && widget.label == kBuyOut){
                          (currValue != 120 && prevValue == 0) ? context.read<Sum>().addStandard(currValue- prevValue*0.012) : (currValue == 120 && prevValue == 0) ? context.read<Sum>().addStandard(currValue- prevValue*0.012) : (currValue != 120 && prevValue < 12000) ? context.read<Sum>().addStandard(currValue- 120) : (currValue == 120 && prevValue < 12000) ? context.read<Sum>().addStandard(currValue- 120) : (currValue != 120 && prevValue >=12000) ? context.read<Sum>().addStandard(currValue- prevValue*0.012) : (currValue == 120 && prevValue >=12000) ? context.read<Sum>().addStandard(currValue - prevValue*0.012) : context.read<Sum>().addStandard(0);
                        } else if(widget.isStandard && widget.label == kSendValue){
                          (currValue != 90 && prevValue == 0) ? context.read<Sum>().addStandard(currValue- prevValue*0.011) : (currValue == 90 && prevValue == 0) ? context.read<Sum>().addStandard(currValue- prevValue*0.011) : (currValue != 90 && prevValue < 9000) ? context.read<Sum>().addStandard(currValue- 90) : (currValue == 90 && prevValue < 9000) ? context.read<Sum>().addStandard(currValue- 90) : (currValue != 90 && prevValue >=9000) ? context.read<Sum>().addStandard(currValue- prevValue*0.011) : (currValue == 120 && prevValue >=9000) ? context.read<Sum>().addStandard(currValue - prevValue*0.011) : context.read<Sum>().addStandard(0);
                        }else if(!widget.isStandard && widget.label == kBuyOut){
                          (currValue != 120 && prevValue == 0) ? context.read<Sum>().addSpecial(currValue- prevValue*0.012) : (currValue == 120 && prevValue == 0) ? context.read<Sum>().addSpecial(currValue- prevValue*0.012) : (currValue != 120 && prevValue < 12000) ? context.read<Sum>().addSpecial(currValue- 120) : (currValue == 120 && prevValue < 12000) ? context.read<Sum>().addSpecial(currValue- 120) : (currValue != 120 && prevValue >=12000) ? context.read<Sum>().addSpecial(currValue- prevValue*0.012) : (currValue == 120 && prevValue >=12000) ? context.read<Sum>().addSpecial(currValue - prevValue*0.012) : context.read<Sum>().addSpecial(0);
                        } else if(!widget.isStandard && widget.label == kSendValue){
                          (currValue != 90 && prevValue == 0) ? context.read<Sum>().addSpecial(currValue- prevValue*0.011) : (currValue == 90 && prevValue == 0) ? context.read<Sum>().addSpecial(currValue- prevValue*0.011) : (currValue != 120 && prevValue < 9000) ? context.read<Sum>().addSpecial(currValue- 90) : (currValue == 90 && prevValue < 9000) ? context.read<Sum>().addSpecial(currValue- 90) : (currValue != 90 && prevValue >=9000) ? context.read<Sum>().addSpecial(currValue- prevValue*0.011) : (currValue == 90 && prevValue >=9000) ? context.read<Sum>().addSpecial(currValue - prevValue*0.011) : context.read<Sum>().addSpecial(0);
                        }
                        setState(() {
                          widget.controller.text = "${currValue.toStringAsFixed(2)} RSD";
                        });
                      }
                    },
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
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                        ),
                      ),
                      readOnly: widget.isForBuyOut ? false : true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
