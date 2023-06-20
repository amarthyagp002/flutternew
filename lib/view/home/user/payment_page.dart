import 'package:akary/model/cart_item.dart';
import 'package:akary/service/firestore_service.dart';
import 'package:akary/view/home/home_screen_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: FutureBuilder<List<CartItem>>(
        future: FireStoreService.getCartItems(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                strokeWidth: 1,
              ),
            );
          }
          return SafeArea(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                          width: 45,
                          height: 45,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(15),
                            ),
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: const Icon(
                            Icons.keyboard_arrow_left,
                            color: Colors.black,
                            size: 28,
                          )),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      "Payment",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Product Details",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: snapshot.data!.length,
                            itemBuilder: (BuildContext context, int index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              snapshot.data![index].image),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(10),
                                        ),
                                      ),
                                      height: 80,
                                      width: 80,
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                snapshot.data![index].name
                                                    .capitalizeFirst!,
                                                style: const TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  height: 1,
                                                ),
                                              ),
                                              const SizedBox(
                                                height: 4,
                                              ),
                                              Text(
                                                snapshot.data![index].company
                                                    .capitalizeFirst!,
                                                style: const TextStyle(
                                                  fontSize: 14,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            "Rs. ${snapshot.data![index].price.toStringAsFixed(2)}",
                                            style: const TextStyle(
                                              fontSize: 16,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Payment Details",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              const Text(
                                "Total Amount",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.grey,
                                ),
                              ),
                              const Spacer(),
                              Text(
                                "Rs. ${snapshot.data!.map((e) => e.price).reduce((value, element) => value + element).toStringAsFixed(2)}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Payment Method",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.credit_card,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Credit Card",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      height: 1,
                                    ),
                                  ),
                                  Text(
                                    "**** **** **** 1234",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 24,
                          ),
                          const Text(
                            "Delivery Address",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  color: Colors.grey[100],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                                child: const Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                  size: 28,
                                ),
                              ),
                              const SizedBox(
                                width: 16,
                              ),
                              const Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Home",
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      height: 1,
                                    ),
                                  ),
                                  Text(
                                    "123, ABC Street, XYZ City",
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          InkWell(
                            onTap: () => FireStoreService.buyOrdersFromCart()
                                .then((value) {
                              if (value) {
                                showDialog(
                                  context: context,
                                  builder: ((context) {
                                    return AlertDialog(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      elevation: 10,
                                      scrollable: true,
                                      title: const Text(
                                        "Payment Successful",
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      content: const Center(
                                        child: Icon(
                                          Icons.check_circle,
                                          color: Colors.green,
                                          size: 80,
                                        ),
                                      ),
                                      actionsAlignment:
                                          MainAxisAlignment.center,
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                      builder: (ctx) =>
                                                          const HomeScreenWrapper(
                                                        role: "USER",
                                                      ),
                                                    ),
                                                    (route) => false);
                                          },
                                          child: const Text(
                                            "OK",
                                            style: TextStyle(
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                                );
                              }
                            }),
                            child: Container(
                              width: double.infinity,
                              height: 60,
                              decoration: BoxDecoration(
                                color: Colors.blueAccent[700],
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(15),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Paying Rs. ${snapshot.data!.map((e) => e.price).reduce((value, element) => value + element).toStringAsFixed(2)}",
                                  style: const TextStyle(
                                      color: Colors.white, fontSize: 14),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
