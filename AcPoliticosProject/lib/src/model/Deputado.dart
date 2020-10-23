enum ItemsListOrderBy { alphaASC, alphaDESC }
enum ItemsListFilterBy { checked, unchecked, all }

class Deputado {
  String nome;
  String codigo;

  // Deputado(this.nome, this.codigo);

  Future<List<Map>> itemsByList(
    int ano,
    int mes,
    ItemsListOrderBy orderBy,
    ItemsListFilterBy filterBy,
  ) async {
    return [
      {
        'nome': "Gustavo",
        'codigo': "Gustavo",
      },
      {
        'nome': "Rogerio",
        'codigo': "Gustavo",
      },
      {
        'nome': "Gusto",
        'codigo': "Gustavo",
      }
    ];
  }

  Future<List<String>> itemsByList2(
    int ano,
    int mes,
    ItemsListOrderBy orderBy,
    ItemsListFilterBy filterBy,
  ) async {
    return [
      "Gustavo",
      "Gustava",
      "Gusta",
      "Rafa",
      "Fernando",
    ];
  }
}
