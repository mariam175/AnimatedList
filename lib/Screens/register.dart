import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:register/Screens/animatedList.dart';
import 'package:register/Screens/login.dart';
import 'package:register/sharedComponent/input.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  final emailcontroll = TextEditingController();
  final passcontroll = TextEditingController();
  final conpasscontroll = TextEditingController();
  final namecontroll = TextEditingController();
  final phonecontroll = TextEditingController();
  bool passwordVisible = false;
  bool conPasswordVisible = false;
  @override
  void initState() {
    super.initState();
    //GlobalKey<FormState> form = GlobalKey<FormState>();
    passwordVisible = false;
    conPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(flip: true),
            child: Container(
              //margin: const EdgeInsets.only(bottom: 25),
              alignment: Alignment.center,
              height: height * 0.4,
              // ignore: sort_child_properties_last
              child: const Text(
                "Register",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
              decoration: const BoxDecoration(
                color: Colors.deepPurple,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: Form(
              key: form,
              child: Column(
                children: [
                  TextInput(
                      control: namecontroll,
                      label: 'UserName',
                      icon: Icons.person,
                      keyboardtype: TextInputType.name,
                      valid: (text) {
                        if (text!.isEmpty) return "can not be empty";
                        return null;
                      }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextInput(
                    control: emailcontroll,
                    label: 'Email',
                    icon: Icons.email,
                    keyboardtype: TextInputType.emailAddress,
                    valid: (text) {
                        if (text!.isEmpty) {
                          return "can not be empty";
                        } else if (text.contains('@') == false ||
                            text.contains('.') == false) {
                          return "please, enter valid email";
                        }
                          return null;
                      }
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    controller: passcontroll,
                    obscureText: !passwordVisible,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text("password"),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              passwordVisible = !passwordVisible;
                            },
                          );
                        },
                      ),
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "can not be empty";
                      } else if (text.length < 8) {
                        return "enter password contains at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    controller: conpasscontroll,
                    obscureText: !conPasswordVisible,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      label: const Text("Confirm Password"),
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(conPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off),
                        onPressed: () {
                          setState(
                            () {
                              conPasswordVisible = !conPasswordVisible;
                            },
                          );
                        },
                      ),
                    ),
                    validator: (text) {
                      if (text!.isEmpty) {
                        return "can not be empty";
                      } else if (text.length < 8) {
                        return "enter password contains at least 8 characters";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextInput(
                    control: phonecontroll,
                    label: 'Phone',
                    icon: Icons.phone,
                    keyboardtype: TextInputType.number,
                    valid: (text) {
                        if (text!.isEmpty) return "can not be empty";
                        return null;
                      }
                  ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              var da = form.currentState;
              if(da!.validate()){
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const List()));
              }
            },
            // ignore: sort_child_properties_last
            child: const Text("Register"),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 120)),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Login()));
            },
            // ignore: sort_child_properties_last
            child: const Text(
              "Log In",
              style: TextStyle(color: Colors.deepPurple),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 130),
              // ignore: deprecated_member_use
              primary: Colors.white,
            ),
          ),
        ],
      ),
    ));
  }
}
