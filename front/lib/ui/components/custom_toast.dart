import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CustomToast extends StatefulWidget {
  const CustomToast({Key? key}) : super(key: key);

  @override
  State<CustomToast> createState() => _CustomToastState();
}

class _CustomToastState extends State<CustomToast> {
  final toast = FToast();

  @override
  void initState() {
    super.initState();
    toast.init(context);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(32),
        child: buildToast(),
      ),
    );
  }

  Widget buildToast() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.greenAccent,
        borderRadius: BorderRadius.circular(25),
      ),
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          
          Icon(
            Icons.check,
            color: Colors.white,
          ),
          
          SizedBox(width: 12),
          Text(
            'jjjjjjjjjjjj',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
