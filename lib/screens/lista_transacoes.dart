import 'package:flutter/material.dart';
import 'package:flutter_form/components/card_list.dart';
import 'package:flutter_form/enums/tipo_transacao.dart';
import 'package:flutter_form/models/transacao.dart';
import 'package:flutter_form/screens/form_transacoes.dart';

class ListaTransacoes extends StatefulWidget {
  final List<Transacao> _transacoes = [
    Transacao(199, TipoTransacao.credito),
    Transacao(500, TipoTransacao.debito),
    Transacao(299, TipoTransacao.debito),
    Transacao(399, TipoTransacao.debito)
  ];

  ListaTransacoes({super.key});

  @override
  State<StatefulWidget> createState() => _ListaTransacoesState();
}

class _ListaTransacoesState extends State<ListaTransacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista de Transacoes"),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.builder(
          itemCount: widget._transacoes.length,
          itemBuilder: (context, index) => CardList(
              widget._transacoes[index].valor.toString(),
              widget._transacoes[index].tipoTransacao.name)),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FormTransacoes(),
            ),
          ).then((value) => _atualizar(value))
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _atualizar(Transacao? transacao) {
    if (transacao == null) {
      return;
    }

    setState(() {
      widget._transacoes.add(transacao);
    });
  }
}
