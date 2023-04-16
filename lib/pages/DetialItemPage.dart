import 'package:flutter/material.dart';
import 'package:flutter_application_1/providers/category_provider.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:provider/provider.dart';

class DetialItemPage extends StatelessWidget {
  final String index;

  const DetialItemPage({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: Column(
          children: [
            FutureBuilder(
              builder: (context, snapshot) {
                List items = context.read<CategoryProvider>().items;

                return _Item(items[int.parse(index)]);
              },
            )
          ],
        ));
  }

  Widget _Item(item) {
    return Column(
      children: [
        Text(
          item['name'],
          style: TextStyle(
            color: Colors.brown[400],
          ),
        ),
        Image(image: NetworkImage(item['image'])),
        Text(item['ingredients']),
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
            onPressed: () {},
            child: Text(
              "ADD TO CART",
              style: TextStyle(),
            ))
      ],
    );
  }
}
