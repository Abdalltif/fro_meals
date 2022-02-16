import 'package:flutter/material.dart';

Widget appDrawer(BuildContext context) {
  return Drawer(
    child: Container(
      color: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Padding(
              padding: EdgeInsets.all(32.0),
              child: Image(
                image: AssetImage('images/logo-white.png'),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle, color: Colors.black87,),
            title: const Text('Profile', style: TextStyle(color: Colors.black87),),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const ListTile(
            leading: Icon(Icons.message, color: Colors.black87,),
            title: Text('Vouchers', style: TextStyle(color: Colors.black87),),
          ),
          const ListTile(
            leading: Icon(Icons.account_circle, color: Colors.black87,),
            title: Text('Coupons', style: TextStyle(color: Colors.black87),),
          ),
          const ListTile(
            leading: Icon(Icons.settings, color: Colors.black87,),
            title: Text('Settings', style: TextStyle(color: Colors.black87),),
          ),
        ],
      ),
    ),
  );
}