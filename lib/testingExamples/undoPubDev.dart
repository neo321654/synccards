
import 'package:flutter/material.dart';
import 'package:undo/undo.dart';

class UndoExample extends StatefulWidget {
  @override
  _UndoExampleState createState() => _UndoExampleState();
}

class _UndoExampleState extends State<UndoExample> {
  late SimpleStack _controller;

  @override
  void initState() {
    _controller = SimpleStack<int>(
      8,
      onUpdate: (val) {
        //здесь mounted можно ли вызывать setstate , смонтирован ли виджет
        if (mounted)
          //тут главное вызвать setState для перерисовки дерева
          setState(() {
             print('New Value -> $val');
          });
      },
    );


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final count = _controller.state;
    return Scaffold(
      appBar: AppBar(
        title: Text('Undo/Redo Example'),
      ),
      body: Center(
        child: Text('Count: $count',style: Theme.of(context).textTheme.subtitle1,),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: !_controller.canUndo
                  ? null
                  : () {
                if (mounted)
                  setState(() {
                    _controller.undo();
                  });
              },
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: !_controller.canRedo
                  ? null
                  : () {
                if (mounted)
                  setState(() {
                    _controller.redo();
                  });
              },
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        heroTag: ValueKey('add_button'),
        child: Icon(Icons.add),
        onPressed: () {
          //вся логика перестроения совершается здесь , благодаря методам контролера
          _controller.modify(count + 1);
        },
      ),
    );
  }
}
