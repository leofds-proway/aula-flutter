class Pessoa {
  late String nome;
  late String telefone;
  late String email;
  late bool estadoCivil;

  Pessoa(
      {required this.nome,
      this.telefone = "",
      this.email = "",
      this.estadoCivil = false});
}
