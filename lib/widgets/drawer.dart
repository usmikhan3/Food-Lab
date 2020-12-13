import 'package:flutter/material.dart';
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

              DrawerItem(
                icon: Icons.person,
                name: "Profile",
              ),
              DrawerItem(
                icon: Icons.add_shopping_cart,
                name: "Cart",
              ),
              DrawerItem(
                icon:Icons.shopping_bag_rounded,
                name: "Order",
              ),
              DrawerItem(
                icon:Icons.info,
                name: "About",
              ),
              Divider(color: Colors.black,thickness: 1,),
              DrawerItem(
                icon:Icons.lock,
                name: "Change",
              ),
              DrawerItem(
                icon:Icons.exit_to_app,
                name: "Log out",
              ),

            ],
          ),
        ),
      ),
    );
  }
}
