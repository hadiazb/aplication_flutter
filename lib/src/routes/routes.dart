import 'package:flutter/material.dart';

// Nosotros
import 'package:componentes/src/pages/alert_page.dart';
import 'package:componentes/src/pages/listview_page.dart';
import 'package:componentes/src/pages/slider_page.dart';
import 'package:componentes/src/pages/card_page.dart';
import 'package:componentes/src/pages/avatar_page.dart';
import 'package:componentes/src/pages/home_page.dart';
import 'package:componentes/src/pages/animated_container.dart';
import 'package:componentes/src/pages/input_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => const HomePage(),
    'alert': (BuildContext context) => const AlertPage(),
    'avatar': (BuildContext context) => const AvatarPage(),
    'card': (BuildContext context) => const CardPage(),
    'slider': (BuildContext context) => const SliderPage(),
    'list': (BuildContext context) => const ListPage(),
    'inputs': (BuildContext context) => const InputPage(),
    'animatedContainer': (BuildContext context) =>
        const AnimatedContainerPage(),
  };
}
