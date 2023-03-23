// ignore_for_file: file_names

import 'package:mysql1/mysql1.dart';

class Mysql {
  var settings = ConnectionSettings(
      host: '127.0.0.1',
      port: 3306,
      user: 'root',
      password: 'root',
      db: 'capacitacion_c1');

  Future getLogin(String user, String pass) async {
    var conn = await MySqlConnection.connect(settings);
    var res = await conn.query(
        'SELECT * FROM t_usuario WHERE user_c1= ? AND pass_c1= ?',
        [user, pass]);

    await conn.close();
    return res;
  }

  Future insertUser(String name, mail, phone, user, pass) async {
    var conn = await MySqlConnection.connect(settings);
    var res = await conn.query(
        'Insert INTO t_usuario (nombre,user_c1,pass_c1,correo,estatusUsuario) values (?,?,?,?,?)',
        [name, user, pass, mail, '1']);

    await conn.close();
    return res;
    //SELECT * FROM t_usuario WHERE user_c1="luis12" AND pass_c1="12345678";
  }
}
