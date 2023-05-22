import 'package:akary/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:akary/staff_profile.dart';
import 'package:akary/login_page.dart';

class SelectionScreen extends StatefulWidget {
  const SelectionScreen({super.key});

  @override
  State<SelectionScreen> createState() => _SelectionScreenState();
}

class _SelectionScreenState extends State<SelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Positioned(
        top: 0,
        right: 0,
        left: 0,
        child: Container(
          height: 300,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/car-recycle-b.png'),
                  fit: BoxFit.fill)),
          child: Container(
              color: Color.fromARGB(243, 173, 50, 50).withOpacity(.85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hello,',
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w900,
                      fontSize: 45,
                      color: Color.fromARGB(179, 0, 0, 0),
                    ),
                  ),
                  Text(
                    'welcome',
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w900,
                      fontSize: 45,
                      color: Color.fromARGB(179, 255, 255, 255),
                    ),
                  ),
                  Text(
                    'back!',
                    maxLines: 3,
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w900,
                      fontSize: 45,
                      color: Color.fromARGB(179, 255, 255, 255),
                    ),
                  ),
                ],
              )),
        ),
      ),
      Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            height: 470,
            decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    'CONTINUE AS',
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w900,
                      fontSize: 32,
                      color: Color.fromARGB(179, 226, 204, 204),
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                      style:
                      ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 255, 43, 43));
                    },
                    child: Text(
                      "STAFF",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                      style:
                      ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 247, 111, 73));
                    },
                    child: Text(
                      "CUSTOMER",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => SignUp()));
                      style:
                      ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 242, 71, 71));
                    },
                    child: Text(
                      "GUEST",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ]),
          )),
    ]));
  }
}
