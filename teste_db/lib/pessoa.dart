
class Pessoa {

  late int? id;
  late String nome;

  Pessoa({this.id,required this.nome});

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
    };
  }

  @override
  String toString() {
    return 'Pessoa(id=$id, nome=$nome)';
  }
}