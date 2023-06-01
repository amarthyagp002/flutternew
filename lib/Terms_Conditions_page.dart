import 'package:flutter/material.dart';

class TermsConditionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terms & Conditions'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms & Conditions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                '1. Agreement to Terms',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed auctor urna id tincidunt tempus.',
              ),
              SizedBox(height: 16.0),
              Text(
                '2. Eligibility',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Nulla facilisi. Integer ac faucibus nibh, at fringilla nunc. Nulla varius ex ac mauris lacinia vulputate.',
              ),
              SizedBox(height: 16.0),
              Text(
                '3. User Responsibilities',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                'Etiam pulvinar neque nec ullamcorper condimentum. In vitae mauris et erat laoreet sollicitudin. Nulla facilisi.',
              ),
              // Add more terms and conditions as necessary
            ],
          ),
        ),
      ),
    );
  }
}
