//import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:image_picker/image_picker.dart';

class Sell_Data extends StatefulWidget {
  const Sell_Data({super.key});

  @override
  State<Sell_Data> createState() => _Sell_DataState();
}

class _Sell_DataState extends State<Sell_Data> {
  int? _value = 1;
  _getFromCamera() async {
    PickedFile? pickedFile = await ImagePicker().getImage(
        source: ImageSource.camera,
        maxWidth: 1800,
        maxHeight: 1800,
    );
    if (pickedFile != null) {
        File imageFile = File(pickedFile.path);
    }
}
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        const Text(
          'Enter the details',
          //textAlign: TextAlign.left,
          style: TextStyle(
              color: Colors.white, fontSize: 40, fontWeight: FontWeight.w500),
          textAlign: TextAlign.left,
        ),
        SizedBox(
          height: 45,
        ),
        const SizedBox(height: 45),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            filled: true,
            fillColor: const Color.fromARGB(255, 153, 146, 134),
            hintText: 'Owner Name',
          ),
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: new InputDecoration(
              labelText: 'Type the address',
              border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25)),
              filled: true,
              fillColor: const Color.fromARGB(255, 153, 146, 134),
              hintText: 'Type address'),

          minLines:
              6, // any number you need (It works as the rows for the textarea)
          keyboardType: TextInputType.multiline,
          maxLines: null,
        ),
        const SizedBox(height: 20),
        TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(50)),
            filled: true,
            fillColor: const Color.fromARGB(255, 153, 146, 134),
            hintText: 'Enter the vehicle number',
          ),
        ),
        
        Row(
          children: [
            Radio(
                value: 1,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
            SizedBox(
              width: 10,
            ),
            Text('car'),
            Radio(
                value: 2,
                groupValue: _value,
                onChanged: (value) {
                  setState(() {
                    _value = value;
                  });
                }),
            SizedBox(
              width: 10,
            ),
            Text('bike')
          ],
        ),
        FloatingActionButton(
          onPressed: _getFromCamera,
          tooltip: 'Increment',
          child: Icon(Icons.camera_alt_rounded),
        )
      ],
    )));
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
