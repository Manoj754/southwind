import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:southwind/UI/components/common_button.dart';
import 'package:southwind/UI/theme/apptheme.dart';
import 'package:southwind/data/providers/providers.dart';
import 'package:southwind/utils/helpers.dart';
import 'package:southwind/utils/validator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Log_In extends StatefulWidget {
  @override
  _Log_InState createState() => _Log_InState();
}

class _Log_InState extends State<Log_In> {
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();
  TextEditingController _forgotPasswordcontroller = TextEditingController();
  String password = "";
  String passworderror = "";
  bool hidepassword = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15),
        child: Align(
          alignment: Alignment(0, -.2),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.transparent, shape: BoxShape.circle),
                  child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Image.asset(
                        "assets/images/southwind_logo_single.png",
                      )),
                ),
                Text(
                  "Southwind",
                  style: (TextStyle(
                      letterSpacing: 1,
                      fontSize: 30,
                      fontWeight: FontWeight.w500)),
                ),
                SizedBox(
                  height: 25,
                ),
                EditTextfild(
                  hint: "Email",
                  controller: _emailcontroller,
                  prefixicon: const Icon(
                    Icons.person,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                EditTextfild(
                  controller: _passwordcontroller,
                  validator: (val) {
                    if (val!.isEmpty || val == "" || val == " ") {
                      return "Plases Enter Password";
                    }
                  },
                  hint: "Password",
                  onsaved: password,
                  prefixicon: Icon(
                    Icons.lock_outlined,
                    color: Colors.grey,
                  ),
                  suffixicon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidepassword = !hidepassword;
                      });
                    },
                    icon: Icon(
                      hidepassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                  passwordshow: hidepassword,
                ),
                SizedBox(
                  height: 15,
                ),
                CommonButton(
                  bgColor: primarySwatch.shade900,
                  lable: "Login",
                  textStyle: TextStyle(
                      letterSpacing: 0.5,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  ontap: _loginMethod,
                ),
                SizedBox(
                  height: 15,
                ),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Forgot Password?"),
                        content: EditTextfild(
                          controller: _forgotPasswordcontroller,
                          hint: "Enter your email",
                        ),
                        actions: <Widget>[
                          Row(
                            children: [
                              CommonButton(
                                ontap: () {
                                  Navigator.of(context).pop();
                                },
                                bgColor: primarySwatch.shade900,
                                lable: "Cancel",
                                isExpanded: true,
                                textStyle: TextStyle(
                                    letterSpacing: 0.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              CommonButton(
                                ontap: () {
                                  Navigator.of(context).pop();
                                },
                                bgColor: primarySwatch.shade900,
                                isExpanded: true,
                                lable: "Reset",
                                textStyle: TextStyle(
                                    letterSpacing: 0.5,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    );
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                        letterSpacing: 0.5),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _loginMethod() {
    // _emailcontroller.text = "y@y.com";
    // _passwordcontroller.text = "1234567";
    if (_emailcontroller.text.isEmpty) {
      showToast("Enter Email");
      return;
    }
    if (!emailValidator(_emailcontroller.text)) {
      showToast("Invalid Email");
      return;
    }
    if (_passwordcontroller.text.isEmpty) {
      showToast("Enter Password");
      return;
    }
    context
        .read(authProvider)
        .login(_emailcontroller.text, _passwordcontroller.text);
  }
}

class EditTextfild extends StatelessWidget {
  final TextEditingController controller;
  // late String? validator;
  late String? hint;
  late Icon? prefixicon;
  late Widget? suffixicon;
  late int? number;
  late Widget? suffix;
  late String? onsaved;
  late bool passwordshow;
  late TextInputType? keybordtype;
  late String? Function(String?)? validator;

  EditTextfild(
      {Key? key,
      required this.controller,
      this.validator,
      this.hint,
      this.prefixicon,
      this.suffix,
      this.passwordshow = true,
      this.onsaved,
      this.keybordtype,
      this.number,
      this.suffixicon})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: !passwordshow,
      cursorColor: Colors.grey,
      inputFormatters: [
        LengthLimitingTextInputFormatter(number),
      ],
      keyboardType: keybordtype,
      validator: validator,
      onSaved: (val) {
        onsaved = val;
      },
      decoration: InputDecoration(
        hintStyle: TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w500),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey, width: 1.5)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Colors.grey)),
        hintText: hint,
        prefixIcon: prefixicon,
        suffixIcon: suffixicon,
        suffix: suffix,
      ),
    );
  }
}
