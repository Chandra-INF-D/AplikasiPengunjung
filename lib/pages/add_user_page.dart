import 'package:flutter/material.dart';
import 'package:app_user/models/user.dart';

class AddUserPage extends StatefulWidget {
  final Function(User) onUserAdded;
  final String phone;
  final String address;

  const AddUserPage({
    Key? key,
    required this.onUserAdded,
    required this.phone,
    required this.address,
  }) : super(key: key);

  @override
  _AddUserPageState createState() => _AddUserPageState();
}

class _AddUserPageState extends State<AddUserPage> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  void addUser() {
    String firstName = firstNameController.text;
    String lastName = lastNameController.text;
    String email = emailController.text;

    String phone = widget.phone;
    String address = widget.address;

    int id = 1;
    String avatarUrl = 'https://example.com/avatar.png';

    User newUser = User(
      id: id,
      avatar: avatarUrl,
      firstName: firstName,
      lastName: lastName,
      email: email,
      phone: phone,
      address: address,
    );

    widget.onUserAdded(newUser);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrasi'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.teal, Colors.teal.shade900],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: firstNameController,
              decoration: InputDecoration(
                labelText: 'First Name',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: lastNameController,
              decoration: InputDecoration(
                labelText: 'Last Name',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 12.0),
            ElevatedButton(
              onPressed: addUser,
              child: Text('Tambahkan'),
            ),
          ],
        ),
      ),
    );
  }
}
