//import 'package:car/pr1.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
//import 'pr1.dart';

class First_Home extends StatefulWidget {
  const First_Home({super.key});

  @override
  State<First_Home> createState() => _First_HomeState();
}

class _First_HomeState extends State<First_Home> {
  int _selectedIndex = 0;
  void _ontap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
            backgroundColor: Colors.transparent,
            leading: const Icon(Icons.menu),
            actions: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.person),
              )
            ]),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.black,
          type: BottomNavigationBarType.fixed,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box,
                  size: 35,
                ),
                label: 'sell'),
            BottomNavigationBarItem(
                icon: Icon(Icons.handshake), label: 'bookings')
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.white,
          //onTap: _ontapped,
        ),
        body: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              // ignore: unnecessary_const
              padding: const EdgeInsets.all(25),
              child: Text(
                'CATCH UP YOUR THINGS',
                style: TextStyle(fontSize: 50),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(20),
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search here',
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade600)),
                ),
              ),
            ),
            Expanded(
                child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 170,
                          height: 200,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black54),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/tyre.jpg')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('tyre', textAlign: TextAlign.left),
                              const SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('  150',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(Icons.add),
                                    ),
                                  ])
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 170,
                          height: 200,
                          // color: Colors.black54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black54),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/door.jpg')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('side mirror',
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('  500',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(Icons.add),
                                    ),
                                  ])
                            ],
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 170,
                          height: 200,
                          //color: Colors.black54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black54),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/seat.jpg')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('seat', textAlign: TextAlign.left),
                              const SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('  300',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(Icons.add),
                                    ),
                                  ]),
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 170,
                          height: 200,
                          // color: Colors.black54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black54),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/seat.jpg')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('side mirror',
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('  150',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(Icons.add),
                                    ),
                                  ])
                            ],
                          )),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 170,
                          height: 200,
                          // color: Colors.black54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black54),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/mirror.jpg')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('side mirror',
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('  200',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.orange,
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Icon(Icons.add),
                                    ),
                                  ])
                            ],
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          padding: const EdgeInsets.all(12),
                          width: 170,
                          height: 200,
                          //color: Colors.black54,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.black54),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.asset('assets/mirror.jpg')),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text('side mirror',
                                  textAlign: TextAlign.left),
                              const SizedBox(height: 15),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text('  100',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    GestureDetector(
                                      onTap: () {
                                        // Navigator.push(
                                        //     context,
                                        //     MaterialPageRoute(
                                        //         builder: (context) =>
                                        //             ProductDescriptionPage(
                                        //               productName:
                                        //                   'Alto mirrors',
                                        //               productDescription:
                                        //                   ''' Right side mirror glass \n Maruthi 800 \n fully fuctional\n back colour \n auto foldable''',
                                        //               productPrice: 1200,
                                        //             )));
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.orange,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Icon(Icons.add),
                                      ),
                                    ),
                                  ])
                            ],
                          )),
                    )
                  ],
                )
              ],
            ))
          ],
        ));
  }
}
