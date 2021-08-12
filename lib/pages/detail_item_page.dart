import 'package:flutter/material.dart';

class DetailItemPage extends StatefulWidget {
  const DetailItemPage({Key? key}) : super(key: key);

  @override
  _DetailItemPageState createState() => _DetailItemPageState();
}

class _DetailItemPageState extends State<DetailItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: IconButton(
                color: Colors.blue,
                icon: Icon(Icons.edit),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            Expanded(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("The battery is full.",
                      style: Theme.of(context).textTheme.bodyText1),
                  Text(
                      "The battery is full The battery is full.The battery is full.The battery is full.",
                      style: Theme.of(context).textTheme.headline6),
                ],
              ),
            ),
            Center(
              child: ReorderableDragStartListener(
                index: 3,
                child: IconButton(
                  color: Colors.blue,
                  icon: Icon(Icons.line_weight),
                  onPressed: () {},
                ),
              ),
            ),
          ]),
    );
  }
}
