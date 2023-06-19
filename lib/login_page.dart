import 'package:akary/auth_services.dart';
import 'package:akary/bottomnav.dart';
import 'package:akary/home_page.dart';
//import 'package:akary/front_end_o/splash_screen.dart';
import 'package:akary/staff_profile.dart';
import 'package:flutter/material.dart';
import 'signup_page.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final _usernameController = TextEditingController();

  final _passwordController = TextEditingController();

  bool _isloading = false;

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
  }

  _loginUser() async {
    String email = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    final role = await AuthServices.login(email: email, password: password);

    if (role != "USER"&&role!="STAFF") {
      Fluttertoast.showToast(
          msg: "Password is incorrect",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color.fromRGBO(35, 34, 34, 0.512),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Bottomnav()));
    }
    // if (role != "USER"&&role!="STAFF") {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     content: Text(
    //       'Invalid Username or Password',
    //       //style: GoogleFonts.raleway(fontSize: 15, fontWeight: FontWeight.w600),
    //     ),
    //     backgroundColor: Colors.red,
    //     duration: const Duration(seconds: 3),
    //   ));
    //   return;
    // }
      Widget? page;
      switch(role.toUpperCase())
      {
        
        case 'USER':
        page= Bottomnav();
        break;
        case 'STAFF':
        page= const StaffProfile();
        break;
        default:
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(role)));

      }
      if(page!=null)
      {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (ctx2)=>page!));
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        // appBar: AppBar(),
        body: SafeArea(
            child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Hello,',
                              //textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 60,
                                  fontWeight: FontWeight.w500)),
                          const Text(
                            'Welcome Back',
                            //textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(height: 25),
                          //     const Text('Back',
                          // //textAlign: TextAlign.left,
                          // style: TextStyle(
                          //     color: Colors.white,
                          //     fontSize: 60,
                          //     fontWeight: FontWeight.w500)),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 153, 146, 134),
                              hintText: 'User_name',
                            ),
                            controller: _usernameController,
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              filled: true,
                              fillColor:
                                  const Color.fromARGB(255, 153, 146, 134),
                              hintText: 'Password',
                            ),
                            controller: _passwordController,
                          ),
                          TextButton(
                              onPressed: () {},
                              child: const Text('Forgot password?')),
                          const SizedBox(height: 35),
                          Center(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color.fromARGB(
                                      255,
                                      153,
                                      146,
                                      134), //background color of button
                                  //side: BorderSide(width:3, color:Colors.brown), //border width and color
                                  elevation: 3, //elevation of button
                                  shape: RoundedRectangleBorder(
                                      //to set border radius to button
                                      borderRadius: BorderRadius.circular(30)),
                                  padding: const EdgeInsets.all(
                                      20) //content padding inside button
                                  ),
                              onPressed: () {
                                _loginUser();
                              },
                              child: _isloading
                                  ? Center(child: CircularProgressIndicator())
                                  : Center(
                                      child: Text("Login"),
                                    ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'Does not have an account?',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => SignUp()));
                                    ElevatedButton.styleFrom(
                                        backgroundColor: const Color.fromARGB(
                                            255, 242, 71, 71));
                                  },
                                  child: const Text('Sign up'))
                            ],
                          )
                        ]),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
