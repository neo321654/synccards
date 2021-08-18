import 'package:flutter/material.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        MaterialButton(
          onPressed: () {},
          child: Text("load"),
          color: Colors.green,
        ),
        SizedBox(
          width: 8,
        ),
        MaterialButton(
          onPressed: () {},
          child: Text("Clear"),
          color: Colors.red,
        ),
      ],
    );
  }
}
