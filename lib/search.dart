import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {


   @override
    void initState() {
    // TODO: implement initState
    super.initState();
    getmonuments();
  }
  final searchController = TextEditingController();
  List<String> filteredMonuments = [];
  List<String> monum = [];
  void filterMonuments(String searchQuery) {
    searchQuery = searchQuery.toLowerCase();
    setState(() {
      filteredMonuments =
          monum.where((mo) => mo.toLowerCase().contains(searchQuery)).toList();
    });
  }

  getmonuments() async {
    print("hello");
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('staff').doc('ZORJDKCdPCgR23QIDx2DSEGWokG2').collection('items').get();
    print(querySnapshot.docs.length);
    List<DocumentSnapshot> documents = querySnapshot.docs;
    // List<String>monum=[];
    print('helo');
    for (var document in documents) {
      String data = (document.data() as Map<String, dynamic>)['part-name'];
      monum.add(data);
      print('hello');
      print(data);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Select monument'),
        backgroundColor: Colors.black
      ),
      body: SafeArea(child: Column(children: [TextField(controller: searchController,
                onChanged: (value) => filterMonuments(value),
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      searchController.text="";
                    });
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),Expanded(
              child:ListView.builder(
              itemCount: filteredMonuments.length,
              itemBuilder: (context, index) {
                final vehicle = filteredMonuments[index];
                return ListTile(
                  title: Text(vehicle),
                  onTap: () => setState(() {
                    searchController.text = vehicle;
                  }),
                );
              },
            ),
          )],)),
    );
  }
}