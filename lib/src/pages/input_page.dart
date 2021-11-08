import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _nomnbre = '';
  String _email = '';
  String _password = '';
  String _fecha = '';
  String _opcionSeleccionada = 'Volar';

  List<String> _poderes = ['Volar', 'Royos X', 'Super Aliento', 'Super Fuerte'];

  TextEditingController _inputFieldDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Inputs')),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: <Widget>[
          _crearInput(),
          const Divider(),
          _crearPersona(),
          const Divider(),
          _crearEmail(),
          const Divider(),
          _crearEmailText(),
          const Divider(),
          _crearPassword(),
          const Divider(),
          _crearPasswordText(),
          const Divider(),
          _crearFecha(context),
          const Divider(),
          _crearDropdown()
        ],
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
    if (_nomnbre.isNotEmpty) {
      return ListTile(
        title: Text('Nombre es: $_nomnbre'),
      );
    }
    return const Text('');
  }

  Widget _crearEmail() {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          counter: Text('Letras ${_email.length}'),
          hintText: 'Email',
          labelText: 'Email',
          suffixIcon: const Icon(Icons.alternate_email),
          icon: const Icon(Icons.email)),
      onChanged: (valor) {
        setState(() {
          _email = valor;
        });
      },
    );
  }

  Widget _crearEmailText() {
    if (_email.isNotEmpty) {
      return ListTile(
        title: Text('Email es: $_email'),
      );
    }
    return const Text('');
  }

  Widget _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          counter: Text('Letras ${_password.length}'),
          hintText: 'Password',
          labelText: 'Password',
          suffixIcon: const Icon(Icons.lock_open),
          icon: const Icon(Icons.lock)),
      onChanged: (valor) {
        setState(() {
          _password = valor;
        });
      },
    );
  }

  Widget _crearPasswordText() {
    if (_password.isNotEmpty) {
      return ListTile(
        title: Text('Password es: $_password'),
      );
    }
    return const Text('');
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
          counter: Text('Letras ${_password.length}'),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          suffixIcon: const Icon(Icons.perm_contact_calendar),
          icon: const Icon(Icons.calendar_today)),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
        _selectDate(context);
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2018),
        lastDate: DateTime(2025),
        locale: const Locale('es', 'ES'));

    if (picked != null) {
      setState(() {
        _fecha = picked.toString();
        _inputFieldDateController.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpcionesDropdow() {
    List<DropdownMenuItem<String>> lista = [];

    for (var poder in _poderes) {
      lista.add(DropdownMenuItem(
        child: Text(poder),
        value: poder,
      ));
    }

    return lista;
  }

  Widget _crearDropdown() {
    return Row(
      children: <Widget>[
        const Icon(Icons.select_all),
        const SizedBox(width: 30),
        Expanded(
            child: DropdownButton<Object?>(
          value: _opcionSeleccionada,
          items: getOpcionesDropdow(),
          onChanged: (opt) {
            setState(() {
              _opcionSeleccionada = opt.toString();
            });
          },
        ))
      ],
    );
  }
}
