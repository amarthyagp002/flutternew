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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                width: 200,
                height: 100,
                //color: Color.fromARGB(156, 68, 56, 200),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.cyan),
                child: Center(
                  child: Text(
                    'Update stock',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
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
                  width: 200,
                  height: 100,
                  color: Colors.green,
                  child: Center(
                    child: Text(
                      'Second Page',
                      style: TextStyle(
                        color: Colors.white,
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
    );
  }
}
