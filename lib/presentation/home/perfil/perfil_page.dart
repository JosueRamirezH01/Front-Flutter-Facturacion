import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:invefacturacion/presentation/widget/menu_drawer.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Usuario', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigoAccent,
      ),
      drawer: WidgetMenu(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 600) {
            return _buildTabletLayout(context, isDarkMode);
          } else {
            return _buildMobileLayout(context, isDarkMode);
          }
        },
      ),
    );
  }

  Widget _buildMobileLayout(BuildContext context, bool isDarkMode) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildStatsCard(context, isDarkMode),
            const SizedBox(height: 16),
            _buildUserInfoCard(context, isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _buildTabletLayout(BuildContext context, bool isDarkMode) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildStatsCard(context, isDarkMode),
            const SizedBox(height: 16),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: _buildUserInfoCard(context, isDarkMode)),
                const SizedBox(width: 16),
                Expanded(child: _buildAdditionalInfoCard(context, isDarkMode)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatsCard(BuildContext context, bool isDarkMode) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStatItem(context, 'Total Ventas', '\$10,000', Icons.attach_money, isDarkMode),
            _buildStatItem(context, 'Boletas', '50', Icons.receipt, isDarkMode),
            _buildStatItem(context, 'Facturas', '30', Icons.description, isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(BuildContext context, String label, String value, IconData icon, bool isDarkMode) {
    return Column(
      children: [
        Icon(icon, color: isDarkMode ? Colors.white : Theme.of(context).primaryColor, size: 32),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontSize: 18,
            color: isDarkMode ? Colors.white : Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfoCard(BuildContext context, bool isDarkMode) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Información del Usuario',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow(context, 'Nombre de Usuario', 'JohnDoe123', Icons.person, isDarkMode),
            _buildInfoRow(context, 'Correo', 'johndoe@example.com', Icons.email, isDarkMode),
            _buildInfoRow(context, 'Establecimiento', 'Tienda Principal', Icons.store, isDarkMode),
            _buildInfoRow(context, 'Perfil', 'Administrador', Icons.work, isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _buildAdditionalInfoCard(BuildContext context, bool isDarkMode) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Información Adicional',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? Colors.white : Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 16),
            _buildInfoRow(context, 'Fecha de Registro', '01/01/2023', Icons.calendar_today, isDarkMode),
            _buildInfoRow(context, 'Última Actividad', '15/05/2023', Icons.access_time, isDarkMode),
            _buildInfoRow(context, 'Nivel de Acceso', 'Nivel 3', Icons.security, isDarkMode),
            _buildInfoRow(context, 'Idioma', 'Español', Icons.language, isDarkMode),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String value, IconData icon, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: isDarkMode ? Colors.white : Theme.of(context).primaryColor, size: 24),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                Text(
                  value,
                  style: TextStyle(
                    color: isDarkMode ? Colors.white70 : Colors.black87,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}