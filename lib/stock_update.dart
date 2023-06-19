import 'dart:io';
import 'package:akary/staff_home_page.dart';
import 'package:akary/store.dart';
import 'package:akary/utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

final partnamecontroller = TextEditingController();
final companycontroller = TextEditingController();
final pricecontroller = TextEditingController();
final desccontroller = TextEditingController();

class _AddProductPageState extends State<AddProductPage> {
  String partName = '';
  String company = '';
  double price = 0.0;
  String description = '';
  late ImagePicker picker;
  String image = "";
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
    });
  }

  void saveprofile() async {
    String resp = await Storedata().addImage(
        image: partnamecontroller.text.trim(),
        profile: companycontroller.text.trim(),
        description: desccontroller.text.trim(),
        price: pricecontroller.text.trim(),
        file: _image!);
  }

  // savedetails() async {
  //   print('hello');
  //   await FirebaseFirestore.instance
  //       .collection('staff')
  //       .doc(FirebaseAuth.instance.currentUser!.uid)
  //       .collection('items')
  //       .doc()
  //       .set({
  //     'part-name': partnamecontroller.text.trim(),
  //     'company': companycontroller.text.trim(),
  //     'price': pricecontroller.text.trim(),
  //     'description': desccontroller.text.trim(),
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: partnamecontroller,
                onChanged: (value) {
                  setState(() {
                    partName = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Part Name',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: companycontroller,
                onChanged: (value) {
                  setState(() {
                    company = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Company',
                ),
              ),
              SizedBox(height: 16.0),
              TextField(
                controller: pricecontroller,
                onChanged: (value) {
                  setState(() {
                    price = double.tryParse(value) ?? 0.0;
                  });
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  selectImage();
                },
                child: Text('Select Image'),
              ),
              SizedBox(height: 16.0),
              _image != null
                  ? Container(
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          image: DecorationImage(image: MemoryImage(_image!))),
                    )
                  : Placeholder(
                      fallbackHeight: 200,
                      fallbackWidth: 200,
                    ),
              SizedBox(height: 16.0),
              TextField(
                controller: desccontroller,
                onChanged: (value) {
                  setState(() {
                    description = value;
                  });
                },
                maxLines: 3,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  saveprofile();
                  dispose();
                  // savedetails();

                  // Save the product details and navigate back
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => StaffHomePage()));
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    partnamecontroller.clear();
    companycontroller.clear();
    pricecontroller.clear();
    desccontroller.clear();

    super.dispose();
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddProductPage(),
              ),
            );
          },
          child: Text('Add Product'),
        ),
      ),
    );
  }
}
