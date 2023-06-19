import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class OrdersPage extends StatefulWidget {
  @override
  _OrdersPageState createState() => _OrdersPageState();
}

class _OrdersPageState extends State<OrdersPage> {
  int _currentIndex = 0;

  final List<Widget> _sections = [
    SellingSection(),
    BuyingSection(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Orders'),
      ),
      body: _sections[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Selling',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Buying',
          ),
        ],
      ),
    );
  }
}

class SellingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Selling Section'),
    );
  }
}

class BuyingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Column(children: [
      Expanded(
                child: FutureBuilder(
                  future: FirebaseFirestore.instance
                      .collection('users')
                      .doc(FirebaseAuth.instance.currentUser!.uid)
                      .collection('cart-items')
                      .where('status', isEqualTo: 'buy')
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
                               
                                  ],
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
    ],
      
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: OrdersPage(),
  ));
}
