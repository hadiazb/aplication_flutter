import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  final ScrollController _scrollController = ScrollController();

  final List<int> _listaNumeros = [];
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _agregar10();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // _agregar10();
        fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Listas'),
        ),
        body: Stack(
          children: [_crearLista(), _crearLoading()],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
        onRefresh: obtenerPagina1,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _listaNumeros.length,
          itemBuilder: (BuildContext context, int index) {
            final imagen = _listaNumeros[index];
            return FadeInImage(
                image: NetworkImage(
                    'https://picsum.photos/500/300/?images=$imagen'),
                placeholder: const AssetImage('assets/jar-loading.gif'));
          },
        ));
  }

  void _agregar10() {
    for (var i = 0; i < 10; i++) {
      _ultimoNumero++;
      _listaNumeros.add(_ultimoNumero);

      setState(() {});
    }
  }

  Future<void> fetchData() async {
    _isLoading = true;
    setState(() {});

    const duration = Duration(seconds: 2);

    Timer(duration, respuestaHTTP);
  }

  void respuestaHTTP() {
    _isLoading = false;
    _agregar10();

    _scrollController.animateTo(_scrollController.position.pixels + 50,
        duration: const Duration(microseconds: 300),
        curve: Curves.fastLinearToSlowEaseIn);
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[CircularProgressIndicator()],
          ),
          const SizedBox(
            height: 15,
          )
        ],
      );
    } else {
      return Container();
    }
  }

  Future<void> obtenerPagina1() async {
    const duration = Duration(seconds: 2);
    Timer(duration, () {
      _listaNumeros.clear();
      _ultimoNumero++;
      _agregar10();
    });

    return Future.delayed(duration);
  }
}
