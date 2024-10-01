import 'package:flutter/material.dart';
import 'package:flutter_form/enums/tipo_transacao.dart';
import 'package:flutter_form/models/transacao.dart';

class FormTransacoes extends StatefulWidget {
  final TextEditingController valueController = TextEditingController();

  FormTransacoes({super.key});

  @override
  State<FormTransacoes> createState() => _FormTransacoesState();
}

class _FormTransacoesState extends State<FormTransacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Formulário de Transações"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                controller: widget.valueController,
              ),
            ),
            ElevatedButton(
              onPressed: () => _createTransaction(context),
              child: const Text('Confirmar'),
            )
          ],
        ),
      ),
    );
  }

  void _createTransaction(BuildContext context) {
    double? parsedValue = double.tryParse(widget.valueController.text);

    if (parsedValue == null) {
      return;
    }

    final newTransaction = Transacao(parsedValue, TipoTransacao.credito);
    Navigator.pop(context, newTransaction);
  }
}
