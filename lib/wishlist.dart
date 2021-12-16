import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WishList extends StatefulWidget {
  //static const routeName = '/Home';
  @override
  _WishlistState createState() => _WishlistState();
}
class _WishlistState extends State<WishList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(
          'Wish List',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,actions: [
        IconButton(
          icon: Icon(
            Icons.notification_add_rounded,
            color: Colors.white,
          ),
          onPressed: () {},
        ),
       ],
      ),
    );
  }
}