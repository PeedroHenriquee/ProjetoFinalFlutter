import 'package:app/controller/data/conection.dart';
import 'package:app/models/contac.dart';
import 'package:app/interfaces/contatcdao.dart';
import 'package:sqflite/sqflite.dart';

class Contactdao implements Contatosdao {
  late Database _db;

  @override
  Future<List<Contatc>> find() async {
    _db = (await Connection.get())!;
    List<Map<String, dynamic>> resultado = await _db.query('contact');
    List<Contatc> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Contatc(
          id : linha['id'],
          nome: linha['nome'],
          telefone: linha['telefone'],
          email: linha['email'],
          urlAvatar: linha['urlAvatar']);
    });

    return lista;
  }

  @override
  remove(String id) async {
    _db = (await Connection.get())!;
    var sql = 'DELETE FROM contact WHERE id = ?';
    _db.rawDelete(sql, [id]);
  }

  @override
  save(Contatc contatc) async {
    _db = (await Connection.get())!;
    var sql;
    if (contatc.id == null) {
      sql = 'INSERT INTO contact (nome,telefone,url_avatar)VALUES(?,?,?,?)';

      _db.rawInsert(sql, [
        contatc.nome,
        contatc.telefone,
        contatc.urlAvatar,
      ]);
    } else {
      sql =
          'UPDATE contact SET nome = ?,telefone=?,email=?,url_avatar=? WHERE id = ?';
      _db.rawUpdate(sql, [
        contatc.nome,
        contatc.telefone,
        contatc.urlAvatar,
      ]);
    }
  }
}
