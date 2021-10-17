import 'package:flutter/material.dart';
import 'package:mero/pages/loginscreen.dart';

class AddNewAdPage extends StatefulWidget {
  const AddNewAdPage({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  _AddNewAdPageState createState() => _AddNewAdPageState();
}

class _AddNewAdPageState extends State<AddNewAdPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Ad"),
        centerTitle: true,
      ),
    );
  }
}
