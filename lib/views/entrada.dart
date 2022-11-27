
import 'package:app/views/cadastro.dart';
import 'package:app/views/maps.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:url_launcher/url_launcher.dart';

class Entrada extends StatefulWidget {
  const Entrada({Key? key, required String title}) : super(key: key);

  @override
  State<Entrada> createState() => _EntradaState();
}

class _EntradaState extends State<Entrada> {
  final Uri  _url = Uri.parse('https://voluntariadobb.v2v.net/pt-BR/aggregators/1539a383-dc83-4151-8cf1-72cdb5149995');
  final Uri  uuu = Uri.parse('http://www.hemopi.pi.gov.br/agendamento.php');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 224, 6, 166),
        centerTitle: true,
        title: Text(' Tela Inicial '),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 300, child: Image.asset('images/R.jpg')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Container(
                  color: Colors.pink,
                  alignment: Alignment.center,
                  width: 195,
                  height: 180,
                  child: TextButton(
                      child: Text(
                        'CONTATOS',
                        style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 63, 1, 46),),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/dados');
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => MyMapa(title: 'MAPA')));
                      }),
                ),
                
                SizedBox(
                  height: 190,
                ),
                Container(
                  color: Colors.pink,
                  alignment: Alignment.center,
                  width: 195,
                  height: 180,
                  child: TextButton(
                      child: Text(
                        'MAPA',
                        style: TextStyle(fontSize: 20, color:Color.fromARGB(255, 63, 1, 46),),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/map');
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => MyMapa(title: 'MAPA')));
                      }),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  color: Colors.pink,
                  alignment: Alignment.center,
                  width: 195,
                  height: 180,
                  child: TextButton(
                    onPressed: _launchurlL,
                    child: Text("DOE SANGUE", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 63, 1, 46),),),
                  ),
                ),
                Container(
                  color: Colors.pink,
                  alignment: Alignment.center,
                  width: 195,
                  height: 180,
                  child: TextButton(
                    onPressed: _launchurl,
                    child: Text("AJUDE!", style: TextStyle(fontSize: 20, color:Color.fromARGB(255, 63, 1, 46),),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _launchurl() async {
    if (!await launchUrl(_url)) throw 'not $url';
  }
  void _launchurlL() async {
    if (!await launchUrl(uuu)) throw 'not $url';
  }
}