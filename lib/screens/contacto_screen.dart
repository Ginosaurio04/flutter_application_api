import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// Removed unused import to avoid circular/unused import issues

class ContactoScreen extends StatefulWidget {
  const ContactoScreen({super.key, required this.title});

  final String title;

  @override
  State<ContactoScreen> createState() => _ContactoScreenState();
}

class _ContactoScreenState extends State<ContactoScreen> {
  Future<void> _launchURL(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    try {
      final launched = await launchUrl(
        uri,
        mode: LaunchMode.externalApplication,
      );
      if (!launched) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('No se pudo abrir la URL')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Error al abrir la URL: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title), backgroundColor: Colors.black),

      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: <Widget>[
                Card(
                  color: Colors.black,
                  elevation: 1,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'OPCIONES DE CONTACTO',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Aquí puedes ver varias opciones de contacto.'),
                      ],
                    ),
                  ),
                ),

                Card(
                  color: Colors.black,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                  child: Column(
                    children: <Widget>[
                      // GitHub
                      ListTile(
                        leading: const Icon(
                          Icons.alternate_email,
                          color: Colors.redAccent,
                        ),
                        title: const Text(
                          'GitHub',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        subtitle: const Text('Ginosaurio04'),
                        trailing: const Icon(Icons.open_in_new),
                        onTap: () => _launchURL(
                          context,
                          'https://github.com/Ginosaurio04',
                        ),
                      ),
                    ],
                  ),
                ),

                Card(
                  color: Colors.black,
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                  child: Column(
                    children: <Widget>[
                      // GitHub
                      ListTile(
                        leading: const Icon(
                          Icons.alternate_email,
                          color: Colors.redAccent,
                        ),
                        title: const Text(
                          'Correo Institucional',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        subtitle: const Text('gcova.1249@unimar.edu.ve'),
                      ),
                    ],
                  ),
                ),

                Card(
                  color: Colors.black,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                  child: Column(
                    children: <Widget>[
                      // GitHub
                      ListTile(
                        leading: const Icon(
                          Icons.phone,
                          color: Colors.redAccent,
                        ),
                        title: const Text(
                          'Telefono',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        subtitle: const Text('0414*****52'),
                      ),
                    ],
                  ),
                ),

                Card(
                  color: Colors.black,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: const BorderSide(color: Colors.redAccent),
                  ),
                  child: Column(
                    children: <Widget>[
                      // GitHub
                      ListTile(
                        leading: const Icon(
                          Icons.camera_alt,
                          color: Colors.redAccent,
                        ),
                        title: const Text(
                          'Instagram',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent,
                          ),
                        ),
                        subtitle: const Text('ginomargiotta04'),
                        trailing: const Icon(Icons.open_in_new),
                        onTap: () => _launchURL(
                          context,
                          'https://www.instagram.com/ginomargiotta04/',
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
