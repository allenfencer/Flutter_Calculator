import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class button extends StatelessWidget {

  final String text;
  final Color fillColor;
  final Color textColor;
  final double textSize;
  final Function callback;

  const button({
    this.text,
    this.fillColor,
    this.textColor,
    this.textSize,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: 70,
        height: 70,
        color: fillColor,
        child: TextButton(
          onPressed: () {
            callback(text);
            },
          child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: textSize,color: textColor),),
        ),
      ),
    );
  }
}
