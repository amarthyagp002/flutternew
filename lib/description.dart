import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Descriptionscreen extends StatefulWidget {
  String id;
  Descriptionscreen({
    super.key,
    required this.id,
  });

  @override
  State<Descriptionscreen> createState() => _DescriptionscreenState();
}

class _DescriptionscreenState extends State<Descriptionscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdetails(widget.id);
  }

  String partname = "";
  String price = "";
  String company = "";
  String description = "";
  String image = "";
  getdetails(String id) async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('staff')
        .doc('ZORJDKCdPCgR23QIDx2DSEGWokG2')
        .collection('items')
        .doc(id)
        .get();
    partname = (snap.data() as Map<String, dynamic>)['part-name'];
    price = (snap.data() as Map<String, dynamic>)['price'];
    description = (snap.data() as Map<String, dynamic>)['description'];
    company = (snap.data() as Map<String, dynamic>)['company'];
    image = (snap.data() as Map<String, dynamic>)['image'];

    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: double.infinity,
                height: 300,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                //color: Colors.blue,
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                )),
            SizedBox(height: 8.0),
            Expanded(
              child: Container(
                height: 480,
                // constraints:
                //     BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
                decoration: const BoxDecoration(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(40)),
                    color: Colors.black),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          color: Color.fromARGB(255, 96, 90, 90),
                          height: 25,
                          thickness: 6,
                          indent: 90,
                          endIndent: 90,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          partname,
                          style: const TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          price,
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        const SizedBox(height: 8.0),
                        const Divider(
                          color: Color.fromARGB(255, 243, 241, 241),
                          height: 25,
                          thickness: 2,
                          indent: 5,
                          endIndent: 5,
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          'product description',
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8.0),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        Text(
                          company,
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 150.0),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              cartadd(partname, price, company, image);
                              // TODO: Implement the add to cart functionality
                              // Here, you can add the product to the user's cart
                              // or perform any other necessary actions.
                            },
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                backgroundColor:
                                    const Color.fromARGB(255, 250, 250, 250),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 13),
                                textStyle: const TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold)),
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ));
  }

  cartadd(String part, String amount, String itemcompany, String image) async {
    await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart-items')
        .doc()
        .set({
      'item-name': part,
      'item-price': amount,
      'item-company': itemcompany,
      'image': image,
      'status':'cart'
    });
  }
}
