import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'signup.dart';
import '../first_home.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        // appBar: AppBar(),
        body: SafeArea(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
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
                                labelText: 'User_name',
                            filled: true,
                            fillColor: const Color.fromARGB(255, 153, 146, 134),
                            hintText: 'User_name',
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(50)),
                                labelText: 'Password',
                            filled: true,
                            fillColor: const Color.fromARGB(255, 153, 146, 134),
                            hintText: 'Password',
                          ),
                          
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text('Forgot password?')),
                        const SizedBox(height: 35),
                        Center(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color.fromARGB(255, 153,
                                    146, 134), //background color of button
                                //side: BorderSide(width:3, color:Colors.brown), //border width and color
                                elevation: 3, //elevation of button
                                shape: RoundedRectangleBorder(
                                    //to set border radius to button
                                    borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.all(
                                    20) //content padding inside button
                                ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const First_Home()));
                              ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 242, 71, 71));
                            },
                            child: const Text('Login'),
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
                                          builder: (context) =>
                                              const SignUp()));
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
          ],
        )));
  }
}
