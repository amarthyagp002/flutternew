import 'package:akary/contactus_page.dart';
import 'package:akary/terms_conditions_page.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              title: Text('Contact Us'),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ContactUsPage(),
                  ),
                );
                // Handle Contact Us action
                // You can navigate to a Contact Us screen or perform any other action here
              },
            ),
          ),
          SizedBox(height: 16.0),
          Container(
            padding: EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3), // changes position of shadow
                ),
              ],
            ),
            child: ListTile(
              title: Text('Terms & Conditions'),
              onTap: () {
                Navigator.pop(context); // close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TermsConditionsPage(),
                  ),
                );
                // Handle Terms & Conditions action
                // You can navigate to a Terms & Conditions screen or perform any other action here
              },
            ),
          ),
        ],
      ),
    );
  }
}
