import 'package:flutter/material.dart';
import 'package:information_app/controller/information_control.dart';
import 'package:information_app/models/information.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final _formkey = GlobalKey<FormState>();
  late final TextEditingController _nameController,
      _surnameController,
      _nicknameController,
      _cardIDController,
      _emailController,
      _phoneNumController;

  @override
  void initState() {
    _nameController = TextEditingController();
    _surnameController = TextEditingController();
    _nicknameController = TextEditingController();
    _cardIDController = TextEditingController();
    _emailController = TextEditingController();
    _phoneNumController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _nicknameController.dispose();
    _cardIDController.dispose();
    _emailController.dispose();
    _phoneNumController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new information.'),
        centerTitle: true,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: "Enter name"),
              validator: (String? value) {
                if (value == null) {
                  return "Please fill this field.";
                }
              },
            ),
            TextFormField(
              controller: _surnameController,
              decoration: const InputDecoration(hintText: "Enter surname"),
              validator: (String? value) {
                if (value == null) {
                  return "Please fill this field.";
                }
              },
            ),
            TextFormField(
              controller: _nicknameController,
              decoration: const InputDecoration(hintText: "Enter nickname"),
              validator: (String? value) {
                if (value == null) {
                  return "Please fill this field.";
                }
              },
            ),
            TextFormField(
              controller: _cardIDController,
              decoration:
                  const InputDecoration(hintText: "Enter ID card number"),
              validator: (String? value) {
                if (value == null) {
                  return "Please fill this field.";
                } else if (value.length != 13) {
                  return "ID card number must have 13 digits.";
                }
              },
            ),
            TextFormField(
              controller: _emailController,
              decoration: const InputDecoration(hintText: "Enter email"),
              validator: (String? value) {
                if (value == null) {
                  return "Please fill this field.";
                } else if (!validateEmail(value)) {
                  return "Incorrect email format.";
                }
              },
            ),
            TextFormField(
              controller: _phoneNumController,
              decoration: const InputDecoration(hintText: "Enter phone number"),
              validator: (String? value) {
                if (value == null) {
                  return "Please fill this field.";
                } else if (!validatePhoneNumber(value)) {
                  return "Incorrect phone number format.";
                }
              },
            ),
            TextButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    final information = Information(
                        name: _nameController.text,
                        surname: _surnameController.text,
                        nickname: _nicknameController.text,
                        cardID: _cardIDController.text,
                        email: _emailController.text,
                        phoneNum: _phoneNumController.text);
                    Information_Control().add(info: information);
                    Navigator.of(context).pop();
                  }
                },
                child: const Text('Add'))
          ],
        ),
      ),
    );
  }

  bool validateEmail(String input) {
    RegExp email = RegExp(r'[a-z0-9]+@[a-z]+\.[a-z]{2,3}');
    if (email.hasMatch(input)) {
      return true;
    }
    return false;
  }

  bool validatePhoneNumber(String input) {
    RegExp phone = RegExp(r'0+\d{9}');
    if (phone.hasMatch(input)) {
      return true;
    }
    return false;
  }
}
