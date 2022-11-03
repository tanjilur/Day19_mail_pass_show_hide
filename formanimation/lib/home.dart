import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  TextEditingController _formpasscontroller = TextEditingController();
  TextEditingController _femail = TextEditingController();
  GlobalKey<FormState> _formerjonnoKey = GlobalKey();
  bool _obsecure = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[200],
      body: Padding(
        padding: EdgeInsets.all(13),
        child: Container(
          width: double.infinity,
          child: Form(
            key: _formerjonnoKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: _femail,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Put your mail here",
                    hintStyle: TextStyle(color: Colors.pink),
                    labelText: "write Your mail",
                    fillColor: Colors.white,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red)),
                    // suffixIcon: Icon(Icons.mail),
                    prefixIcon: Icon(Icons.mail),
                    suffix: Icon(Icons.mail),
                    // prefix: Icon(Icons.email),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: _formpasscontroller,
                  keyboardType: TextInputType.emailAddress,
                  obscureText: _obsecure,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Enter Your Password";
                    }
                    if (value.length > 8) {
                      return "Password is too long";
                    }
                    if (value.length < 3) {
                      return "Password is too short";
                    }
                  },
                  decoration: InputDecoration(
                      hintText: "Put your Password here",
                      hintStyle: TextStyle(color: Colors.pink),
                      labelText: "write ****",
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      // suffixIcon: Icon(Icons.mail),
                      prefixIcon: Icon(Icons.password),
                      suffix: IconButton(
                          onPressed: () {
                            setState(() {
                              _obsecure = !_obsecure;
                            });
                          },
                          icon: Icon(_obsecure
                              ? Icons.visibility
                              : Icons.visibility_off))
                      // prefix: Icon(Icons.email),
                      ),
                ),
                InkWell(
                  onTap: () {
                    if (_formerjonnoKey.currentState!.validate()) {
                      print("Its Okay.......");
                    } else {
                      print("Something Is wrong");
                    }
                  },
                  child: Container(
                    color: Colors.black,
                    margin: EdgeInsets.only(top: 5),
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 20,
                          backgroundColor: Colors.black,
                          color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
