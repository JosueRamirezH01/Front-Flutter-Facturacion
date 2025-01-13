import 'package:flutter/material.dart';
import 'package:invefacturacion/presentation/home/caja/caja_page.dart';
import 'package:invefacturacion/presentation/home/cliente/cliente_page.dart';
import 'package:invefacturacion/presentation/home/compra/compra_page.dart';
import 'package:invefacturacion/presentation/home/dashboard.dart';
import 'package:invefacturacion/presentation/home/gasto/gasto_page.dart';
import 'package:invefacturacion/presentation/home/perfil/perfil_page.dart';
import 'package:invefacturacion/presentation/home/producto/productos_page.dart';
import 'package:invefacturacion/presentation/home/venta/nueva_venta/nueva_venta_page.dart';
import 'package:invefacturacion/presentation/home/venta/venta_page.dart';
import 'package:invefacturacion/presentation/login/login_page.dart';
import 'package:invefacturacion/provider/provider_principal.dart';
import 'package:invefacturacion/provider/drawer.dart';
import 'package:invefacturacion/provider/themes.dart';
import 'package:provider/provider.dart';

import 'presentation/home/configuracion/configuracion_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeProvider = ThemeProvider(); // Inicializamos el ThemeProvider
  await themeProvider.loadThemeFromPreferences(); // Cargamos el tema guardado

  runApp(
    MultiProvider(
      providers: Providers.providers,
      child: ChangeNotifierProvider(
        create: (_) => themeProvider,
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
      return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: themeProvider.currentTheme,
        initialRoute: 'dashboard',
        routes: {
          'login': (_) => LoginPage(),
          'dashboard': (_) => Dashboard(),
          'inventario': (_) => ProductoPage(),
          'cliente': (_) => ClientePage(),
          'perfil': (_) => PerfilPage(),
          'configuracion': (_) => ConfiguracionPage(),
          'compra': (_) => CompraPage(),
          'gasto': (_) => GastosPage(),
          'caja': (_) => CajaPage(),
          'venta': (_) => VentaPage(),
          'nueva_venta': (_) => NuevaVentaPage(),
        },
      );
      }
    );
  }
}




