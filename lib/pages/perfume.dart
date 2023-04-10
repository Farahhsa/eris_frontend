import 'package:flutter/material.dart';

import 'package:flutter_application_1/providers/category_provider.dart';
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
        children: [_listView()],
      );
  Widget _listView() => SizedBox(
        height: (MediaQuery.of(context).size.height * 60) / 100,
        child: ListView.builder(
            itemCount: images.length,
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
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(4),
                    height: itemSize,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(images[index]),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                              spreadRadius: 1)
                        ]),
                  ));
            }),
      );
}
