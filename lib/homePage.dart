import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Background of Drawer
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[400]!,
                  Colors.blue[800]!,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          //Navigation Menu
          SafeArea(
            child: Container(
              width: 200.0,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: NetworkImage(
                              "https://ruksar.in/wp-content/uploads/2020/08/ruksar-ahmed-website-pic-100.jpg"),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Ruksar Ahmed",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Home",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.person,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Profile",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.settings,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Settings",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          title: Text(
                            "Log out",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Main Screen
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: value),
            duration: Duration(milliseconds: 500),
            builder: (_, double val, __) {
              return (
                  //Transform Widget
                  Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..setEntry(0, 3, 200 * val)
                  ..rotateY((pi / 6) * val),
                child: Scaffold(
                  appBar: AppBar(
                    title: Text("3D Drawer Menu"),
                  ),
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Swipe Right to Open the Menu 👉.",
                          style: TextStyle(fontSize: 20.0),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: Text("Press Me"),
                        ),
                      ],
                    ),
                  ),
                ),
              ));
            },
          ),

          // Gesture Detector to Open the Drawer.
          GestureDetector(
            onHorizontalDragUpdate: (e) {
              if (e.delta.dx > 0) {
                setState(() {
                  value = 1;
                });
              } else {
                setState(() {
                  value = 0;
                });
              }
            },
            // onTap: () {
            //   setState(() {
            //     value == 0 ? value = 1 : value = 0;
            //   });
            // },
          ),
        ],
      ),
    );
  }
}
