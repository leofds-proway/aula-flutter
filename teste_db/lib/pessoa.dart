
class Pessoa {

  late int? id;
  late String nome;

  Pessoa({this.id,required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
    };
  }

  static Pessoa fromMap(Map<String, dynamic> map){
    return Pessoa(id: map['id'], nome: map['nome']);
  }

  @override
  String toString() {
    return 'Pessoa(id=$id, nome=$nome)';
  }
}