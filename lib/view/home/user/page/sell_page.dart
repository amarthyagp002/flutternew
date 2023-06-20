//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellPage extends StatefulWidget {
  const SellPage({super.key});

  @override
  State<SellPage> createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final TextEditingController _modelNameController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();
  final TextEditingController _transmissionController = TextEditingController();
  final TextEditingController _kilometersDrivenController =
      TextEditingController();
  final TextEditingController _numOfOwnersController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _priceController =
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
        title: const Text('Sell Your Car'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: _modelNameController,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Model Name',
                    hintText: 'Model Name'),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _yearController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Year',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _transmissionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Transmission',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _kilometersDrivenController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "KM's Driven",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _numOfOwnersController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'No. of Owners',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Description',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: _priceController, // Add TextField for price
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Price',
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    saveDetails();
                  },
                  child: const Text('Next'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void saveDetails() async {
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get();
    String name = (snap.data() as Map<String, dynamic>)['user-name'];
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
      'uid': FirebaseAuth.instance.currentUser!.uid,
      'user-name': name
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
    super.key,
    required this.modelNameController,
    required this.yearController,
    required this.transmissionController,
    required this.kilometersDrivenController,
    required this.numOfOwnersController,
    required this.descriptionController,
    required this.priceController, // Receive price controller
  });

  @override
  State<AddImagePage> createState() => _AddImagePageState();
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
        title: const Text('Add Image'),
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
            const SizedBox(height: 16.0),
            const Text(
              'Add Image',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _selectImage,
              child: const Text('Choose Image'),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _submitImage,
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
