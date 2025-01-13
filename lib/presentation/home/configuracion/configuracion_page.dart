import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:invefacturacion/presentation/home/configuracion/configuracion_controller.dart';
import 'package:invefacturacion/presentation/widget/menu_drawer.dart';
import 'package:invefacturacion/utils/sharedPreferences.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../provider/themes.dart';



class ConfiguracionPage extends StatefulWidget {
  const ConfiguracionPage({super.key});
  @override
  State<ConfiguracionPage> createState() => _ConfiguracionPageState();
}


class _ConfiguracionPageState extends State<ConfiguracionPage> {
  final SharedPref _pref =  SharedPref();
  final ConfiguracionController _con = ConfiguracionController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

    @override
    Widget build(BuildContext context) {
      final themeProvider = Provider.of<ThemeProvider>(context); // Acceder al ThemeProvider

      return LayoutBuilder(
        builder: (context, constraints) {
          // Obtenemos el ancho de la pantalla
          double screenWidth = constraints.maxWidth;

          // Móvil: Pantalla pequeña (menos de 600px)
          // Tableta: Pantalla mediana (600px - 1200px)
          // Web: Pantalla grande (más de 1200px)
          if (screenWidth < 600) {
            // Diseño para móvil
            return Theme(
              data: _con.isDark ? ThemeData.dark() : ThemeData.light(),
              child: Scaffold(
                appBar: AppBar(
                  title: const Text("Settings"),
                ),
                drawer: WidgetMenu(),
                body: Center(
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: ListView(
                      children: [
                        _SingleSection(
                          title: "General",
                          children: [
                            _CustomListTile(
                                title: "Dark Mode",
                                icon: Icons.dark_mode_outlined,
                                trailing: Switch(
                                  value: themeProvider.isDarkMode,  // Cambié isDark a isDarkMode
                                  onChanged: (bool value) {
                                    themeProvider.toggleTheme(); // Cambiamos el estado global
                                    setState(() {
                                      _con.isDark = value; // Actualizamos el estado local del widget
                                    });
                                  },
                                ),),
                            const _CustomListTile(
                                title: "Notifications",
                                icon: Icons.notifications_none_rounded),
                            const _CustomListTile(
                                title: "Security Status",
                                icon: CupertinoIcons.lock_shield),
                          ],
                        ),
                        const Divider(),
                        const _SingleSection(
                          title: "Organization",
                          children: [
                            _CustomListTile(
                                title: "Profile", icon: Icons.person_outline_rounded),
                            _CustomListTile(
                                title: "Messaging", icon: Icons.message_outlined),
                            _CustomListTile(
                                title: "Calling", icon: Icons.phone_outlined),
                            _CustomListTile(
                                title: "People", icon: Icons.contacts_outlined),
                            _CustomListTile(
                                title: "Calendar", icon: Icons.calendar_today_rounded)
                          ],
                        ),
                        const Divider(),
                        const _SingleSection(
                          children: [
                            _CustomListTile(
                                title: "Help & Feedback",
                                icon: Icons.help_outline_rounded),
                            _CustomListTile(
                                title: "About", icon: Icons.info_outline_rounded),
                            _CustomListTile(
                                title: "Sign out", icon: Icons.exit_to_app_rounded),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else if (screenWidth < 1200) {
            // Diseño para tableta
            return Scaffold(
              appBar: AppBar(title: const Text("Tableta")),
              body: Center(child: Text("Vista para tableta")),
            );
          } else {
            // Diseño para web
            return Scaffold(
              appBar: AppBar(title: const Text("Web")),
              body: Center(child: Text("Vista para web")),
            );
          }
        },
      );
    }
    void refresh(){
      setState(() {
      });
    }
  }


class _CustomListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final Widget? trailing;
  const _CustomListTile(
      {Key? key, required this.title, required this.icon, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon),
      trailing: trailing,
      onTap: () {},
    );
  }
}

class _SingleSection extends StatelessWidget {
  final String? title;
  final List<Widget> children;
  const _SingleSection({
    Key? key,
    this.title,
    required this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title!,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        Column(
          children: children,
        ),
      ],
    );
  }
}


