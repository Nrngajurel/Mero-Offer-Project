import 'package:flutter/material.dart';
import 'package:mero/pages/account/account.dart';


class AccountPage extends StatefulWidget {
  const AccountPage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Account"),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.settings))
        ],
      ),
      body: Account(),
    );
  }
}
