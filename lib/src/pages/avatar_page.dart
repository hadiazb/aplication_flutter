import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar Page'),
        actions: <Widget>[
          Container(
            margin: const EdgeInsets.all(5),
            child: const CircleAvatar(
                radius: 18,
                backgroundImage: NetworkImage(
                    'https://img.huffingtonpost.com/asset/5ee724ed2500004a2ceb34e3.jpeg?cache=MmZpXeEPFo&ops=1200_630')),
          ),
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const CircleAvatar(
                child: Text('SL'),
                radius: 18,
                backgroundColor: Colors.brown,
              )),
        ],
      ),
      body: const Center(
          child: FadeInImage(
        image: NetworkImage(
            'https://img.huffingtonpost.com/asset/5ee724ed2500004a2ceb34e3.jpeg?cache=MmZpXeEPFo&ops=1200_630'),
        placeholder: AssetImage('assets/jar-loading.gif'),
      )),
    );
  }
}
