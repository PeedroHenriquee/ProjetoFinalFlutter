
import 'package:app/views/contatos.dart';
import 'package:app/views/cadastro.dart';
import 'package:app/views/myhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app/views/entrada.dart';
import 'package:app/views/maps.dart';
import 'package:app/views/dados.dart';



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

 
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Projeto Final',
      theme: ThemeData(
       
        primarySwatch: Colors.pink
      ),
      initialRoute: '/',
      routes:{
        '/' : (context) => Home(title: 'principal',),
        '/home' : (context) => Entrada(title: 'entrada',),
        '/map'  : (context) => MyMapa(title: 'Mapa',),
        '/lista'   : (context) => Cadastro(title: 'cadastro',),
        '/ct' : (context) => Contatos(),
        '/dados' : (context) => Dados(),
      },
      
    );
  }
}