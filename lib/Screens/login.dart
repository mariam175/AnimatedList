import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:register/Screens/animatedList.dart';
import 'package:register/Screens/register.dart';
import 'package:register/sharedComponent/input.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> form = GlobalKey<FormState>();
  final emailcontroll = TextEditingController();
    final passcontroll = TextEditingController();
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
                "LogIn",
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
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
            child: Form(
              key: form,
              child: Column(
                children: [
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
                      }),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  TextFormField(
                    //controller: passcontroll,
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
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => const Register()));
            },
            // ignore: sort_child_properties_last
            child: const Text("Register"),
            style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 120)),
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
