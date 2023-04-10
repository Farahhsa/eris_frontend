import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                TextButton(
                  style: ElevatedButton.styleFrom(onPrimary: Colors.blue),
                  onPressed: () {},
                  child: const Text('sign up'),
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(onPrimary: Colors.blue),
                  onPressed: () {
                    context.push("/signin");
                  },
                  child: const Text('sign in'),
                ),
              ],
            ),
            body: Container(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    " Eris ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 67, 150, 217),
                      fontSize: 27,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "A perfect perfume for every mood.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50, left: 7),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage(
                        'assets/images/erislogo1.png',
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.push("/home");
                    },
                    child: Text("Home"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.blue, onPrimary: Colors.white),
                  ),
                ],
              ),
            )));
  }
}
