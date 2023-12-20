class Pessoa {
  int? id;
  late String nome;
  late String telefone;
  late String email;
  late bool estadoCivil;

  Pessoa(
      {this.id,
      required this.nome,
      this.telefone = "",
      this.email = "",
      this.estadoCivil = false});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'email': email,
      'telefone': telefone,
      'estado_civil': estadoCivil
    };
  }

  static Pessoa fromMap(Map<String, dynamic> map) {
    return Pessoa(
      id: map['id'],
      nome: map['nome'],
      email: map['email'],
      telefone: map['telefone'],
      estadoCivil: map['estado_civil'] == 1 ? true : false,
    );
  }

  @override
  String toString() {
    return "Pessoa(id=$id, nome=$nome, email=$email, telefone=$telefone, estadoCivil=$estadoCivil)";
  }
}
