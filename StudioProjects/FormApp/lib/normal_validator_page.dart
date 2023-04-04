import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyHomePage2 extends StatefulWidget {
  const MyHomePage2({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage2> createState() => _MyHomePage2State();
}

class _MyHomePage2State extends State<MyHomePage2> {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String myText = ""; // declare for concept of onChanged
  String myPhone = ""; //declare for concept of onSaved

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: SizedBox(
                  width: 300,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        "Basic Form",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w100,
                          fontFamily: 'Times New Roman',
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      TextFormField(
                        controller: nameController,
                        decoration: const InputDecoration(
                          labelText: "Name",
                          hintText: "enter your name",
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"))
                        ],
                        onChanged: (String str) {
                          setState(() {
                            myText = str;
                          });
                        },
                        validator: (name) {
                          if (name == null || name.isEmpty) {
                            return "Please enter your name";
                          }
                          if (name.length < 4) {
                            return "Name must be at least 4 character";
                          }
                          bool isValidName = RegExp(
                                  r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                              .hasMatch(name);
                          if (!isValidName) {
                            return "Please enter your correct name";
                          }
                          return null;
                        },
                      ),
                      Text(myText),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          labelText: "Phone no.",
                          hintText: "enter your Mobile number",
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r"[0-9]")),
                        ],
                        onFieldSubmitted: (String str) {
                          setState(() {
                            myPhone = "+91-$str";
                          });
                        },
                        validator: (phone) {
                          if (phone == null || phone.isEmpty) {
                            return "Please enter your 10 digit Mobile no..";
                          }
                          if (phone.length < 8) {
                            return "Phone no must be of atLeast 10 digits";
                          }
                          bool isValidPhone = RegExp(
                                  r"^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$")
                              .hasMatch(phone);
                          if (!isValidPhone) {
                            return "Please enter your Valid phone no";
                          }
                          return null;
                        },
                      ),
                      Text(
                        myPhone,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.green),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          labelText: "Email",
                          hintText: "enter your mail id",
                          // border: OutlineInputBorder(),
                        ),
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return "Please Enter Some text";
                          }
                          bool emailValid =
                              RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(email);
                          if (!emailValid) {
                            // if emailValid is not true OR input Text is not similar to the required text.
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: passwordController,
                        obscureText: true, // to write password in dot
                        decoration: const InputDecoration(
                          labelText: "Password",
                          hintText: "enter your password",
                        ),
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return "Enter Password";
                          }
                          if (password.length < 6) {
                            return "Password must be atleast 6 characters";
                          }
                          bool isValidPassword = RegExp(
                                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}')
                              .hasMatch(password); // Regexp for password
                          if (!isValidPassword) {
                            return "Please Enter valid password";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            debugPrint(nameController.text);
                            debugPrint(phoneController.text);
                            debugPrint(emailController.text);
                            debugPrint(passwordController.text);
                            FocusScope.of(context).unfocus();
                          }
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
