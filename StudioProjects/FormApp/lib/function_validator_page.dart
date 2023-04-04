
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// stful widget that monitor user interaction
class MyHomePage3 extends StatefulWidget {
  const MyHomePage3({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage3> createState() => _MyHomePage3State();
}

class _MyHomePage3State extends State<MyHomePage3> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool passToggle = true;
  FilePickerResult? result;  // take file as a input

  Widget textFormField(
      {required TextEditingController controller,
        required labelText,
        String? hintText,
        required Icon prefixIcon,
        InkWell? inkWell,
        bool isObscuredText = false,
        required TextInputType keyboardType,
        List<TextInputFormatter>? inputFormatters,
        String? Function(String?)? validator}) {
    return SizedBox(
      width: 250,
      child: Column(
        children: [
          TextFormField(
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: labelText,
              hintText: hintText,
              prefixIcon: prefixIcon,
              suffixIcon: inkWell,
            ),
            obscureText: isObscuredText,
            keyboardType: keyboardType,
            inputFormatters: inputFormatters,
            validator: validator,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  String? checkNameEmpty(String? nameContent) {
    //this is a validator function having return type string and input argument is also string as well.
    if (nameContent == null || nameContent.isEmpty) {
      return "please enter some text";
    }
    if (nameContent.length < 4) {
      return "Invalid name";
    }
    bool isNameValid =
    RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
        .hasMatch(nameContent);
    if (!isNameValid) {
      return "No name fond!";
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
      return "password must be of  at least 6 characters";
    }
    bool isValidPassword =
    RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}')
        .hasMatch(passwordContent);
    if (!isValidPassword) {
      return "wrong password input";
    }
    return null;
  }

  bool isLoading = true;
  File? fileToDisplay; // File is class , to use this class, we need to import 'dart:io';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Validator as Function",
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 80,
                width: 80,
                child: Image.asset('assets/images/667377.png'),
              ),
              const SizedBox(
                height: 50,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    textFormField(
                        controller: nameController,
                        labelText: "Name",
                        hintText: "Type your name",
                        prefixIcon: const Icon(Icons.person),
                        keyboardType: TextInputType.text,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp(r"[a-zA-Z]+|\s"))
                        ],
                        validator: checkNameEmpty),
                    textFormField(
                        controller: phoneController,
                        labelText: "Phone No.",
                        hintText: "Enter Your phone no.",
                        prefixIcon: const Icon(Icons.phone),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r"[0-9]"))
                        ],
                        validator: checkPhoneEmpty),
                    textFormField(
                        controller: emailController,
                        labelText: "email",
                        hintText: "enter your mail id",
                        prefixIcon: const Icon(Icons.email),
                        keyboardType: TextInputType.text,
                        validator: checkEmailEmpty),
                    textFormField(
                        controller: passwordController,
                        labelText: "Password",
                        hintText: "enter password",
                        prefixIcon: const Icon(Icons.lock),
                        inkWell: InkWell(
                          onTap: () {
                            setState(() {
                              passToggle = !passToggle;
                            });
                          },
                          child: Icon(passToggle
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                        isObscuredText: passToggle,
                        keyboardType: TextInputType.text,
                        validator: checkPasswordEmpty),
                  ],
                ),
              ),
              if (result != null)
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Selected file : ',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        itemCount: result?.files.length ?? 0,
                        itemBuilder: (context, ind) {
                          return Text(
                            result?.files[ind].name ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int ind) {
                          return const SizedBox(
                            height: 10,
                          );
                        },
                      ),
                    ],
                  ),
                ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Resume',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Times New Roman',
                    ),
                  ),
                  IconButton(
                    color: Colors.green,
                    onPressed: () async {
                      result = await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['jpg', 'pdf', 'docx'],
                          allowMultiple: true);
                      if (result == null) {
                        debugPrint('No file selected');
                      } else {
                        setState(() {});
                        for (var element in result!.files) {
                          debugPrint(element.name);
                          debugPrint(element.size.toString());
                          debugPrint(element.path);
                          debugPrint(element.extension);
                        }
                      }
                    },
                    icon: const Icon(Icons.file_upload),
                  ),
                ],
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
                  child: const Text("save")),
            ],
          ),
        ),
      ),
    );
  }
}
