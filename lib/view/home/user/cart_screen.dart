import 'package:akary/model/cart_item.dart';
import 'package:akary/service/firestore_service.dart';
import 'package:akary/view/home/user/payment_page.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  cancelBooking(String name, String price, String company) async {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PaymentScreen()));
        },
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            backgroundColor: const Color.fromARGB(255, 250, 250, 250),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
            textStyle:
                const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        child: const Text(
          'Buy now',
          style: TextStyle(color: Colors.black),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Cart',
            style: TextStyle(fontSize: 30),
          ),
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Expanded(
                child: FutureBuilder<List<CartItem>>(
                  future: FireStoreService.getCartItems(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        final item = snapshot.data![index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 16),
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 5,
                                spreadRadius: 2,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          height: 140,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              AspectRatio(
                                aspectRatio: 1,
                                child: CachedNetworkImage(
                                  imageUrl: item.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.name.capitalizeFirst!,
                                          style: const TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500),
                                          // style: GoogleFonts.montserrat(
                                          //     fontWeight: FontWeight.w600),
                                        ),
                                        const SizedBox(height: 6),
                                        Text(
                                          item.company.capitalizeFirst!,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                              fontSize: 16),
                                        ),
                                        const SizedBox(height: 18),
                                        Text(
                                          "Rs. ${item.price.round()}",
                                          style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    IconButton(
                                        onPressed: () {
                                          FireStoreService.removeFromCart(
                                              item);
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ))
                                  ],
                                ),
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
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
