import 'package:flutter/material.dart';
import 'package:mero/pages/accountpage.dart';
import 'package:mero/pages/addnewad.dart';
import 'package:mero/pages/homepage.dart';
import 'package:mero/pages/loginscreen.dart';
import 'package:mero/pages/message.dart';
import 'package:mero/pages/searchpage.dart';

class LayoutOne extends StatefulWidget {
  const LayoutOne({Key? key}) : super(key: key);

  @override
  _LayoutOneState createState() => _LayoutOneState();
}

class _LayoutOneState extends State<LayoutOne> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      if (index > 1) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => LoginScren()));
      } else {
        _selectedIndex = index;
      }
    });
  }

  List<Widget> widgetoption = <Widget>[
    MyHomePage(name: "home"),
    SearchPage(name: "search"),
    AddNewAdPage(
      name: 'Add New Ad',
    ),
    MessagePage(
      name: "Message",
    ),
    AccountPage(
      name: "Account",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(),
        body: widgetoption[_selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20), topLeft: Radius.circular(20)),
            boxShadow: [
              BoxShadow(color: Colors.black38, spreadRadius: 0, blurRadius: 5),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            child: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.search,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                  ),
                  label: 'Add Ad',
                  // backgroundColor: Colors.yellow,
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.message,
                  ),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                  ),
                  label: 'Account',
                ),
              ],
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.black45,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: _onItemTapped,
            ),
          ),
        ));
  }
}
