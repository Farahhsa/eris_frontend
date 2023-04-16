import 'package:flutter/material.dart';

import 'package:flutter_application_1/providers/category_provider.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class MyPerfume extends StatefulWidget {
  MyPerfume({super.key});
  @override
  State<MyPerfume> createState() => _MyPerfumeState();
}

class _MyPerfumeState extends State<MyPerfume> {
  final controller = ScrollController();
  final double itemSize = 100;

  var images = [
    '',
    '',
    '',
    '',
    '',
    '',
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
    //      context.read<CategoryProvider>().getItems(name: items[index]);
    return _body();
  }

  Widget _body() => Stack(
        children: [
          FutureBuilder(
            future: context.read<CategoryProvider>().getItems(name: "perfumes"),
            builder: (context, snapshot) {
              List items = context.read<CategoryProvider>().items;
              print(items);
              return _listView(items);
            },
          )
        ],
      );
  Widget _listView(items) => SizedBox(
        height: (MediaQuery.of(context).size.height * 60) / 100,
        child: ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: items.length,
            controller: controller,
            itemBuilder: (context, index) {
              final itemOffset = index * itemSize;
              final difference = controller.offset - itemOffset;
              final percent = 1 - (difference / (itemSize / 2));

              double opacity = percent;
              if (opacity > 1.0) opacity = 1.0;
              if (opacity < 0.0) opacity = 0.0;

              return Opacity(
                  opacity: opacity,
                  child: Container(
                    child: InkWell(
                      onTap: () {
                        context.push("/details/${index}");
                      },
                    ),
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(4),
                    height: itemSize,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(items[index]["image"]),
                            fit: BoxFit.contain),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.white,
                              blurRadius: 2,
                              spreadRadius: 1)
                        ]),
                  ));
            }),
      );
}
