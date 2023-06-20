import 'package:akary/service/auth_service.dart';
import 'package:akary/view/home/home_screen_wrapper.dart';
import 'package:akary/view/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final RxBool _isValidate = false.obs;
  final RxBool _isLoading = false.obs;

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  _loginUser() async {
    String email = _usernameController.text.trim();
    String password = _passwordController.text.trim();
    String res = await AuthService.login(email: email, password: password);

    if (res != "success") {
      Fluttertoast.showToast(
          msg: res.split(']')[1].trim(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color.fromRGBO(35, 34, 34, 0.512),
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      final String role = await AuthService.getRole();
      Get.offAll(() => HomeScreenWrapper(role: role));
    }
    _isLoading.value = false;
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
              child: SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: SingleChildScrollView(
                    child: Obx(
                      () => Form(
                        autovalidateMode: _isValidate.value
                            ? AutovalidateMode.always
                            : AutovalidateMode.disabled,
                        key: _formKey,
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
                              TextFormField(
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  if (!value.isEmail) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  filled: true,
                                  label: const Text('Email',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  fillColor: Colors.grey[700],
                                ),
                                controller: _usernameController,
                              ),
                              const SizedBox(
                                height: 25,
                              ),
                              TextFormField(
                                style: const TextStyle(color: Colors.white),
                                validator: (value) => value!.isEmpty
                                    ? 'Password cannot be empty'
                                    : null,
                                obscureText: true,
                                decoration: InputDecoration(
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Colors.white, width: 1.0),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20)),
                                  filled: true,
                                  label: const Text('Password',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  fillColor: Colors.grey[700],
                                ),
                                controller: _passwordController,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text('Forgot password?')),
                              const SizedBox(height: 35),
                              Obx(
                                () => ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blueGrey[800],
                                      elevation: 3, //elevation of button
                                      shape: RoundedRectangleBorder(
                                          //to set border radius to button
                                          borderRadius:
                                              BorderRadius.circular(40)),
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 50,
                                          vertical:
                                              20) //content padding inside button
                                      ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _isValidate.value = false;
                                      _isLoading.value = true;
                                      _loginUser();
                                    } else {
                                      _isValidate.value = true;
                                    }
                                  },
                                  child: _isLoading.value
                                      ? const Center(
                                          child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 1,
                                          ),
                                        ))
                                      : const Center(
                                          child: Text(
                                            'Sign in',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w800),
                                          ),
                                        ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255)),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    SignUpScreen()));
                                      },
                                      child: const Text('Sign up'))
                                ],
                              )
                            ]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        )));
  }
}
