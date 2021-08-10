import 'package:flutter/material.dart';

class MyVolumeButton extends StatefulWidget {
  const MyVolumeButton({Key? key}) : super(key: key);

  @override
  _MyVolumeButtonState createState() => _MyVolumeButtonState();
}

class _MyVolumeButtonState extends State<MyVolumeButton> {
  bool volumeOn = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: this.volumeOn? Icon(Icons.volume_up):Icon(Icons.volume_mute),
        onPressed: () {
          // Set new State
          setState(() => this.volumeOn = !this.volumeOn);
        }
    );
  }
}
