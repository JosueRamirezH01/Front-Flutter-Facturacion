import 'package:invefacturacion/provider/drawer.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'themes.dart';

class Providers {
  static List<SingleChildWidget> providers = [
    ChangeNotifierProvider(create: (_) => DrawerState()),
    ChangeNotifierProvider(create: (_) => ThemeProvider()),
    // Aquí puedes agregar otros proveedores que utilices en la app
  ];
}