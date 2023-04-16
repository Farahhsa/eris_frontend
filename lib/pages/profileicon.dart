import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  // ignore: override_on_non_overriding_member
  List<Icon> icons = [
    Icon(Icons.person, color: Colors.blue),
    Icon(Icons.settings, color: Colors.blue),
    Icon(Icons.note_add, color: Colors.blue),
    Icon(Icons.favorite, color: Colors.blue),
    Icon(Icons.chat, color: Colors.blue),
    Icon(Icons.login, color: Colors.blue),
  ];

  List titls = [
    'Perconal data',
    'Settings',
    'E-Statement',
    'Refferal Code',
    'Contact us',
    'Logout'
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
          children: [
            SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 2),
                    shape: BoxShape.circle,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage:
                          AssetImage('assets/images/profilepic.png'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Text(
              " ${context.watch<AuthProvider>().user!.username}",
              style: TextStyle(fontSize: 18, color: Colors.blue),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Divider(
                height: 40,
                thickness: 2,
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 6,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    width: 37,
                    height: 37,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: icons[index],
                  ),
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    // child: InkWell(
                    //   onTap: () {
                    //     if (index == 4) {
                    //       _launchURL();
                    //     }
                    //   },
                    //   child: Text(
                    //     titls[index],
                    //     style: TextStyle(fontSize: 17, color: Colors.white),
                    //   ),
                    // ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios_sharp,
                    size: 15,
                  ),
                );
              },
            ),
          ],
        )));
  }

  // _launchURL() async {
  //   const url = 'https://wa.me/96676317';
  //   final uri = Uri.parse(url);
  //   // if (await canLaunchUrl(uri)) {
  //   //   print('Should be opening ws');
  //   //   await launchUrl(uri, );
  //   // } else {
  //   //   throw 'Could not launch $url';
  //   // }
  //   html.window.open(url, "whatsapp");
  //   // await launch(URL, forceSafariVC: false);
  // }
}
