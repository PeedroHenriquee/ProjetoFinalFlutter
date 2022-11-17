
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
  final Uri  _url = Uri.parse('https://selecao.ifpi.edu.br/concurso/acesso_candidato/13/');
  final Uri  uuu = Uri.parse('http://ifpi.edu.br/');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        centerTitle: true,
        title: Text(' 👇  Navigation Here  👇 '),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(height: 300, child: Image.asset('images/R.jpg')),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [Container(
                  color: Colors.orange,
                  alignment: Alignment.center,
                  width: 195,
                  height: 180,
                  child: TextButton(
                      child: Text(
                        'CONTATOS',
                        style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 62, 8, 107)),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed('/ct');
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => MyMapa(title: 'MAPA')));
                      }),
                ),
                
                SizedBox(
                  height: 190,
                ),
                Container(
                  color: Colors.orange,
                  alignment: Alignment.center,
                  width: 195,
                  height: 180,
                  child: TextButton(
                      child: Text(
                        'MAPA',
                        style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 62, 8, 107)),
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
                  color: Colors.orange,
                  alignment: Alignment.center,
                  width: 195,
                  height: 180,
                  child: TextButton(
                    onPressed: _launchurlL,
                    child: Text("SITE IFPI", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 62, 8, 107)),),
                  ),
                ),
                Container(
                  color: Colors.orange,
                  alignment: Alignment.center,
                  width: 195,
                  height: 180,
                  child: TextButton(
                    onPressed: _launchurl,
                    child: Text("VERTIBULAR IFPI", style: TextStyle(fontSize: 20, color: Color.fromARGB(255, 62, 8, 107)),),
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