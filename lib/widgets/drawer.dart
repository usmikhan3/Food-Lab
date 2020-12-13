import 'package:flutter/material.dart';
import 'package:food_shop/screens/cart.dart';
import 'package:food_shop/widgets/drawer_item.dart';

class MyDrawer extends StatelessWidget {

  final String accountName;
  final String accountEmail;
  final String accountImage;

  const MyDrawer({@required this.accountName,@required this.accountEmail,@required this.accountImage});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Color(0xFF0ffcdd2),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Colors.deepOrange
                  ),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage(accountImage),
                  ),
                  accountName: Text(accountName),
                  accountEmail: Text(accountEmail)),

            ListTile(
             leading: Icon(Icons.person),
               title: Text("Profile"),
              onTap: (){},
            ),

              ListTile(
                leading: Icon(Icons.add_shopping_cart),
                title: Text("Cart"),
                onTap: (){
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CartScreen()));
                },
              ),

              ListTile(
                leading: Icon(Icons.shopping_bag_rounded),
                title: Text("Order"),
                onTap: (){
                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CartScreen()));
                },
              ),

              ListTile(
                leading: Icon(Icons.info),
                title: Text("About"),
                onTap: (){
                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CartScreen()));
                },
              ),
              Divider(color: Colors.black,thickness: 1,),

              ListTile(
                leading: Icon(Icons.lock),
                title: Text("Change"),
                onTap: (){
                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CartScreen()));
                },
              ),
              ListTile(
                leading: Icon(Icons.exit_to_app),
                title: Text("Log out"),
                onTap: (){
                 // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_)=>CartScreen()));
                },
              ),






            ],
          ),
        ),
      ),
    );
  }
}
