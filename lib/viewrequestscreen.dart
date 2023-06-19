import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class viewrequest extends StatefulWidget {
  String uid;
  viewrequest({super.key, required this.uid});

  @override
  State<viewrequest> createState() => _viewrequestState();
}

class _viewrequestState extends State<viewrequest> {
  @override
  void initState() {
    getselldetails(widget.uid);
    // TODO: implement initState
    super.initState();
  }

  String transmission = "";
  String description = "";
  String model = "";
  getselldetails(String uid) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('staff')
        .doc('ZORJDKCdPCgR23QIDx2DSEGWokG2')
        .collection('sellcars')
        .where('uid', isEqualTo: uid)
        .get();
    print(querySnapshot.docs[0].id);
    print('hello');
    DocumentSnapshot snap = await FirebaseFirestore.instance
        .collection('staff')
        .doc('ZORJDKCdPCgR23QIDx2DSEGWokG2')
        .collection('sellcars')
        .doc(querySnapshot.docs[0].id)
        .get();
    model = (snap.data() as Map<String, dynamic>)['model name'];
    description = (snap.data() as Map<String, dynamic>)['description'];
    transmission = (snap.data() as Map<String, dynamic>)['transmission'];
    // company = (snap.data() as Map<String, dynamic>)['company'];
    // image = (snap.data() as Map<String, dynamic>)['image'];

    setState(() {});
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Container(
            height: 300,
            child: Column(
              children: [Text(description), Text(model), Text(transmission)],
            ),
          )
        ],
      )),
    );
  }
}
