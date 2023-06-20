import 'package:akary/request.dart';
import 'package:akary/staff_profile.dart';
import 'package:akary/stock_update.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StaffHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Staff Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              // Navigate to the profile page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => StaffProfile(),
                ),
              );
            },
          ),
        ],
      ),
      body: SafeArea(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to the first page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddProductPage(),
                    ),
                  );
                },
                child: Container(
                  width: 160,
                  height: 160,
                  //color: Color.fromARGB(156, 68, 56, 200),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: const Center(
                    child: Text(
                      'Update stock',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 25),
              // SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  // Navigate to the second page
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => SecondPage(),
                  //   ),
                  // );
                },
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => requestscreen()));
                  },
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'Sell Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  // Navigate to the first page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StaffProfile(),
                    ),
                  );
                },
                child: Container(
                  width: 160,
                  height: 160,
                  //color: Color.fromARGB(156, 68, 56, 200),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white),
                  child: const Center(
                    child: Text(
                      'Staff Profile',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 25),
              // SizedBox(height: 20),
              GestureDetector(
                onTap: () {},
                child: GestureDetector(
                  onTap: () {
                    // Navigator.push(context,
                    //     MaterialPageRoute(builder: (ctx) => requestscreen()));
                  },
                  child: Container(
                    width: 160,
                    height: 160,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white,
                    ),
                    child: const Center(
                      child: Text(
                        'Sell Details',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ])),
    );
  }
}
