import 'package:flutter/material.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text("Battery Full"),
        subtitle: Text(
          "The battery is full.",
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: CircleAvatar(
            backgroundImage: NetworkImage(
                "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
        trailing: IconButton(
          color: Colors.blue,
          icon: Icon(Icons.edit),
          onPressed: () {},
        ));
  }
}
