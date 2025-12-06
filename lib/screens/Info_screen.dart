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
              children: <Widget>[
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
                          backgroundImage: AssetImage(
                            'flutter_application_api/assets/ff7 boxart - Bing.jpeg',
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
                          'GitHub',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
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
                          backgroundImage: AssetImage(
                            'flutter_application_api/assets/gumball.png',
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
                          'GitHub',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                        subtitle: const Text('Jhonnyferrer'),
                        trailing: const Icon(Icons.open_in_new),
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
