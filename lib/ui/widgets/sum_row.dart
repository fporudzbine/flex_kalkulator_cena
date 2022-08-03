import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../../labels.dart';
import '../../sum.dart';


class SumRow extends StatefulWidget {
  SumRow({required this.label, this.isStandard = true}) : super();

  final String label;
  final bool isStandard;

  @override
  State<SumRow> createState() => _SumRowState();
}

class _SumRowState extends State<SumRow> {

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 1000 ? Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
            height: 20,
            width: 177,
            child: Text(widget.label, style: TextStyle(fontSize: 16, color: Colors.black),)),
        SizedBox(width: 510),
        Container(
          color: Color(0xffB59F80),
          width: 230,
          height: 45,
          child: TextField(
            controller: widget.isStandard ?  context.watch<Sum>().sumStandard : context.watch<Sum>().sumSpecial,
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
            readOnly: true,
          ),
        ),
        SizedBox(height: 60),
      ],
    ) : Padding(
      padding: EdgeInsets.only(left: 90.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              height: 20,
              width: 177,
              child: Text(widget.label, style: TextStyle(fontSize: 16, color: Colors.black),),
          ),
          SizedBox(height: 20,),
          Container(
            color: Color(0xffB59F80),
            width: 230,
            height: 45,
            child: TextField(
              controller: widget.isStandard ?  context.watch<Sum>().sumStandard : context.watch<Sum>().sumSpecial,
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
              readOnly: true,
            ),
          ),
        ],
      ),
    );
  }
}
