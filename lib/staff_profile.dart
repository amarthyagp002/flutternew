import 'package:akary/view/home/user/page/home_page.dart';
import 'package:akary/staff_home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class StaffProfile extends StatefulWidget {
  const StaffProfile({super.key});

  @override
  State<StaffProfile> createState() => _StaffProfileState();
}

class _StaffProfileState extends State<StaffProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Color.fromARGB(255, 255, 255, 255), // <-- SEE HERE
        ),
        title: Text("Staff"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
        child: ListView(
          children: <Widget>[
            nameTextField(),
            SizedBox(
              height: 8,
            ),
            PhonenumberTextField(),
            SizedBox(
              height: 8,
            ),
            AddressTextField(),
            SizedBox(
              height: 8,
            ),
            StateTextField(),
            SizedBox(
              height: 8,
            ),
            DistrictTextField(),
            SizedBox(
              height: 8,
            ),
            pincodeTextField(),
            SizedBox(
              height: 8,
            ),
            StafftypeTextField(),
            SizedBox(
              height: 8,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StaffHomePage()));
              },
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
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Color.fromARGB(255, 0, 0, 0),
          width: 2,
        )),
        prefixIcon: Icon(Icons.person, color: Colors.black),
        labelText: "Fullname",
      ),
    );
  }

  Widget PhonenumberTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.phone,
          color: Color.fromARGB(255, 35, 35, 35),
        ),
        labelText: "phone number",
      ),
    );
  }

  Widget AddressTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        prefixIcon: Icon(
          Icons.home,
          color: Colors.black,
        ),
        labelText: "Address",
      ),
    );
  }

  Widget StateTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        labelText: "State",
      ),
    );
  }

  Widget DistrictTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        labelText: "District",
      ),
    );
  }

  Widget pincodeTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        labelText: "pincode",
      ),
    );
  }

  Widget StafftypeTextField() {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
        )),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
          color: Colors.black,
          width: 2,
        )),
        labelText: "Stafftype",
      ),
    );
  }
}
