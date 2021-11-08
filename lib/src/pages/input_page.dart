import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nomnbre = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inputs')),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[_crearInput(), const Divider(), _crearPersona()],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
      // autofocus: false,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          counter: Text('Letras ${_nomnbre.length}'),
          hintText: 'Nombre de la persona',
          labelText: 'Nombre',
          helperText: 'Solo es un nombre',
          suffixIcon: const Icon(Icons.accessibility),
          icon: const Icon(Icons.account_circle)),
      onChanged: (valor) {
        setState(() {
          _nomnbre = valor;
        });
      },
    );
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('Nombre es: $_nomnbre'),
    );
  }
}
