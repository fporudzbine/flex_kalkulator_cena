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
  int prevValue = 0;

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
            Checkbox(
                value: widget.label == kSMSReports ? false : isChecked,
                onChanged: widget.label == kSMSReports
                    ? null
                    : (newValue) {
                        setState(() {
                          isChecked = newValue!;
                          switch (widget.label) {
                            case kReturnReceipt:
                              isChecked
                                  ? widget.controller.text = "120,00 RSD"
                                  : widget.controller.text = "0";
                              isChecked
                                  ? cutRSD =
                                      widget.controller.text.substring(0, 3)
                                  : widget.controller.text;
                              break;
                            case kBackDocumentation:
                              isChecked
                                  ? widget.controller.text = "120,00 RSD"
                                  : widget.controller.text = "0";
                              isChecked
                                  ? cutRSD =
                                      widget.controller.text.substring(0, 3)
                                  : widget.controller.text;
                              break;
                            case kPaidResponse:
                              isChecked
                                  ? widget.controller.text = "200,00 RSD"
                                  : widget.controller.text = "0";
                              isChecked
                                  ? cutRSD =
                                      widget.controller.text.substring(0, 3)
                                  : widget.controller.text;
                              break;
                            case kSMSReports:
                              isChecked
                                  ? widget.controller.text = "15,00 RSD"
                                  : widget.controller.text = "0";
                              isChecked
                                  ? cutRSD =
                                      widget.controller.text.substring(0, 2)
                                  : widget.controller.text;
                              break;
                            case kPersonalDelivery:
                              isChecked
                                  ? widget.controller.text = "120,00 RSD"
                                  : widget.controller.text = "0";
                              isChecked
                                  ? cutRSD =
                                      widget.controller.text.substring(0, 3)
                                  : widget.controller.text;
                              break;
                            case kBuyOut:
                              if(isChecked){
                                cutRSD = widget.controller.text;
                              }
                              break;
                            case kSendValue:
                              if(isChecked){
                                cutRSD = widget.controller.text;
                              }
                              break;
                          }
                        });
                        int value = int.parse(cutRSD);
                        if (widget.isStandard) {
                          isChecked
                              ? context.read<Sum>().addStandard(value)
                              : context.read<Sum>().subtractStandard(value);
                        } else {
                          isChecked
                              ? context.read<Sum>().addSpecial(value)
                              : context.read<Sum>().subtractSpecial(value);
                        }
                      }),
            Text(" = "),
            Container(
              color: Color(0xffB59F80),
              width: 230,
              height: 45,
              child: Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    prevValue = int.parse(cutRSD);
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
                    if (widget.isStandard) {
                      context.read<Sum>().addStandard(value - prevValue);
                    } else {
                      context.read<Sum>().addSpecial(value - prevValue);
                    }
                    setState(() {
                      widget.controller.text = widget.controller.text + ",00 RSD";
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
                  readOnly: (isChecked == true && widget.isForBuyOut == true) ? false : true,
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
                Checkbox(
                    value: widget.label == kSMSReports ? false : isChecked,
                    onChanged: widget.label == kSMSReports
                        ? null
                        : (newValue) {
                      setState(() {
                        isChecked = newValue!;
                        switch (widget.label) {
                          case kReturnReceipt:
                            isChecked
                                ? widget.controller.text = "120,00 RSD"
                                : widget.controller.text = "0";
                            isChecked
                                ? cutRSD =
                                widget.controller.text.substring(0, 3)
                                : widget.controller.text;
                            break;
                          case kBackDocumentation:
                            isChecked
                                ? widget.controller.text = "120,00 RSD"
                                : widget.controller.text = "0";
                            isChecked
                                ? cutRSD =
                                widget.controller.text.substring(0, 3)
                                : widget.controller.text;
                            break;
                          case kPaidResponse:
                            isChecked
                                ? widget.controller.text = "200,00 RSD"
                                : widget.controller.text = "0";
                            isChecked
                                ? cutRSD =
                                widget.controller.text.substring(0, 3)
                                : widget.controller.text;
                            break;
                          case kSMSReports:
                            isChecked
                                ? widget.controller.text = "15,00 RSD"
                                : widget.controller.text = "0";
                            isChecked
                                ? cutRSD =
                                widget.controller.text.substring(0, 2)
                                : widget.controller.text;
                            break;
                          case kPersonalDelivery:
                            isChecked
                                ? widget.controller.text = "120,00 RSD"
                                : widget.controller.text = "0";
                            isChecked
                                ? cutRSD =
                                widget.controller.text.substring(0, 3)
                                : widget.controller.text;
                            break;
                          case kBuyOut:
                            if(isChecked){
                              cutRSD = widget.controller.text;
                            }
                            break;
                          case kSendValue:
                            if(isChecked){
                              cutRSD = widget.controller.text;
                            }
                            break;
                        }
                      });
                      int value = int.parse(cutRSD);
                      if (widget.isStandard) {
                        isChecked
                            ? context.read<Sum>().addStandard(value)
                            : context.read<Sum>().subtractStandard(value);
                      } else {
                        isChecked
                            ? context.read<Sum>().addSpecial(value)
                            : context.read<Sum>().subtractSpecial(value);
                      }
                    }),
                Text(" = "),
                Container(
                  color: Color(0xffB59F80),
                  width: 230,
                  height: 45,
                  child: Focus(
                    onFocusChange: (hasFocus) {
                      if (hasFocus) {
                        prevValue = int.parse(cutRSD);
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
                        if (widget.isStandard) {
                          context.read<Sum>().addStandard(value - prevValue);
                        } else {
                          context.read<Sum>().addSpecial(value - prevValue);
                        }
                        setState(() {
                          widget.controller.text = widget.controller.text + ",00 RSD";
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
                      readOnly: (isChecked == true && widget.isForBuyOut == true) ? false : true,
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
