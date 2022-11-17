import 'package:flutter/material.dart';


class Contatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Contatos'),
        backgroundColor: Colors.orange,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                Navigator.of(context).pop();
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(labelText: 'Nome:'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Telefone:'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'E-mail:'),
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'URL do Avatar:'),
              ),
            ],),)
        ),
      
    );
  }
}
