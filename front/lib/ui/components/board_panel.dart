// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import '../font_style.dart';

class BoardPanel extends StatefulWidget {
  BoardPanel(
      {Key? key,
      required this.panelContent,
      required this.width,
      required this.height,
      required this.panelColor,
      required this.padding})
      : super(key: key);

  Widget panelContent;
  double width;
  double height;
  double padding;
  Color panelColor;

  @override
  State<BoardPanel> createState() => _BoardPanelState();
}

class _BoardPanelState extends State<BoardPanel> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      width: widget.width,
      height: widget.height,
      padding: EdgeInsets.all(widget.padding),
      decoration: BoxDecoration(
        color: widget.panelColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: widget.panelContent,
    );
  }
}
