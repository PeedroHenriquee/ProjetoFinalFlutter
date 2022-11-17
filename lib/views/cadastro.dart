import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:app/views/myhome.dart';
import 'package:flutter/cupertino.dart';
import 'package:app/views/myapp.dart';

class Cadastro extends StatefulWidget {
  Cadastro({Key? key, required String title}) : super(key: key);

  @override
  State<Cadastro> createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _psController = TextEditingController();
  final _firebaseAuth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(padding: EdgeInsets.all(32.0),
        child: Column(
          children :[
            Text('Cadastro',
            style: TextStyle(
              color: Colors.green,
              fontSize: 30,
              fontWeight: FontWeight.w600
            ),),
            SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 150,
              child: Image.asset('images/R.jpg'),
            ),
            //Separarção entre a foto e o espaço de loguin.
            SizedBox(
              height: 40,
            ),
            //classe para incluir o email
            TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(
                    label: Text('Digite seu nome'),
                    icon: Icon(Icons.account_box_outlined))),
            SizedBox(
              height: 5,),
            TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                    label: Text('Digite seu e-mail'),
                    icon: Icon(Icons.email))),
              SizedBox(
              height: 5,),
            TextFormField(
                controller: _psController,
                obscureText: true,
                decoration: InputDecoration(
                    label: Text('Digite sua senha'), 
                    icon: Icon(Icons.key_off))),
            SizedBox(
              height: 40,
            ),
            //botao para cadastrar usúario.
            ElevatedButton(
              onPressed: () {
                cadastrar();
              },
              child: Text('CADASTRAR'),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(Size(120, 40)),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.orangeAccent),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)))
                ),
              ),
            ]
          ),
        ),
      )
    );
  }

  cadastrar() async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: _emailController.text, password: _psController.text);
      if (userCredential != null) {
        userCredential.user?.updateDisplayName(_nomeController.text);
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => Home(title: 'principal')),
            (route) => false);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Crie uma senha mas forte'),
            backgroundColor: Colors.redAccent,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('este e-mail ja foi cadastrado, tente outro e-mail'),
            backgroundColor: Colors.redAccent,
          ),
        );
      }
    }
  }
}
