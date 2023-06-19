import 'dart:typed_data';

import 'package:akary/User_Details_Page.dart';
import 'package:akary/auth_services.dart';
import 'package:akary/customer_profile.dart';
import 'package:akary/cart1.dart';
//import 'package:akary/front_end_o/description.dart';
import 'package:akary/orders_Page.dart';
import 'package:akary/search.dart';
import 'package:akary/sell.dart';
import 'package:akary/description.dart';

import 'package:akary/settings_page.dart';
import 'package:akary/signup_page.dart';
import 'package:akary/login_page.dart';
import 'package:akary/stock_update.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'User_Details_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  String getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      return userId;
    }
    return ''; // or handle the case when the user is not authenticated
  }

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> _dataList = [];
  List<String> _searchResult = [];
  String? name;
  String? email;
  bool _isLoading = true;

  TextEditingController _searchController = TextEditingController();
  String getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      return userId;
    }
    return ''; // or handle the case when the user is not authenticated
  }

  getdetails() async {}
  getUserName() async {
    setState(() {
      _isLoading = true;
    });
    final getReturns = await AuthServices.getUser();
    if (getReturns[0] != "success") {
      return;
    }
    setState(() {
      _isLoading = false;
      name = getReturns[1];
      email = getReturns[2];
    });
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void sellButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SellPage()),
    );
  }

  // _image({}) async {
  //   DocumentSnapshot snap = await FirebaseFirestore.instance
  //       .collection('staff')
  //       .doc('ZORJDKCdPCgR23QIDx2DSEGWokG2').collection('item').where()
  //       .get();
  //   setState(() {
  //     String image = (snap.data() as Map<String, dynamic>)['image'];

  //   });

  move(String name) async {
    print(name);
    // QuerySnapshot querySnapshot = await FirebaseFirestore.instance
    //     .collection('staff')
    //     .doc(FirebaseAuth.instance.currentUser!.uid)
    //     .collection('items')
    //     .get();
    final query = await FirebaseFirestore.instance
        .collection('staff')
        .doc('ZORJDKCdPCgR23QIDx2DSEGWokG2')
        .collection('items')
        .where('part-name', isEqualTo: name)
        .get();
    print(query.docs[0].id);
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (ctx) => Descriptionscreen(id: query.docs[0].id)));
    // for (var document in querySnapshot.docs) {

    // }
  }

  List screens = [HomePage(), SellPage(), Cart()];
  int selectedindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (ctx) => const SearchPage()));
                },
                icon: Icon(Icons.search_rounded)),
          )
        ],
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.push(context,
        //           MaterialPageRoute(builder: (ctx) => const SearchPage()));
        //     },
        //     icon: Icon(Icons.search_rounded)),
        shadowColor: Colors.white,
        foregroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Search cars',
          ),
          onChanged: onSearchTextChanged,
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: Drawer(
        backgroundColor: Colors.black54,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 7, 7, 7)),
                    accountName: Text(name!),
                    accountEmail: Text(email!),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        name![0] + name![name!.indexOf(' ') + 1],
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Edit Profile'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerProfile(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.remove_red_eye_outlined),
                    title: Text('View Profile'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailsPage(
                            userId: getUserId(),
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('orders'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrdersPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
                        ),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Loginpage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child:
          //       _searchResult.length != 0 || _searchController.text.isNotEmpty
          //           ? ListView.builder(
          //               itemCount: _searchResult.length,
          //               itemBuilder: (context, index) {
          //                 return ListTile(
          //                   title: Text(_searchResult[index]),
          //                 );
          //               },
          //             )
          //           : ListView.builder(
          //               itemCount: _dataList.length,
          //               itemBuilder: (context, index) {
          //                 return ListTile(
          //                   title: Text(_dataList[index]),
          //                 );
          //               },
          //             ),
          // ),
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('staff')
                  .doc('ZORJDKCdPCgR23QIDx2DSEGWokG2')
                  .collection('items')
                  .get(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return ListView.builder(
                  itemCount: (snapshot.data! as dynamic).docs.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () async {
                          move((snapshot.data! as dynamic).docs[index]
                              ['part-name']);
                        },
                        child: Stack(
                          children: [
                            Container(
                                height: 300,
                                width: double.infinity,
                                child: Image.network(
                                  (snapshot.data! as dynamic).docs[index]
                                      ['image'],
                                  fit: BoxFit.cover,
                                )
                                // decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //         image: NetworkImage(
                                //             (snapshot.data! as dynamic)
                                //                 .docs[index]['image']))),
                                ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                color: Colors.transparent,
                              ),
                              height: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 150,
                                    ),
                                    Text(
                                      (snapshot.data! as dynamic).docs[index]
                                          ['part-name'],
                                      style: TextStyle(fontSize: 30),
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      (snapshot.data! as dynamic).docs[index]
                                          ['company'],
                                      style: TextStyle(fontSize: 20),
                                    ),

                                    const SizedBox(height: 7),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          (snapshot.data! as dynamic)
                                              .docs[index]['price'],
                                          style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.orange),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                              color: Colors.orange,
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                    // Row(
                                    //   children: [
                                    //     const Icon(
                                    //       Icons.person_rounded,
                                    //       size: 40,
                                    //     ),
                                    //     const SizedBox(
                                    //       width: 15,
                                    //     ),
                                    //     Text(
                                    //       (snapshot.data! as dynamic).docs[index]
                                    //           ['user-name'],
                                    //       style: GoogleFonts.montserrat(
                                    //           fontWeight: FontWeight.w600),
                                    //     ),
                                    //   ],
                                    // ),
                                    // const SizedBox(height: 7),
                                    // Row(
                                    //   mainAxisAlignment:
                                    //       MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Padding(
                                    //       padding: const EdgeInsets.only(left: 10.0),
                                    //       child: Column(
                                    //           crossAxisAlignment:
                                    //               CrossAxisAlignment.start,
                                    //           children: [
                                    //             const Text('Service'),
                                    //             Text(
                                    //               (snapshot.data! as dynamic)
                                    //                   .docs[index]['servicetype'],
                                    //             ),
                                    //           ]),
                                    //     ),
                                    //     const Text('Vehicle Name'),
                                    //   ],
                                    // ),
                                    // Row(
                                    //   children: [
                                    //     IconButton(
                                    //         onPressed: () {
                                    //           confirmbooking();
                                    //         },
                                    //         icon: const Icon(Icons.check_circle)),
                                    //     IconButton(
                                    //         onPressed: () {
                                    //              cancelbooking(
                                    //               (snapshot.data! as dynamic)
                                    //                   .docs[index]['user-name'],
                                    //               (snapshot.data! as dynamic)
                                    //                   .docs[index]['servicetype']);
                                    //         },
                                    //         icon: const Icon(Icons.cancel_rounded)),
                                    //   ],
                                    // )

                                    // Text(
                                    //   (snapshot.data! as dynamic).docs[index]
                                    //       ['booked-date'],
                                    // ),

                                    // Text(
                                    //   (snapshot.data! as dynamic).docs[index]['time'],
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => SellPage()));
            },
            child: Icon(Icons.navigate_next),
          )
        ],
      ),
    );
  }

  void onSearchTextChanged(String text) {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _dataList.forEach((item) {
      if (item.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(item);
      }
    });
    setState(() {});
  }

  // @override
  // void dispose() {
  //   _searchController.dispose();
  //   super.dispose();
  // }
}

class UserBox extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  UserBox({
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            email,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            phone,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}
