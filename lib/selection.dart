import 'package:akary/front_end_o/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'home_page.dart';
//import 'front_end_o/LoginScreen.dart';
//import 'package:recycle/staff_profile.dart';

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
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/car-recycle-b.png'),
                  fit: BoxFit.fill)),
          child: Container(
              color: const Color.fromARGB(243, 173, 50, 50).withOpacity(.85),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                //  Text(
                //     'Hello,',
                //     maxLines: 3,
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //       fontStyle: FontStyle.normal,
                //       fontWeight: FontWeight.w900,
                //       fontSize: 45,
                //       color: Color.fromARGB(179, 0, 0, 0),
                //     ),
                //   ),
                //  Text(
                //     'welcome',
                //     maxLines: 3,
                //     textAlign: TextAlign.left,
                //     style: TextStyle(
                //       fontStyle: FontStyle.normal,
                //       fontWeight: FontWeight.w900,
                //       fontSize: 45,
                //       color: Color.fromARGB(179, 255, 255, 255),
                //     ),
                //   ),
                 Padding(
                   padding: EdgeInsets.all(20),
                   child: Text(
                      'Hai',
                      maxLines: 3,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                        fontSize: 45,
                        color: Color.fromARGB(179, 255, 255, 255),
                      ),
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
            height: 550,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40))),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
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
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      //   Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //           builder: (context) => StaffProfile()));
                      //   style:
                      //   ElevatedButton.styleFrom(
                      //       backgroundColor: Color.fromARGB(255, 255, 43, 43));
                      // },
                    },
                    style:
                      ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    child: const Text(
                      "STAFF",
                      style: TextStyle(fontSize: 20,
                      color:Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height:20
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.tightFor(width:150,height: 40),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  const HomeScreen()));
                      
                       
                      },
                       style:
                        ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                           ),
                           
                      child: const Text(
                        "CUSTOMER",
                        style: TextStyle(fontSize: 20,color:Colors.black),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height:20
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //         builder: (context) => StaffProfile()));
                      // style:
                      // ElevatedButton.styleFrom(
                      //     backgroundColor: Color.fromARGB(255, 242, 71, 71));
                    },
                    style:
                      ElevatedButton.styleFrom(
                          backgroundColor: Colors.white
                          )
                          ,
                    child: const Text(
                      "GUEST",
                      style: TextStyle(fontSize: 20,color:Colors.black),
                    ),
                  ),
                ]),
          )),
    ]
    )
    
    );
  }
}
