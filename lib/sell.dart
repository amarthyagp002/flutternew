//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'home_page.dart';

class SellPage extends StatefulWidget {
  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  TextEditingController _modelNameController = TextEditingController();
  TextEditingController _yearController = TextEditingController();
  TextEditingController _transmissionController = TextEditingController();
  TextEditingController _kilometersDrivenController = TextEditingController();
  TextEditingController _numOfOwnersController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  TextEditingController _priceController =
      TextEditingController(); // Add price controller

  void goToNextPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AddImagePage(
          modelNameController: _modelNameController,
          yearController: _yearController,
          transmissionController: _transmissionController,
          kilometersDrivenController: _kilometersDrivenController,
          numOfOwnersController: _numOfOwnersController,
          descriptionController: _descriptionController,
          priceController:
              _priceController, // Pass price controller to AddImagePage
        ),
      ),
    );
  }

  @override
  void dispose() {
    _modelNameController.dispose();
    _yearController.dispose();
    _transmissionController.dispose();
    _kilometersDrivenController.dispose();
    _numOfOwnersController.dispose();
    _descriptionController.dispose();
    _priceController.dispose(); // Dispose price controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sell Your Car'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: _modelNameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Model Name',
                    hintText: 'Model Name'),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _yearController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Year',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _transmissionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Transmission',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _kilometersDrivenController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "KM's Driven",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _numOfOwnersController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'No. of Owners',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _priceController, // Add TextField for price
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Price',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    savedetails();
                  },
                  child: Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void savedetails() async {
    DocumentSnapshot snap=await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get();
    String name=(snap.data() as Map<String,dynamic>)['user-name'];
    await FirebaseFirestore.instance
        .collection('staff')
        .doc('ZORJDKCdPCgR23QIDx2DSEGWokG2')
        .collection('sellcars')
        .doc()
        .set({
      'model name': _modelNameController.text,
      'year': _yearController.text,
      'transmission': _transmissionController.text,
      "KM's Driven": _kilometersDrivenController.text,
      'No.of owners': _numOfOwnersController.text,
      'description': _descriptionController.text,
      'price': _priceController.text,
      'uid':FirebaseAuth.instance.currentUser!.uid,
      'user-name':name
    });
  }
}

class AddImagePage extends StatefulWidget {
  final TextEditingController modelNameController;
  final TextEditingController yearController;
  final TextEditingController transmissionController;
  final TextEditingController kilometersDrivenController;
  final TextEditingController numOfOwnersController;
  final TextEditingController descriptionController;
  final TextEditingController priceController; // Add price controller

  const AddImagePage({
    required this.modelNameController,
    required this.yearController,
    required this.transmissionController,
    required this.kilometersDrivenController,
    required this.numOfOwnersController,
    required this.descriptionController,
    required this.priceController, // Receive price controller
  });

  @override
  _AddImagePageState createState() => _AddImagePageState();
}

class _AddImagePageState extends State<AddImagePage> {
  //File? _selectedImage;

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        //   _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _submitImage() {
    // if (_selectedImage != null) {
    //   // Upload the image to Firebase Storage (optional)
    //   // ...

    //   // Store the image details in the Firebase database
    //   FirebaseFirestore.instance.collection('images').add({
    //     //'path': _selectedImage!.path,
    //     // Add more fields as needed (e.g., image URL, timestamp, etc.)
    //   }).then((value) {
    //     print('Image details stored successfully');

    //     // Access the user details passed from SellPage
    //     var modelName = widget.modelNameController.text;
    //     var year = widget.yearController.text;
    //     var transmission = widget.transmissionController.text;
    //     var kilometersDriven = widget.kilometersDrivenController.text;
    //     var numOfOwners = widget.numOfOwnersController.text;
    //     var description = widget.descriptionController.text;
    //     var price = widget.priceController.text; // Get price value

    //     // Store additional details from SellPage in a separate collection
    //     FirebaseFirestore.instance.collection('sellDetails').add({
    //       'modelName': modelName,
    //       'year': year,
    //       'transmission': transmission,
    //       'kilometersDriven': kilometersDriven,
    //       'numOfOwners': numOfOwners,
    //       'description': description,
    //       'price': price, // Store price value
    //       // Add more fields as needed
    //     }).then((value) {
    //       print('Sell details stored successfully');

    //       // Navigate to the homepage and remove all previous routes from the stack
    //       Navigator.pushAndRemoveUntil(
    //         context,
    //         MaterialPageRoute(builder: (context) => homepage()),
    //         (route) => false,
    //       );
    //     }).catchError((error) {
    //       print('Failed to store sell details: $error');
    //     });
    //   }).catchError((error) {
    //     print('Failed to store image details: $error');
    //   });
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Image'),
        backgroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // _selectedImage != null
            //     ? Image.file(
            //         _selectedImage!,
            //         width: 200,
            //         height: 200,
            //       )
            //     : Icon(
            //         Icons.image,
            //         size: 100,
            //         color: Colors.grey,
            //       ),
            SizedBox(height: 16.0),
            Text(
              'Add Image',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectImage,
              child: Text('Choose Image'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitImage,
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
