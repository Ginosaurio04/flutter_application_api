import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../widgets/custom_bottom_navigation.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key, required this.title});

  final String title;

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  // Función auxiliar corregida para lanzar URLs de forma segura
  Future<void> _launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);

    // Verificación de mounted antes de una operación asíncrona (práctica de seguridad)
    if (!mounted) return;

    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );

      // Verificación de mounted después de la operación asíncrona
      if (!mounted) return;

      if (!launched) {
        // Muestra SnackBar si no se puede abrir la URL
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No se pudo abrir la URL. Verifica la URL.'),
          ),
        );
      }
    } catch (e) {
      // Muestra SnackBar si hay un error al intentar abrir la URL
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al abrir la URL: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.black,
        titleTextStyle: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),

      bottomNavigationBar: const CustomBottomNavigation(currentIndex: 1),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(
                16.0,
              ), // Añadido padding al ListView
              children: <Widget>[
                // Primer Card: Título de Contacto
                Card(
                  color: Colors.black,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.green),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'OPCIONES DE CONTACTO',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        SizedBox(height: 8),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 16), // Espacio entre cards
                // Segundo Card: Contacto Ginosaurio04
                Card(
                  color: Colors.black,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.green),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: const AssetImage(
                            'assets/gumball.png',
                          ),
                        ),
                      ),
                      // GitHub
                      ListTile(
                        leading: const Icon(
                          Icons.alternate_email,
                          color: Colors.green,
                        ),
                        title: const Text(
                          'GitHub - Ginosaurio04',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        subtitle: const Text('Ir al perfil de GitHub'),
                        trailing: const Icon(
                          Icons.open_in_new,
                          color: Colors.green,
                        ),
                        onTap: () => _launchURL(
                          context,
                          'https://github.com/Ginosaurio04',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16), // Espacio entre cards
                // Tercer Card: Contacto Jhonnyferrer
                Card(
                  color: Colors.black,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.green),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          radius: 50,
                          // RUTA CORREGIDA: Asumiendo que 'assets/' está declarado en pubspec.yaml
                          backgroundImage: const AssetImage(
                            'assets/ff7 boxart - Bing.jpeg',
                          ),
                        ),
                      ),
                      // GitHub
                      ListTile(
                        leading: const Icon(
                          Icons.alternate_email,
                          color: Colors.green,
                        ),
                        title: const Text(
                          'GitHub - Jhonnyferrer',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        subtitle: const Text('Ir al perfil de GitHub'),
                        trailing: const Icon(
                          Icons.open_in_new,
                          color: Colors.green,
                        ),
                        onTap: () => _launchURL(
                          context,
                          'https://github.com/Jhonnyferrer',
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),

          // Footer pinned to bottom
          SafeArea(
            top: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Versión de la App: 2.0.0',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.outline,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
