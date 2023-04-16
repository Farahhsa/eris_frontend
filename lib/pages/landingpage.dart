import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class Landing extends StatelessWidget {
  const Landing({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              actions: <Widget>[
                TextButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.brown,
                      textStyle: GoogleFonts.abrilFatface()),
                  onPressed: () {},
                  child: const Text('sign up'),
                ),
                TextButton(
                  style: ElevatedButton.styleFrom(
                      onPrimary: Colors.brown,
                      textStyle: GoogleFonts.abrilFatface()),
                  onPressed: () {
                    context.push("/signin");
                  },
                  child: const Text('sign in'),
                ),
              ],
            ),
            body: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/erislogo1.png'),
                fit: BoxFit.cover,
              )),
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  // Text(" A perfect perfume for every mood ",
                  //     style: GoogleFonts.abrilFatface(
                  //       color: Color.fromARGB(255, 67, 150, 217),
                  //       fontSize: 15,
                  //       fontWeight: FontWeight.w400,
                  //     )),

                  SizedBox(
                    height: 75,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.only(top: 50, left: 7),
                  //   // child: CircleAvatar(
                  //   //   radius: 60,
                  //   //   backgroundImage: AssetImage(
                  //   //     'assets/images/erislogo1.png',
                  //   //   ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 425,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.push("/home");
                    },
                    child: Text("Home"),
                    style: ElevatedButton.styleFrom(
                        primary: Colors.brown[400], onPrimary: Colors.white),
                  ),
                ],
              ),
            )));
  }
}
