import 'package:flutter_form/enums/tipo_transacao.dart';

class Transacao {
  final double valor;
  final TipoTransacao tipoTransacao;

  Transacao(this.valor, this.tipoTransacao);
}
