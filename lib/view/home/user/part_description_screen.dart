import 'package:akary/model/vehicle_part.dart';
import 'package:akary/service/firestore_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PartDescriptionScreen extends StatefulWidget {
  final VehiclePart vehiclePart;
  const PartDescriptionScreen({
    super.key,
    required this.vehiclePart,
  });

  @override
  State<PartDescriptionScreen> createState() => _PartDescriptionScreenState();
}

class _PartDescriptionScreenState extends State<PartDescriptionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              height: 300,
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
              ),
              //color: Colors.blue,
              child: CachedNetworkImage(
                imageUrl: widget.vehiclePart.image,
                fit: BoxFit.cover,
              )),
          Expanded(
            child: Container(
              height: 480,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
                  color: Colors.black),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 20.0),
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.vehiclePart.name.capitalizeFirst!,
                            style: const TextStyle(
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.vehiclePart.company.capitalizeFirst!,
                                style: const TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Rs. ${widget.vehiclePart.price.round()}",
                                style: const TextStyle(
                                  fontSize: 20.0,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ],
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
                      const Text(
                        'Product Description',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 8.0),
                      Text(
                        widget.vehiclePart.description,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.white,
                        ),
                      ),
                      const Spacer(),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            FireStoreService.addPartToUserCart(
                                widget.vehiclePart);
                          },
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(40)),
                              backgroundColor:
                                  const Color.fromARGB(255, 250, 250, 250),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 13),
                              textStyle: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold)),
                          child: const Text(
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
      ),
    ));
  }
}
