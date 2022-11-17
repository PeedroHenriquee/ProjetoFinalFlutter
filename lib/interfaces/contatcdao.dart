
import 'package:app/models/contac.dart';

abstract class Contatosdao {
  save(Contatc contatc);

  remove(String id);

  Future<List<Contatc>> find();
}
