import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/views/dados.dart';

class Contatos extends StatelessWidget {

 final controller = TextEditingController();
  final controllerUrl = TextEditingController();
   final controllerName = TextEditingController();
    final controllerTelefone = TextEditingController();
     final controllerEmail = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contatos'),
        backgroundColor: Colors.pink,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final user = User(name: controllerName.text,telefone: int.parse(controllerTelefone.text),
                email: controllerEmail.text,
                url: controllerUrl.text);

                createUser(user, email: '', url: '', name: '');

               Navigator.of(context).pushNamed('/dados');
              
              }),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: controllerName,
                decoration: InputDecoration(labelText: 'Nome:'),
              ),
              TextFormField(
                controller: controllerTelefone,
                decoration: InputDecoration(labelText: 'Telefone:'),
              ),
              TextFormField(
                controller: controllerEmail,
                decoration: InputDecoration(labelText: 'E-mail:'),
              ),
              TextFormField(
                controller: controllerUrl,
                decoration: InputDecoration(labelText: 'URL do Avatar:'),
              ),
            ],),)
        ),
      
    );
    
  }


  Future createUser(User user, {required String name, required String email, required String url}) async {
    final docUser = FirebaseFirestore.instance.collection('u').doc();

    final user= User(
      id: docUser.id,
      name : name,
      telefone : 21,
      email : email,
      url : url,
    );

    final json = user.toJson();
    
    await docUser.set(json);
  }
}

class User {
  String id;
  late final String name;
  int telefone;
  late final String email;
  late final String url;

  User({
    this.id= '',
    required this.name,
    required this.telefone,
    required this.email,
     required  this.url,
  });
  
  
  

Map<String,dynamic> toJson() => {
    
    'id': id,
    'name' : name,
    'telefone' : telefone,
    'email': email,
    'url' : url,
  };


static User fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    telefone: json['telefone'],
    email: json['email'],
    url : json['url'],
  );


Future createUser(User user) async{
  final docUser = FirebaseFirestore.instance.collection('u').doc();
  user.id = docUser.id;

  final json= user.toJson();
  await docUser.set(json);
}
}