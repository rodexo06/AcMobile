import 'dart:convert';

class DespesasDeputado {
  int ano;
  int mes;
  String cnpjCpfFornecedor;
  String tipoDespesa;
  int codDocumento;
  String dataDocumento;
  String numDocumento;
  double valorDocumento;
  String urlDocumento;
  String nomeFornecedor;
  double valorLiquido;
  double valorGlosa;
  int codLote;
  int parcela;

  DespesasDeputado(
    this.ano,
    this.mes,
    this.cnpjCpfFornecedor,
    this.tipoDespesa,
    this.codDocumento,
    this.dataDocumento,
    this.numDocumento,
    this.valorDocumento,
    this.urlDocumento,
    this.nomeFornecedor,
    this.valorLiquido,
    this.valorGlosa,
    this.codLote,
    this.parcela,
  );
}
