import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact Us'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Contact Information',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('devi@example.com'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone'),
              subtitle: Text('+1 123-456-7890'),
            ),
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('123 Main St, City, Country'),
            ),
          ],
        ),
      ),
    );
  }
}
