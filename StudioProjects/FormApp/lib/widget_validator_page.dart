import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Widget/text_form_field_widget.dart';

class MyHomePage4 extends StatefulWidget {
  const MyHomePage4({Key? key}) : super(key: key);

  @override
  State<MyHomePage4> createState() => _MyHomePage4State();
}

class _MyHomePage4State extends State<MyHomePage4> {
  final _formKey = GlobalKey<FormState>();
  bool isPassToggle = true;

  String? checkNameEmpty(String? nameContent) {
    if (nameContent == null || nameContent.isEmpty) {
      return 'Please enter your name';
    }
    bool isNameValid =
        RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
            .hasMatch(nameContent);
    if (!isNameValid) {
      return 'Invalid name input. Try again';
    }
    return null;
  }

  String? checkPhoneEmpty(String? phoneContent) {
    if (phoneContent == null || phoneContent.isEmpty) {
      return "enter your 10 digits phone no.";
    }
    if (phoneContent.length < 10) {
      return "please enter your correct phone no";
    }
    bool isPhoneNoValid =
        RegExp(r"^(\+\d{1,2}\s?)?\(?\d{3}\)?[\s.-]?\d{3}[\s.-]?\d{4}$")
            .hasMatch(phoneContent);
    if (!isPhoneNoValid) {
      return "please enter your valid phone no";
    }
    return null;
  }

  String? checkEmailEmpty(String? emailContent) {
    if (emailContent == null || emailContent.isEmpty) {
      return "please enter your mail id";
    }
    bool isEmailValid = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailContent);
    if (!isEmailValid) {
      return "Invalid email, try again";
    }
    return null;
  }

  String? checkPasswordEmpty(String? passwordContent) {
    if (passwordContent == null || passwordContent.isEmpty) {
      return "please enter your password";
    }
    if (passwordContent.length < 6) {
      return "password must be of at least 6 characters";
    }
    bool isValidPassword =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}')
            .hasMatch(passwordContent);
    if (!isValidPassword) {
      return "wrong password input";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Widget Validator"),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: Image.asset('assets/images/667377.png'),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextWidget(
                        onSaved: (name) {
                          debugPrint(name);
                        },
                        labelText: 'Name',
                        hintText: 'Your full name',
                        prefixIcon: const Icon(Icons.person),
                        keyboardType: TextInputType.name,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"))
                        ],
                        validator: checkNameEmpty),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextWidget(
                        onSaved: (phone) {
                          debugPrint(phone);
                        },
                        labelText: 'Phone No.',
                        hintText: 'Your phone no',
                        prefixIcon: const Icon(Icons.call),
                        keyboardType: TextInputType.number,
                        validator: checkPhoneEmpty),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextWidget(
                        onSaved: (email) {
                          debugPrint(email);
                        },
                        labelText: 'Email',
                        hintText: 'Your email id',
                        prefixIcon: const Icon(Icons.email),
                        keyboardType: TextInputType.emailAddress,
                        validator: checkEmailEmpty),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 300,
                    child: TextWidget(
                        onSaved: (password) {
                          debugPrint(password);
                        },
                        labelText: 'Password',
                        hintText: 'your password',
                        prefixIcon: const Icon(Icons.lock),
                        keyboardType: TextInputType.text,
                        inkwell: InkWell(
                          onTap: () {
                            //on calling setState only password text widget will rebuild remaining TextWidget will not rebuild
                            setState(() {
                              isPassToggle = !isPassToggle;
                            });
                          },
                          child: Icon(isPassToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        isObscureText: isPassToggle,
                        validator: checkPasswordEmpty),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          _formKey.currentState!.reset();
                          FocusScope.of(context).unfocus();
                        },
                        child: const Text('clear'),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState != null &&
                              _formKey.currentState!.validate()) {
                            _formKey.currentState!.save();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  'verified !',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                            // to remove focus from TextFormField,
                            FocusScope.of(context).unfocus();
                          }
                        },
                        child: const Text("Save"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
