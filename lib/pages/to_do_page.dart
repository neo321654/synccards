import 'package:flutter/material.dart';
import 'package:synccards/widget/drawer.dart';
import 'package:synccards/utils/utilsFunctions.dart';
import 'package:synccards/widget/list_item.dart';
import 'package:synccards/widget/my_voluem_button.dart';

import 'detail_item_page.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> with TickerProviderStateMixin {
  String? nameProject;
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 2),
    vsync: this,
  )..repeat(
      reverse: true,
    );
  late final Animation<double> _animation = CurvedAnimation(
    parent: _controller,
    curve: Curves.elasticOut,
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(word(context).helloWorld);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          drawer: AppDrawer(),
          appBar: AppBar(
            title: Column(
              children: [
                Text(
                  word(context).targetProgect,
                  style: Theme.of(context).textTheme.caption,
                ),
                Text(
                  nameProject ?? word(context).nameProgect,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ],
            ),
            centerTitle: true,
            actions: [MyVolumeButton()],
            bottom: TabBar(
              tabs: [
                Tab(
                  icon: Icon(Icons.format_list_numbered_sharp),
                  text: word(context).todo,
                ),
                Tab(
                  icon: Icon(Icons.done),
                  text: word(context).done,
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              ToDoList(),
              // SlidableExample(title: "TitleExample"),
             Text("dfdf",style:TextStyle(color:Colors.black)),
            ],
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(

            //backgroundColor: _fabColor,
            onPressed: () {},
            child: RotationTransition(
              turns: _animation,
              child: Icon(Icons.add),
            ),
          )),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<String> items = List<String>.generate(7, (i) => "Item $i");

  void reorderData(int oldindex, int newindex) {
    setState(() {
      if (newindex > oldindex) {
        newindex -= 1;
      }
      final item = items.removeAt(oldindex);
      items.insert(newindex, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ReorderableListView(
        buildDefaultDragHandles: false,
        onReorder: reorderData,
        children: [
          //   for (final item in items)
          for (int index = 0; index < items.length; index++)
            Dismissible(
              key: Key(items[index]),

              // child: ListItem(index: index,),
              child: SizedBox(
                child: Card(
                  elevation:3,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Center(
                          child: Hero(
                            tag: "iconHero",
                            child: IconButton(
                              color: Colors.blue,
                              icon: Icon(Icons.edit),
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) {
                                  return const DetailItemPage();
                                }));
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text("The battery is full.",
                                  style:
                                      Theme.of(context).textTheme.bodyText1),
                              Text(
                                  "The battery is full The battery is full.The battery is full.The battery is full.",
                                  style:
                                      Theme.of(context).textTheme.headline6),
                            ],
                          ),
                        ),
                        Center(
                          child: ReorderableDragStartListener(
                            index: index,
                            child: IconButton(
                              color: Colors.blue,
                              icon: Icon(Icons.line_weight),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ]),
                ),
              ),

              direction: DismissDirection.startToEnd,
              onDismissed: (direction) {
                // Remove the item from the data source.

                print(direction);
                if (direction == DismissDirection.endToStart) {
                  setState(() {
                    // items.removeAt(index);
                  });

                  // Then show a snackbar.
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('$index dismissed')));
                }
              },
              background: Container(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("${word(context).done.toUpperCase()} !!!" ,style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,)),
                  ),
                  color: Colors.green),
            )
        ]);
  }
}

// class ContactList extends StatefulWidget{
//   ContactList({ Key? key }) : super(key: key);
//
//   @override
//   _ContactListState createState() => _ContactListState();
// }
//
//
// class _ContactListState extends State<ContactList> implements ContactListViewContract {
//
//   late ContactListPresenter  _presenter;
//
//   late List<Contact> _contacts;
//
//   late bool _isSearching;
//
//   _ContactListState() {
//     _presenter =  ContactListPresenter(this);
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _isSearching = true;
//     _presenter.loadContacts();
//   }
//
//
//   @override
//   void onLoadContactsComplete(List<Contact> items) {
//
//     setState(() {
//       _contacts = items;
//       _isSearching = false;
//     });
//
//   }
//
//   @override
//   void onLoadContactsError() {
//     // TODO: implement onLoadContactsError
//   }
//
//   @override
//   Widget build(BuildContext context) {
//
//     var widget;
//
//     if(_isSearching) {
//       widget = Center(
//         child: Padding(
//           padding: EdgeInsets.only(left: 16.0, right: 16.0),
//           child: CircularProgressIndicator()
//         )
//       );
//     }else {
//       widget = ListView(
//             padding: EdgeInsets.symmetric(vertical: 8.0),
//             children: _buildContactList()
//           );
//     }
//
//     return widget;
//   }
//
//   List<_ContactListItem> _buildContactList() {
//     return _contacts.map((contact) =>
//                           new _ContactListItem (
//                             contact: contact,
//                             onTap: () { _showContactPage(context, contact); }
//                           ))
//                     .toList();
//   }
//
//   void _showContactPage(BuildContext context, Contact contact) {
//     Navigator.push(context, new MaterialPageRoute<Null>(
//       settings: const RouteSettings(name: ContactPage.routeName),
//       builder: (BuildContext context) => new ContactPage(contact)
//     ));
//   }
//
// }
//
//
// ///
// ///   Contact List Item
// ///
//
// class _ContactListItem extends ListTile {
//
//   _ContactListItem({ required Contact contact,
//                      required GestureTapCallback onTap}) :
//     super(
//       title : Text(contact.fullName ?? "--"),
//       subtitle: Text(contact.email ?? "--"),
//       leading: CircleAvatar(
//         child: Text(contact.fullName![0])
//       ),
//       onTap: onTap
//     );
//
// }
