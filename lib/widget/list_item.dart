import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final int index;

  ListItem({
    required this.index,
    Key? key,
  }) : super(key: key);

  @override
  _ListItemState createState() => _ListItemState(index);
}

class _ListItemState extends State<ListItem> {
  int index;

  _ListItemState(this.index);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(children: [
        IconButton(
          color: Colors.blue,
          icon: Icon(Icons.edit),
          onPressed: () {},
        ),
        Text("Battery Full"),
        Text("The battery is full.",
            style: Theme.of(context).textTheme.headline6),
        ReorderableDragStartListener(
          index: index,
          child: IconButton(
            color: Colors.blue,
            icon: Icon(Icons.format_list_bulleted_sharp),
            onPressed: () {},
          ),
        ),
      ]),
    );
  }
}
