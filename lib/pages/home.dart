import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_1/pages/bestseller.dart';
import 'package:flutter_application_1/pages/perfume.dart';
import 'package:flutter_application_1/pages/sprinkles.dart';
import 'package:flutter_application_1/providers/category_provider.dart';
import 'package:provider/provider.dart';

import 'alloverspray.dart';
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,

        actions: [
          IconButton(
              onPressed: () {
                // TextField(
                //   decoration: InputDecoration(hintText: "Search"),
                // );
              },
              icon: Icon(Icons.search)),
          // IconButton(onPressed: onPressed, icon: icon)
        ],

        // actions: [IconButton(onPressed: () {}, icon: Icon(Icons.person))],
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
                                ? Colors.blue[50]
                                : Colors.white,
                            borderRadius: current == index
                                ? BorderRadius.circular(15)
                                : BorderRadius.circular(10),
                            border: current == index
                                ? Border.all(color: Colors.blue, width: 2)
                                : null),
                        child: Center(
                          child: Text(
                            items[index],
                            style: TextStyle(
                                fontFamily: 'DancingScript', fontSize: 12),
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
                style: TextStyle(fontSize: 30, height: 2.21),
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
                style: TextStyle(fontSize: 30, height: 2.21),
              ),
              FutureBuilder(
                future:
                    context.read<CategoryProvider>().getItems(name: "farah"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState.name == "waiting") {
                    return Text("Loading...");
                  }
                  print("HI FARAH ${snapshot.data}");
                  return MyPerfume();
                },
              )
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
                style: TextStyle(fontSize: 30, height: 2.21),
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
                style: TextStyle(fontSize: 30, height: 2.21),
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
                style: TextStyle(fontSize: 30, height: 2.21),
              ),
              Sprinkles(),
            ],
          ))
        ],
      );
}
