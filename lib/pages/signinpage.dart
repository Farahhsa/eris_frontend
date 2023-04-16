import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class SigninPage extends StatelessWidget {
  SigninPage({Key? key}) : super(key: key);

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[200],
      body: Stack(
        children: [
          Row(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Padding(
              //   padding: const EdgeInsets.only(top: 100, left: 320),
              //   child: CircleAvatar(
              //     backgroundImage: AssetImage(
              //       'assets/images/logo2.png',
              //     ),
              //     radius: 35,
              //   ),
              // ),
            ],
          ),
          Container(
            // decoration: BoxDecoration(
            //     image: DecorationImage(
            //   image: AssetImage('assets/images/bk.png'),
            //   fit: BoxFit.cover,
            // )),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, top: 160, right: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Welcome to eris family',
                          style: TextStyle(color: Colors.brown)),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 40.0, left: 40, right: 40),
                  child: Text(')', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 35, right: 35),
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "username",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          controller: usernameController,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextField(
                          style: TextStyle(),
                          obscureText: true,
                          decoration: InputDecoration(
                              fillColor: Colors.grey.shade100,
                              filled: true,
                              hintText: "Password",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          controller: passwordController,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Sign in',
                              style: TextStyle(color: Colors.brown),
                            ),
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.black,
                              child: IconButton(
                                  color: Colors.white,
                                  onPressed: () {
                                    context.read<AuthProvider>().signin(
                                        username: usernameController.text,
                                        password: passwordController.text);
                                    context.go('/home');
                                  },
                                  icon: Icon(
                                    Icons.arrow_forward,
                                  )),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        // Row(
                        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        //   children: [
                        //     TextButton(
                        //       onPressed: () {
                        //         context.push("/signup");
                        //       },
                        //       child: Text(
                        //         'Sign Up',
                        //         textAlign: TextAlign.left,
                        //         style: TextStyle(
                        //             decoration: TextDecoration.underline,
                        //             color: Color(0xff4c505b),
                        //             fontSize: 18),
                        //       ),
                        //       style: ButtonStyle(),
                        //     ),
                        //     TextButton(
                        //         onPressed: () {},
                        //         child: Text(
                        //           'Forgot Password',
                        //           style: TextStyle(
                        //             decoration: TextDecoration.underline,
                        //             color: Color(0xff4c505b),
                        //             fontSize: 18,
                        //           ),
                        //         )),
                        //   ],
                        // )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
