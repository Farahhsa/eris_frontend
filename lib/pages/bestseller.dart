import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class MyProduct extends StatefulWidget {
  MyProduct({super.key});
  @override
  State<MyProduct> createState() => _MyProductState();
}

class _MyProductState extends State<MyProduct> {
  final controller = ScrollController();
  final double itemSize = 100;

  var images = [
    'assets/images/hero.png',
    'assets/images/calm.png',
    'assets/images/paris.png',
    'assets/images/gelata.png'
  ];
  get scale => null;

  void onListenerController() {
    setState(() {});
  }

  @override
  void initState() {
    controller.addListener(onListenerController);
    super.initState();
  }

  @override
  void dispose() {
    controller.removeListener(onListenerController);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _body(),
    );
  }

  Widget _body() => Stack(
        children: [
          _listView(),
          // Container(
          //   height: 180,
          //   decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //           begin: Alignment.topCenter,
          //           end: Alignment.bottomCenter,
          //           colors: [Colors.white, Colors.transparent])),
          // )
        ],
      );
  Widget _listView() => SizedBox(
        height: (MediaQuery.of(context).size.height * 60) / 100,
        child: ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: images.length,
            controller: controller,
            itemBuilder: (context, index) {
              final itemOffset = index * itemSize;
              final difference = controller.offset - itemOffset;
              final percent = 1 - (difference / (itemSize / 2));

              double opacity = percent;
              if (opacity > 1.0) opacity = 1.0;
              if (opacity < 0.0) opacity = 0.0;
              // if (scale > 1.0) scale = 1.0;

              return Opacity(
                  opacity: opacity,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(4),
                    height: itemSize,
                    decoration: BoxDecoration(
                        // color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.contain),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 2,
                              spreadRadius: 1)
                        ]),
                    // child: Text(
                    //   // '$index',
                    //   // style: TextStyle(color: Colors.black, fontSize: 48),
                    // ),
                  ));
            }),
      );
}


// Opacity(
//                 opacity: opacity,
//                 child: Transform(
//                   alignment: Alignment.center,
//                   transform: Matrix4.identity()..scale(scale, 1.0),
//                   child: Container(
//                     width: MediaQuery.of(context).size.width,
//                     margin: EdgeInsets.all(4),
//                     height: itemSize,
//                     decoration: BoxDecoration(
//                         color: Colors.blue,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Colors.black,
//                               blurRadius: 1,
//                               spreadRadius: 2)
//                         ]),
//                     child: Text(
//                       '$index',
//                       style: TextStyle(color: Colors.white, fontSize: 48),
//                     ),
//                   ),
//                 ),
//               );
            

            