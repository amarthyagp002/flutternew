import 'package:akary/signup_page.dart';
import 'package:akary/login_page.dart';
import 'package:flutter/material.dart';

class homepage extends StatefulWidget {
  homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  List<String> _dataList = [];
  List<String> _searchResult = [];

  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          shadowColor: Colors.black,
          foregroundColor: Colors.black,
          title: TextField(
            controller: _searchController,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              hintText: '  Search cars',
            ),
            onChanged: onSearchTextChanged,
          ),
          backgroundColor: Color.fromARGB(255, 15, 127, 101)),
      drawer: Drawer(
        backgroundColor: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration:
                  BoxDecoration(color: Color.fromARGB(255, 15, 127, 101)),
              accountName: Text('Mathew paul'),
              accountEmail: Text('matts@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  'MP',
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
                // TODO: NavigNavigator.pop(context); // close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => homepage()),
                );
              },
            ),
            // ListTile(
            //     leading: Icon(Icons.person),
            //     title: Text('Profile'),
            //     onTap: () {
            //       Navigator.push;
            //       {
            //         // TODO: Logout tNavigator.pop(context); // close the drawer
            //         // Navigator.push(
            //         //   context,
            //         //   MaterialPageRoute(builder: (context) => LoginScreen()),
            //         // );
            //       }
            //       ;
            //     }),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text('Logout'),
              onTap: () {
                // TODO: Logout tNavigator.pop(context); // close the drawer
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Loginpage()),
                );
              },
            ),
          ],
        ),
      ),
      body: _searchResult.length != 0 || _searchController.text.isNotEmpty
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

  UserBox({required this.name, required this.email, required this.phone});

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
