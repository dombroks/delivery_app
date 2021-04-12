import 'package:delivery/view/sideDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   
    bool isActivated = false;
    return Scaffold(
      drawer: SideDrawer(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu),
            color: Colors.black,
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      body: Container(
        color: Colors.white,
        child: RaisedButton(onPressed: () {
         
          
        }),
      ),
    );
  }
}
