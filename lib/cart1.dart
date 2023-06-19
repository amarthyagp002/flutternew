// import 'package:car/sell_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'first_home.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  buyordersfromcart() async {
    
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart-items')
        .get();
    for (var doc in querySnapshot.docs) {
      
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('cart-items')
          .doc(doc.id)
          .update({'status': 'buy'});
    }
    setState(() {
      
    });
  }

  cancelbooking(String name, String price, String companyname) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart-items')
        .where('item-name', isEqualTo: name)
        .where('item-price', isEqualTo: price)
        .where('item-company', isEqualTo: companyname)
        .get();
    String id = querySnapshot.docs[0].id;
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart-items')
        .doc(id)
        .delete();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Text(
              'Cart',
              style: TextStyle(fontSize: 30),
            ),
          ),
          actions: [
            // const Padding(
            //   padding: EdgeInsets.all(8.0),
            //   child: Icon(Icons.person),
            // )
          ]),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('cart-items')
                      .where('status', isEqualTo: 'cart')
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
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Image.network(
                                      (snapshot.data! as dynamic).docs[index]
                                          ['image'],
                                      fit: BoxFit.cover,
                                    ),
                                    height: 110,
                                    width: 160,
                                    color: Colors.deepOrange,
                                  ),
                                ),

                                SizedBox(height: 10),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['item-company'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
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
                                                    .docs[index]['item-price'],
                                                style: TextStyle(fontSize: 20),
                                              ),
                                              IconButton(
                                                  onPressed: () {
                                                    cancelbooking(
                                                        (snapshot.data!
                                                                    as dynamic)
                                                                .docs[index]
                                                            ['item-name'],
                                                        (snapshot.data!
                                                                    as dynamic)
                                                                .docs[index]
                                                            ['item-price'],
                                                        (snapshot.data!
                                                                    as dynamic)
                                                                .docs[index]
                                                            ['item-company']);
                                                  },
                                                  icon: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ))
                                            ],
                                          ),
                                          const SizedBox(height: 10),
                                          Text(
                                            (snapshot.data! as dynamic)
                                                .docs[index]['item-name'],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
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
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    buyordersfromcart();
                    // TODO: Implement the add to cart functionality
                    // Here, you can add the product to the user's cart
                    // or perform any other necessary actions.
                  },
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      backgroundColor: const Color.fromARGB(255, 250, 250, 250),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 13),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  child: Text(
                    'Buy now',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
