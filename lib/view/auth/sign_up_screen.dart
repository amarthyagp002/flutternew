import 'package:akary/view/home/home_screen_wrapper.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:akary/view/auth/sign_in_screen.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../service/auth_service.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final RxnString _role = RxnString();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final RxBool _isValidate = false.obs;
  final RxBool _isLoading = false.obs;

  _signUpUser() async {
    String? role = _role.value;
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    String name = _nameController.text.trim();
    String res = await AuthService.signup(
        email: email,
        password: password,
        name: name,
        role: role,
        value: _role.value == "STAFF" ? 0 : 1);

    if (res != "success") {
      _isLoading.value = false;
      Fluttertoast.showToast(
          msg: res.split(']')[1].trim(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: const Color.fromRGBO(35, 34, 34, 0.512),
          textColor: Colors.white,
          fontSize: 16.0);
      if (kDebugMode) {
        print(res);
      }
      return;
    } else {
      final String role = await AuthService.getRole();
      Get.offAll(() => HomeScreenWrapper(role: role));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 60),
              Padding(
                  padding: const EdgeInsets.all(40),
                  child: Obx(
                    () => Form(
                      key: _formKey,
                      autovalidateMode: _isValidate.value
                          ? AutovalidateMode.always
                          : AutovalidateMode.disabled,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const SizedBox(height: 20),
                            const Center(
                              child: Text(
                                'Create Account ',
                                //textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 45),
                            TextFormField(
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Name cannot be empty';
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
                                label: const Text('Name',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                fillColor: Colors.grey[700],
                              ),
                              controller: _nameController,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Email cannot be empty';
                                }
                                if (!value.isEmail) {
                                  return 'Invalid email';
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
                              controller: _emailController,
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              keyboardType: TextInputType.visiblePassword,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Password cannot be empty';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
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
                                label: const Text('Password',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500)),
                                fillColor: Colors.grey[700],
                              ),
                              obscureText: true,
                              controller: _passwordController,
                            ),
                            const SizedBox(height: 20),
                            //role dropdown
                            Obx(
                              () => DropdownButtonFormField(
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
                                  label: const Text('Role',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500)),
                                  fillColor: Colors.grey[700],
                                ),
                                dropdownColor: Colors.grey[700],
                                value: _role.value,
                                items: const [
                                  DropdownMenuItem(
                                      value: 'USER',
                                      child: Text(
                                        'User',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  DropdownMenuItem(
                                      value: 'STAFF',
                                      child: Text(
                                        'Staff',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ],
                                onChanged: (value) {
                                  _role.value = value.toString();
                                },
                                validator: (value) {
                                  if (value == null) {
                                    return 'Please select a role';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(height: 43),
                            Obx(
                              () => _isLoading.value
                                  ? const Center(
                                      child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 1,
                                      ),
                                    ))
                                  : ElevatedButton(
                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _isValidate.value = false;
                                          _isLoading.value = true;
                                          _signUpUser();
                                        } else {
                                          _isValidate.value = true;
                                        }
                                      },
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
                                      child: const Center(
                                        child: Text(
                                          'Sign Up',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Already have a account?',
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignInScreen()));
                                    },
                                    child: const Text('Login'))
                              ],
                            )
                          ]),
                    ),
                  ))
            ],
          ),
        )));
  }
}
