import 'package:flutter/material.dart';

class AlertPage extends StatelessWidget {
  const AlertPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Alert Page'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => _mostrarAtert(context),
          child: const Text('Mostrar Alerta!!!'),
          style: ElevatedButton.styleFrom(
              primary: Colors.blue, shape: const StadiumBorder()),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.ac_unit_sharp),
          onPressed: () => _back(context)),
    );
  }

  void _back(BuildContext context) {
    Navigator.of(context).pop();
  }

  void _mostrarAtert(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)),
            title: const Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const <Widget>[
                Text('Este es el contenido de la alerta!!!'),
                FlutterLogo(
                  size: 100.0,
                )
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Cancelar')),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Ok')),
            ],
          );
        },
        barrierDismissible: true);
  }
}
