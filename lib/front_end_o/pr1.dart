import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductDescriptionPage extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productPrice;

  ProductDescriptionPage({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // appBar: AppBar(
        //   title: Text('Product Description'),
        // ),
        resizeToAvoidBottomInset: false,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 300,
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width,
                ),
                //color: Colors.blue,
                child: Image.asset('assets/mirror.jpg')),
            SizedBox(height: 8.0),
            Container(
              height: 504,
              // constraints:
              //     BoxConstraints(maxHeight: MediaQuery.of(context).size.height),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
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
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                       '',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Price',
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                      SizedBox(height: 8.0),
                      const Divider(
                        color: Color.fromARGB(255, 243, 241, 241),
                        height: 25,
                        thickness: 2,
                        indent: 5,
                        endIndent: 5,
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        'product description',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        '',
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(height: 150.0),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
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
          ],
        ));
  }
}
