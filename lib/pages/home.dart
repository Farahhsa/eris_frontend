import 'dart:ffi';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/pages/bestseller.dart';
import 'package:flutter_application_1/pages/perfume.dart';
import 'package:flutter_application_1/pages/profileicon.dart';
import 'package:flutter_application_1/pages/searchicon.dart';
import 'package:flutter_application_1/pages/signinpage.dart';
import 'package:flutter_application_1/pages/sprinkles.dart';
import 'package:flutter_application_1/providers/auth_provider.dart';
import 'package:flutter_application_1/providers/category_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'alloverspray.dart';
import 'landingpage.dart';
import 'musk.dart';

class Home extends StatefulWidget {
  Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> items = [
    "best seller",
    "Perfumes",
    "All Over Spray",
    "Musk",
    "Sprinkles",
  ];
  int current = 0;

  @override
  Widget build(BuildContext context) {
    // final Uri url = Uri.parse(' https://wa.me/96676317');
    return Scaffold(
      backgroundColor: Colors.brown[200],
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.brown[700]),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              padding: new EdgeInsets.all(0.0),
              color: Colors.brown[300],
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: MySearch(),
                );
              },
              icon: Icon(
                Icons.search,
                size: 20,
              )),
          IconButton(
              padding: new EdgeInsets.all(0.0),
              color: Colors.brown[300],
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    if (context.watch<AuthProvider>().isAuth) {
                      return Profile();
                    } else {
                      return SigninPage();
                    }
                  }),
                );
              },
              icon: Icon(Icons.person, size: 20)),
          // IconButton(
          //     onPressed: () {
          //       Navigator.push(
          //         context,
          //         MaterialPageRoute(builder: (context) => Landing()),
          //       );
          //     },
          //     icon: Icon(Icons.arrow_back)),
          context.watch<AuthProvider>().isAuth
              ? IconButton(
                  padding: new EdgeInsets.all(0.0),
                  color: Colors.brown[300],
                  onPressed: () {
                    context.read<AuthProvider>().signout();
                  },
                  icon: Icon(Icons.logout, size: 20))
              : Text(""),
        ],
      ),
      body: Container(
        margin: const EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 60,
              width: double.infinity,
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: items.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          current = index;
                        });

                        // context.read<AuthProvider>().signin(
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.all(5),
                        width: 80,
                        height: 45,
                        decoration: BoxDecoration(
                            color: current == index
                                ? Colors.brown[100]
                                : Colors.brown[50],
                            borderRadius: current == index
                                ? BorderRadius.circular(15)
                                : BorderRadius.circular(10),
                            border: current == index
                                ? Border.all(color: Colors.brown, width: 2)
                                : null),
                        child: Center(
                          child: Text(
                            items[index],
                            style: GoogleFonts.abrilFatface(),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            (current == 0)
                ? BestSeller()
                : current == 1
                    ? _Perfums()
                    : current == 2
                        ? _AllOverspray()
                        : current == 3
                            ? _MUSK()
                            : _Sprinkles()
          ],
        ),
      ),
    );
  }

  Widget BestSeller() => Stack(
        children: [
          Container(
              child: Column(
            children: [
              Text(
                "Best seller",
                style: TextStyle(
                    fontSize: 30, height: 2.21, color: Colors.brown[100]),
              ),
              MyProduct(),
            ],
          ))
        ],
      );
  Widget _Perfums() => Stack(
        children: [
          Container(
              child: Column(
            children: [
              Text(
                "Perfums",
                style: TextStyle(
                    fontSize: 30, height: 2.21, color: Colors.brown[100]),
              ),
              MyPerfume()
            ],
          ))
        ],
      );
  Widget _AllOverspray() => Stack(
        children: [
          Container(
              child: Column(
            children: [
              Text(
                "All over spray",
                style: TextStyle(
                    fontSize: 30, height: 2.21, color: Colors.brown[100]),
              ),
              Alloverspray(),
            ],
          ))
        ],
      );
  Widget _MUSK() => Stack(
        children: [
          Container(
              child: Column(
            children: [
              Text(
                "Musk",
                style: TextStyle(
                    fontSize: 30, height: 2.21, color: Colors.brown[100]),
              ),
              Musk(),
            ],
          ))
        ],
      );
  Widget _Sprinkles() => Stack(
        children: [
          Container(
              child: Column(
            children: [
              Text(
                "Sprinkles",
                style: TextStyle(
                    fontSize: 30, height: 2.21, color: Colors.brown[100]),
              ),
              Sprinkles(),
            ],
          ))
        ],
      );
}

class FirebaseUser {}
