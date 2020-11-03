import 'dart:convert';

class ResultUfs {
  int id;
  String sigla;
  String nome;

  ResultUfs(
    this.id,
    this.sigla,
    this.nome,
  );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        'id': id,
        'uri': sigla,
        'nome': nome,
      };
}
