import 'dart:io';
import 'package:akary/home_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  State<CustomerProfile> createState() => _CustomerProfileState();
}

class _CustomerProfileState extends State<CustomerProfile> {
  File? _image;
  final CollectionReference _userCollection =
      FirebaseFirestore.instance.collection('users');

  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _stateController = TextEditingController();
  TextEditingController _districtController = TextEditingController();
  TextEditingController _pincodeController = TextEditingController();

  Future<void> _saveUserDetails() async {
    String fullName = _fullNameController.text;
    String phoneNumber = _phoneNumberController.text;
    String address = _addressController.text;
    String state = _stateController.text;
    String district = _districtController.text;
    String pincode = _pincodeController.text;

    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;

        DocumentSnapshot snapshot = await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .get();
        Map<String, dynamic> existingData =
            snapshot.data() as Map<String, dynamic>;

        Map<String, dynamic> newData = {
          'fullName': fullName,
          'phoneNumber': phoneNumber,
          'address': address,
          'state': state,
          'district': district,
          'pincode': pincode,
        };

        // Merge the existing data with the new data
        Map<String, dynamic> updatedData = {...existingData, ...newData};

        await FirebaseFirestore.instance
            .collection('users')
            .doc(userId)
            .set(updatedData);

        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Success'),
              content: const Text('User details saved to Firestore.'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => homepage()),
                    );
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text('An error occurred: $e'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<void> _pickImage() async {
    final imagePicker = ImagePicker();
    final pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        title: Text("Customer"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          children: <Widget>[
            CircleAvatar(
              radius: 58,
              backgroundImage: _image != null
                  ? FileImage(_image!)
                  : Image.network(
                      'https://static.vecteezy.com/system/resources/thumbnails/009/734/564/small/default-avatar-profile-icon-of-social-media-user-vector.jpg',
                    ).image,
              backgroundColor: Color.fromARGB(255, 255, 255, 255),
              child: Align(
                alignment: Alignment(0.2, 1.3),
                child: IconButton(
                  onPressed: _pickImage,
                  icon: Icon(Icons.camera),
                ),
              ),
            ),
            SizedBox(height: 10),
            nameTextField(),
            SizedBox(height: 8),
            phoneNumberTextField(),
            SizedBox(height: 8),
            addressTextField(),
            SizedBox(height: 8),
            stateTextField(),
            SizedBox(height: 8),
            districtTextField(),
            SizedBox(height: 8),
            pincodeTextField(),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: _saveUserDetails,
              child: Text('SUBMIT'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget nameTextField() {
    return TextFormField(
      controller: _fullNameController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 0, 0, 0),
            width: 2,
          ),
        ),
        prefixIcon: Icon(Icons.person, color: Colors.black),
        labelText: "Fullname",
      ),
    );
  }

  Widget phoneNumberTextField() {
    return TextFormField(
      controller: _phoneNumberController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.phone,
          color: Color.fromARGB(255, 35, 35, 35),
        ),
        labelText: "Phone number",
      ),
    );
  }

  Widget addressTextField() {
    return TextFormField(
      controller: _addressController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        prefixIcon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        labelText: "Address",
      ),
    );
  }

  Widget stateTextField() {
    return TextFormField(
      controller: _stateController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        labelText: "State",
      ),
    );
  }

  Widget districtTextField() {
    return TextFormField(
      controller: _districtController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        labelText: "District",
      ),
    );
  }

  Widget pincodeTextField() {
    return TextFormField(
      controller: _pincodeController,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 2,
          ),
        ),
        labelText: "Pincode",
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _fetchUserDetails();
  }

  Future<void> _fetchUserDetails() async {
    try {
      User? user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        String userId = user.uid;

        final querySnapshot = await FirebaseFirestore.instance
            .collection('users')
            .where('userId', isEqualTo: userId)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          final userData = querySnapshot.docs.first.data();
          _fullNameController.text = userData['fullName'] ?? '';
          _phoneNumberController.text = userData['phoneNumber'] ?? '';
          _addressController.text = userData['address'] ?? '';
          _stateController.text = userData['state'] ?? '';
          _districtController.text = userData['district'] ?? '';
          _pincodeController.text = userData['pincode'] ?? '';
        }
      }
    } catch (e) {
      print('Error fetching user details: $e');
    }
  }
}
