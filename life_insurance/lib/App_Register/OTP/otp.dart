import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Fetures/Main_Home/view/home_screen.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController codeController = TextEditingController();
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
                  SizedBox(height: size.height * 0.1),
                  Text(
                    "OTP Verification",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: GoogleFonts.kanit().fontFamily),
                  ),
                  SizedBox(height: size.height * 0.1),
                  Padding(
                    padding: EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 55,
                          width: 55,
                          // padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: codeController,
                            // onChanged: (value) {
                            //   if (value.length == 1) {
                            //     FocusScope.of(context).nextFocus();
                            //   }
                            // },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.headline6,
                            validator: (value) {
                              if (!RegExp(r"[\d]{4}").hasMatch(value!)) {
                                return "Please provide a valid OTP";
                              }
                              return null;
                            },
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff94D8FF),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              labelText: '',
                            ),
                          ),
                        ),
                        Container(
                          height: 55,
                          width: 55,
                          // padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: codeController,
                            // onChanged: (value) {
                            //   if (value.length == 1) {
                            //     FocusScope.of(context).nextFocus();
                            //   }
                            // },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (!RegExp(r"[\d]{4}").hasMatch(value!)) {
                                return "Please provide a valid OTP";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff94D8FF),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              labelText: '',
                            ),
                          ),
                        ),
                        Container(
                          height: 55,
                          width: 55,
                          // padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: codeController,
                            // onChanged: (value) {
                            //   if (value.length == 1) {
                            //     FocusScope.of(context).nextFocus();
                            //   }
                            // },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (!RegExp(r"[\d]{4}").hasMatch(value!)) {
                                return "Please provide a valid OTP";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff94D8FF),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              labelText: '',
                            ),
                          ),
                        ),
                        Container(
                          height: 55,
                          width: 55,
                          // padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: codeController,
                            onChanged: (value) {
                              if (value.length == 1) {
                                FocusScope.of(context).nextFocus();
                              }
                            },
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            validator: (value) {
                              if (!RegExp(r"[\d]{4}").hasMatch(value!)) {
                                return "Please provide a valid OTP";
                              }
                              return null;
                            },
                            keyboardType: TextInputType.number,
                            style: Theme.of(context).textTheme.headline6,
                            textAlign: TextAlign.center,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xff94D8FF),
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30))),
                              labelText: '',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.050,
                  ),
                  InkWell(
                    onTap: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   otpconfirm(
                      //     codeController.text,
                      //   );
                      // } else {}
                      // print(widget.email);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    child: Container(
                      width: size.width * 0.80,
                      height: size.height * 0.070,
                      decoration: BoxDecoration(
                          color: Color(0xff31B2FB),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Text(
                          "SUBMIT",
                          style: TextStyle(
                              fontFamily: GoogleFonts.workSans().fontFamily,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.040,
                  ),
                  InkWell(
                    onTap: () async {
                      // if (_formKey.currentState!.validate()) {
                      //   otpconfirm(
                      //     codeController.text,
                      //   );
                      // } else {}
                      // print(widget.email);
                    },
                    child: Center(
                      child: Text(
                        "Resend OTP",
                        style: TextStyle(
                            fontFamily: GoogleFonts.workSans().fontFamily,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Color(0xff006590)),
                      ),
                    ),
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
