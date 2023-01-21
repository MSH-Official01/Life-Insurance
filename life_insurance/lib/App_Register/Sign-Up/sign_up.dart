import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../LogIn/log_in.dart';
import '../OTP/otp.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController userName = TextEditingController();

  final TextEditingController password_ = TextEditingController();
  final TextEditingController email_ = TextEditingController();
  final TextEditingController phone_ = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _showPassword = false;
  bool value = false;
  bool islogin = false;
  bool issave = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 2, 77, 138),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // leading: ,
        title: Text(
          "Metropolitan",
          style: TextStyle(
              color: Color(0xff000000),
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "JejuHallasan"),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: size.height * 0.14,
                  width: double.infinity,
                  color: Color.fromARGB(255, 2, 77, 138),
                ),
                Positioned(
                  left: 200,
                  bottom: 0,
                  child: CircleAvatar(
                      radius: 200,
                      backgroundColor: Color.fromARGB(255, 26, 114, 186)),
                ),
              ],
            ),
            Container(
              height: size.height,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(12),
                      topRight: Radius.circular(12))),
              child: Column(
                children: [
                  SizedBox(height: size.height * 0.030),
                  Text(
                    "        Log-in to your\n Metropolitan Account",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.kanit().fontFamily),
                  ),
                  SizedBox(
                    height: size.height * 0.020,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 12, right: 12),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: userName,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffFFFFFFF),
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.all(s
                                //         Radius.circular(9))),
                                labelText: 'Username',
                              ),
                              validator: (value) => value!.isEmpty
                                  ? "Field Can't be empty"
                                  : null,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                            child: TextFormField(
                              controller: password_,
                              obscureText: !_showPassword,
                              validator: (value) => value!.isEmpty
                                  ? "Field Can't be empty"
                                  : null,
                              decoration: InputDecoration(
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _showPassword = !_showPassword;
                                    });
                                  },
                                  child: Icon(_showPassword
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                ),
                                filled: true,
                                fillColor: Color(0xffFFFFFFF),
                                // border: OutlineInputBorder(
                                //     borderRadius:
                                //         BorderRadius.all(Radius.circular(9))),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: email_,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffFFFFFFF),
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.all(s
                                //         Radius.circular(9))),
                                labelText: 'Email',
                              ),
                              validator: (value) => value!.isEmpty
                                  ? "Field Can't be empty"
                                  : null,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            child: TextFormField(
                              controller: phone_,
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xffFFFFFFF),
                                // border: OutlineInputBorder(
                                //     borderRadius: BorderRadius.all(s
                                //         Radius.circular(9))),
                                labelText: 'Phone number',
                              ),
                              validator: (value) => value!.isEmpty
                                  ? "Field Can't be empty"
                                  : null,
                            ),
                          ),
                          SizedBox(
                            height: size.height * 0.020,
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.01,
                  // ),
                  islogin == false
                      ? InkWell(
                          onTap: () {
                            // if (_formKey.currentState!.validate()) {
                            //   setState(() {
                            //     islogin = true;
                            //   });
                            //   login(email_.text, password_.text);
                            // }

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => OtpPage()));
                          },
                          child: Container(
                            width: size.width * 0.85,
                            height: size.height * 0.070,
                            decoration: BoxDecoration(
                                color: Color(0xff006590),
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                "REGISTER",
                                style: TextStyle(
                                    fontFamily: GoogleFonts.akshar().fontFamily,
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        )
                      : SpinKitThreeInOut(
                          color: Colors.black,
                          size: 20,
                        ),
                  SizedBox(
                    height: size.height * 0.01,
                  ),
                  Text(
                    "By Proceeding, you are accepting the",
                    style: TextStyle(
                        fontFamily: GoogleFonts.kanit().fontFamily,
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: Colors.black),
                  ),
                  Text(
                    "End User License Agreement",
                    style: TextStyle(
                        fontFamily: GoogleFonts.kanit().fontFamily,
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color(0xff006590)),
                  ),
                  // SizedBox(
                  //   height: size.height * 0.01,
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already Registered?",
                        style: TextStyle(
                            fontFamily: GoogleFonts.kanit().fontFamily,
                            fontSize: 19,
                            fontWeight: FontWeight.normal,
                            color: Colors.black),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LogInPage()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontFamily: GoogleFonts.kanit().fontFamily,
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff006590)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
