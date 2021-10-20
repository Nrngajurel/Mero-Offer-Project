import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mero/pages/account/profile.dart';
class Account extends StatelessWidget {
  const Account({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      child: ListView(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: 75,
                    height: 75,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(70),
                      color: Colors.black12,
                      border: Border.all(color: Colors.teal)
                    ),
                    child: Image.asset("assets/images/logo.png", width: 50, height: 50,),
                    
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Narayan Gajurel",  style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.w700,
                          fontSize: 20
                        ),),
                        SizedBox(height: 5,),
                        Text("Member Since : October 9, 2021")
                      ],
                    ),
                  )
                ],
              ),

            ),
            Divider( thickness: 10,),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("About Me"),
              onTap: (){
                Get.to(()=> Profile());
              },
            ),
            ListTile(
              leading: Icon(Icons.sell),
              title: Text("My Ads"),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text("Cart"),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text("Follower"),
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Emails"),
            ),
            ListTile(
              leading: Icon(Icons.request_page_outlined),
              title: Text("Orders"),
            ),

            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
            ),
          ],
      ),
    );
  }
}
