import 'dart:convert';
import 'package:app/views/contatos.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';

class Dados extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TELA DE CONTATOS'),
        centerTitle: true,
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed('/ct');
              }),
        ],
      ),
      body: StreamBuilder<List<User>>(
          stream: readUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final users = snapshot.data!;

              return ListView(
                children: users.map(buildUser).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

Future createUser(User user,
    {required String name, required String email, required String url}) async {
  final docUser = FirebaseFirestore.instance.collection('u').doc();

  final user = User(
    id: docUser.id,
    name: name,
    telefone: 21,
    email: email,
    url: url,
  );

  final json = user.toJson();

  await docUser.set(json);
}

class User {
  String id;
  late final String name;
  int telefone;
  late final String email;
  late final String url;

  User({
    this.id = '',
    required this.name,
    required this.telefone,
    required this.email,
    required this.url,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'telefone': telefone,
        'email': email,
        'url': url,
      };

  static User fromJson(Map<String, dynamic> json) => User(
        id: json['id'],
        name: json['name'],
        telefone: json['telefone'],
        email: json['email'],
        url: json['url'],
      );

  Future createUser(User user) async {
    final docUser = FirebaseFirestore.instance.collection('u').doc();
    user.id = docUser.id;

    final json = user.toJson();
    await docUser.set(json);
  }
}

Widget buildUser(User user) => ListTile(
      leading: CircleAvatar(child: Image.asset('images/R.jpg')),
      title: Text((user.name)),
      subtitle: Text(user.email),
      tileColor: Colors.green[100],
    );

Stream<List<User>> readUsers() => FirebaseFirestore.instance.collection('usuarios').snapshots().map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());
