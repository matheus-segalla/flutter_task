import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_task/components/my_textfield.dart';
import 'package:flutter_app_task/components/text_box.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  final textController = TextEditingController();

  void postMessage(){}

  Future<void> editField(String field) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const Icon(
            Icons.person,
            size: 72,
          ),
          Text(
            currentUser.email!,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[700]),
          ),
          MyTextBox(
            text: 'Matheus',
            sectionName: 'Username',
            onPressed: () => editField('username'),
          ),
          MyTextBox(
            text: 'Bio vazia',
            sectionName: 'Bio',
            onPressed: () => editField('bio'),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                    child: MyTextField(
                  controller: textController,
                  hintText: 'Escreva algo aqui',
                  obscureText: false,
                )),
                IconButton(onPressed: postMessage,
                    icon: const Icon(Icons.arrow_circle_left_outlined),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
