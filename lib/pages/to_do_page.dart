import 'package:flutter/material.dart';
import 'package:synccards/widget/drawer.dart';
import 'package:synccards/utils/utilsFunctions.dart';
import 'package:synccards/widget/my_voluem_button.dart';

class ToDoPage extends StatefulWidget {
  @override
  _ToDoPageState createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  String? nameProject;

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
              Tab(icon: Icon(Icons.format_list_numbered_sharp),text: word(context).todo,),
              Tab(icon: Icon(Icons.done),text: word(context).done,),

            ],
          ),
        ),
        body: TabBarView(
          children: [
            ToDoList(),
            Center(child: Text("Transit", style: Theme.of(context).textTheme.headline2)),

          ],
        ),
      ),
    );
  }
}

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  _ToDoListState createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Container();
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
