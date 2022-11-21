import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';

class Dados extends StatelessWidget {
 

  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: TextField(controller: controller),actions: [IconButton(icon: Icon(Icons.add),
    onPressed:() {
      Navigator.of(context).pushNamed('/ct');
      final name = controller.text;

      createUser(name: name);
    }),],),);
  }
Future createUser({required String name}) async {
    final docUser = FirebaseFirestore.instance.collection('users').doc();

    const user = User;{
      id: docUser.id;
      name : name;
      idade : 21;
      aniversario : DateTime(2001, 8, 15);
    };

    final json = user.toJson();
    
    await docUser.set(json);
  }
}

class User {
  String id;
  final String name;
  final int idade;
  final DateTime aniversario;

  User({
    this.id= '',
    required this.name,
    required this.idade,
    required this.aniversario,
  });

  Map<String, dynamic> toJson() => {
    'id': 'id',
    'name' : name,
    'age' : idade,
    'aniversario': aniversario,
  };
}