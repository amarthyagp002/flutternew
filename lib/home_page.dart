import 'package:akary/User_Details_Page.dart';
import 'package:akary/auth_services.dart';
import 'package:akary/customer_profile.dart';
import 'package:akary/orders_Page.dart';

import 'package:akary/settings_page.dart';
import 'package:akary/signup_page.dart';
import 'package:akary/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'User_Details_Page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class homepage extends StatefulWidget {
  homepage({Key? key}) : super(key: key);

  String getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      return userId;
    }
    return ''; // or handle the case when the user is not authenticated
  }

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> _dataList = [];
  List<String> _searchResult = [];
  String? name;
  String? email;
  bool _isLoading = true;

  TextEditingController _searchController = TextEditingController();
  String getUserId() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      String userId = user.uid;
      return userId;
    }
    return ''; // or handle the case when the user is not authenticated
  }

  getUserName() async {
    setState(() {
      _isLoading = true;
    });
    final getReturns = await AuthServices.getUser();
    if (getReturns[0] != "success") {
      return;
    }
    setState(() {
      _isLoading = false;
      name = getReturns[1];
      email = getReturns[2];
    });
  }

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  void sellButtonPressed() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SellPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.white,
        foregroundColor: Colors.white,
        title: TextField(
          controller: _searchController,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            hintText: 'Search cars',
          ),
          onChanged: onSearchTextChanged,
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: _isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    decoration:
                        BoxDecoration(color: Color.fromARGB(255, 7, 7, 7)),
                    accountName: Text(name!),
                    accountEmail: Text(email!),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Text(
                        name![0] + name![name!.indexOf(' ') + 1],
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.home),
                    title: Text('Home'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.person),
                    title: Text('Edit Profile'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CustomerProfile(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.remove_red_eye_outlined),
                    title: Text('View Profile'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailsPage(
                            userId: getUserId(),
                          ),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text('orders'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrdersPage(),
                        ),
                      );
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SettingsPage(),
                        ),
                      );
                    },
                  ),
                  Divider(),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
                    onTap: () {
                      Navigator.pop(context); // close the drawer
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Loginpage(),
                        ),
                      );
                    },
                  ),
                ],
              ),
      ),
      body: Column(
        children: [
          Expanded(
            child:
                _searchResult.length != 0 || _searchController.text.isNotEmpty
                    ? ListView.builder(
                        itemCount: _searchResult.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_searchResult[index]),
                          );
                        },
                      )
                    : ListView.builder(
                        itemCount: _dataList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(_dataList[index]),
                          );
                        },
                      ),
          ),
          FloatingActionButton(
            onPressed: sellButtonPressed,
            child: Icon(Icons.add),
            backgroundColor: Colors.black,
          ),
        ],
      ),
    );
  }

  void onSearchTextChanged(String text) {
    _searchResult.clear();
    if (text.isEmpty) {
      setState(() {});
      return;
    }
    _dataList.forEach((item) {
      if (item.toLowerCase().contains(text.toLowerCase())) {
        _searchResult.add(item);
      }
    });
    setState(() {});
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}

class UserBox extends StatelessWidget {
  final String name;
  final String email;
  final String phone;

  UserBox({
    required this.name,
    required this.email,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            name,
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            email,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 8.0),
          Text(
            phone,
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.grey[600],
            ),
          ),
        ],
      ),
    );
  }
}

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
          padding: EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _modelNameController,
                decoration: InputDecoration(
                  labelText: 'Model Name',
                ),
              ),
              TextField(
                controller: _yearController,
                decoration: InputDecoration(
                  labelText: 'Year',
                ),
              ),
              TextField(
                controller: _transmissionController,
                decoration: InputDecoration(
                  labelText: 'Transmission',
                ),
              ),
              TextField(
                controller: _kilometersDrivenController,
                decoration: InputDecoration(
                  labelText: "KM's Driven",
                ),
              ),
              TextField(
                controller: _numOfOwnersController,
                decoration: InputDecoration(
                  labelText: 'No. of Owners',
                ),
              ),
              TextField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  labelText: 'Description',
                ),
              ),
              TextField(
                controller: _priceController, // Add TextField for price
                decoration: InputDecoration(
                  labelText: 'Price',
                ),
              ),
              ElevatedButton(
                onPressed: goToNextPage,
                child: Text('Next'),
              ),
            ],
          ),
        ),
      ),
    );
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
  File? _selectedImage;

  Future<void> _selectImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.getImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        _selectedImage = File(pickedImage.path);
      });
    }
  }

  void _submitImage() {
    if (_selectedImage != null) {
      // Upload the image to Firebase Storage (optional)
      // ...

      // Store the image details in the Firebase database
      FirebaseFirestore.instance.collection('images').add({
        'path': _selectedImage!.path,
        // Add more fields as needed (e.g., image URL, timestamp, etc.)
      }).then((value) {
        print('Image details stored successfully');

        // Access the user details passed from SellPage
        var modelName = widget.modelNameController.text;
        var year = widget.yearController.text;
        var transmission = widget.transmissionController.text;
        var kilometersDriven = widget.kilometersDrivenController.text;
        var numOfOwners = widget.numOfOwnersController.text;
        var description = widget.descriptionController.text;
        var price = widget.priceController.text; // Get price value

        // Store additional details from SellPage in a separate collection
        FirebaseFirestore.instance.collection('sellDetails').add({
          'modelName': modelName,
          'year': year,
          'transmission': transmission,
          'kilometersDriven': kilometersDriven,
          'numOfOwners': numOfOwners,
          'description': description,
          'price': price, // Store price value
          // Add more fields as needed
        }).then((value) {
          print('Sell details stored successfully');

          // Navigate to the homepage and remove all previous routes from the stack
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => homepage()),
            (route) => false,
          );
        }).catchError((error) {
          print('Failed to store sell details: $error');
        });
      }).catchError((error) {
        print('Failed to store image details: $error');
      });
    }
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
            _selectedImage != null
                ? Image.file(
                    _selectedImage!,
                    width: 200,
                    height: 200,
                  )
                : Icon(
                    Icons.image,
                    size: 100,
                    color: Colors.grey,
                  ),
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
