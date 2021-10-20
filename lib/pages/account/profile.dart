import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String _name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Profile"),
      ),
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.all(20),
            child: Form(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        print("hello world");
                      },
                      child: Stack(
                        children: [
                          CircleAvatar(
                              backgroundImage:
                                  AssetImage("assets/images/user.jpg"),
                              radius: 60),
                          Positioned(
                              bottom: 8,
                              right: 8,
                              child: Container(
                                  height: 40,
                                  width: 40,
                                  child: Icon(
                                    Icons.camera_alt_outlined,
                                    color: Colors.white,
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: Colors.white, width: 3))))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    TextFormField(
                      // The validator receives the text that the user has entered.
                      decoration: const InputDecoration(
                          labelText: "Full Name",
                          prefixIcon: Icon(Icons.person)),
                      style: TextStyle(fontSize: 15),
                      validator: MultiValidator([
                        RequiredValidator(errorText: "User Name is Required"),
                        MinLengthValidator(3,
                            errorText: "User Name must be at least 4 character")
                      ]),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                          labelText: "Phone", prefixIcon: Icon(Icons.phone)),
                      style: TextStyle(fontSize: 15),
                      // validator: NrnPhoneValidator(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          labelText: "Email", prefixIcon: Icon(Icons.email)),
                      style: TextStyle(fontSize: 15),
                      // validator: NrnPhoneValidator(),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                          labelText: "Address",
                          prefixIcon: Icon(Icons.location_city)),
                      style: TextStyle(fontSize: 15),
                      // validator: NrnPhoneValidator(),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Bio",
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                          hintText: "Enter  About Yourself",
                          contentPadding: EdgeInsets.all(10)),
                      maxLines: 5,
                      style: TextStyle(fontSize: 15),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                        },
                        style: ButtonStyle(),
                        child: const Text('Update'),
                      ),
                    ),
                  ],
                ))),
      ),
    );
  }
}
