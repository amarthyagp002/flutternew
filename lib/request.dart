import 'package:akary/viewrequestscreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class requestscreen extends StatefulWidget {
  const requestscreen({super.key});

  @override
  State<requestscreen> createState() => _requestscreenState();
}

class _requestscreenState extends State<requestscreen> {
  // viewrequest1(String uid) async {
  //   QuerySnapshot querySnapshot = await FirebaseFirestore.instance
  //       .collection('staff')
  //       .doc('ZORJDKCdPCgR23QIDx2DSEGWokG2')
  //       .collection('sellcars')
  //       .where('uid', isEqualTo: uid)
  //       .get();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('staff')
                  .doc(FirebaseAuth.instance.currentUser!.uid)
                  .collection('sellcars')
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
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                          color: Colors.black,
                        ),
                        height: 130,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Center(
                                  child: Column(
                                    children: [
                                      Text(
                                        (snapshot.data! as dynamic).docs[index]
                                            ['model name'],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 20),
                                        // style: GoogleFonts.montserrat(
                                        //     fontWeight: FontWeight.w600),
                                      ),
                                      const SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['price'],
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          IconButton(
                                              onPressed: () {
                                                print((snapshot
                                                                            .data!
                                                                        as dynamic)
                                                                    .docs[index]
                                                                ['uid']);
                                                Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (ctx) =>
                                                            viewrequest(uid:(snapshot
                                                                            .data!
                                                                        as dynamic)
                                                                    .docs[index]
                                                                ['uid'])));
                                                // cancelbooking(
                                                //     (snapshot.data!
                                                //                 as dynamic)
                                                //             .docs[index]
                                                //         ['item-name'],
                                                //     (snapshot.data!
                                                //                 as dynamic)
                                                //             .docs[index]
                                                //         ['item-price'],
                                                //     (snapshot.data!
                                                //                 as dynamic)
                                                //             .docs[index]
                                                //         ['item-company']);
                                              },
                                              icon: Icon(
                                                Icons.arrow_right,
                                                color: Colors.red,
                                              ))
                                        ],
                                      ),
                                      const SizedBox(height: 10),
                                      Text(
                                        (snapshot.data! as dynamic).docs[index]
                                            ['user-name'],
                                        style: TextStyle(fontSize: 20),
                                        // style: GoogleFonts.montserrat(
                                        //     fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                )
                                // const Icon(
                                //   Icons.person_rounded,
                                //   size: 40,
                                // ),
                                // const SizedBox(
                                //   width: 15,)
                                ,
                                // Text(
                                //   (snapshot.data! as dynamic).docs[index]
                                //       ['item-company'],
                                //   style: TextStyle(
                                //       color: Colors.white, fontSize: 20),
                                //   // style: GoogleFonts.montserrat(
                                //   //     fontWeight: FontWeight.w600),
                                // ),
                              ],
                            ),

                            // const SizedBox(height: 10),
                            // Text(
                            //   (snapshot.data! as dynamic).docs[index]
                            //       ['item-price'],
                            //   style: TextStyle(fontSize: 20),
                            // ),
                            // const SizedBox(height: 10),
                            // Text(
                            //   (snapshot.data! as dynamic).docs[index]
                            //       ['item-name'],
                            //   style: TextStyle(fontSize: 20),
                            //   // style: GoogleFonts.montserrat(
                            //   //     fontWeight: FontWeight.w600),
                            // ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10.0),
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // const Text('Service'),
                                        // Text(
                                        //   (snapshot.data! as dynamic)
                                        //       .docs[index]['item-price'],
                                        // ),
                                      ]),
                                ),
                                Column(
                                  children: [
                                    // const Text('Vehicle Name'),
                                    // Text(
                                    //   (snapshot.data! as dynamic)
                                    //       .docs[index]['item-name'],
                                    //   // style: GoogleFonts.montserrat(
                                    //   //     fontWeight: FontWeight.w600),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                // IconButton(
                                //     onPressed: () {
                                //       ///confirmbooking();
                                //     },
                                //     icon: const Icon(Icons.check_circle)),
                                // IconButton(
                                //     onPressed: () {
                                //       //  cancelbooking(
                                //       //   (snapshot.data! as dynamic)
                                //       //       .docs[index]['user-name'],
                                //       //   (snapshot.data! as dynamic)
                                //       //       .docs[index]['servicetype']);
                                //     },
                                //     icon: const Icon(Icons.cancel_rounded)),
                              ],
                            )

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
                    );
                  },
                );
              },
            ),
          ),
        ],
      )),
    );
  }
}
