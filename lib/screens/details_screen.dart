import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../services/api_service.dart';
import '../models/character.dart';

class DetailsScreen extends StatefulWidget {
  final int characterId;

  const DetailsScreen({super.key, required this.characterId});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late Future<Character> futureCharacter;

  @override
  void initState() {
    super.initState();
    futureCharacter = RickMortyService.getCharacter(widget.characterId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personaje'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: FutureBuilder<Character>(
        future: futureCharacter,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final character = snapshot.data!;
            return SingleChildScrollView(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Hero(
                    tag: 'character_${character.id}',
                    child: Center(
                      child: CircleAvatar(
                        radius: 80,
                        backgroundImage: CachedNetworkImageProvider(
                          character.image,
                        ),
                        backgroundColor: Colors.grey[800],
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  //  NOMBRE
                  Center(
                    child: Text(
                      character.name,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 30),

                  //  INFO CARDS
                  _InfoCard(
                    title: 'Estado',
                    value: character.status,
                    icon: Icons.favorite,
                    color: character.status == 'Alive'
                        ? Colors.green
                        : Colors.red,
                  ),
                  _InfoCard(
                    title: 'Especie',
                    value: character.species,
                    icon: Icons.public,
                  ),
                  _InfoCard(
                    title: 'Género',
                    value: character.gender,
                    icon: Icons.person,
                  ),
                  _InfoCard(
                    title: 'Origen',
                    value: character.origin?.name ?? 'Desconocido',
                    icon: Icons.location_on,
                  ),
                  _InfoCard(
                    title: 'Ubicación actual',
                    value: character.location?.name ?? 'Desconocido',
                    icon: Icons.map,
                  ),
                ],
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error, size: 64, color: Colors.red),
                  SizedBox(height: 16),
                  Text('Error cargando personaje'),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureCharacter = RickMortyService.getCharacter(
                          widget.characterId,
                        );
                      });
                    },
                    child: Text('Reintentar'),
                  ),
                ],
              ),
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

class _InfoCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color? color;

  const _InfoCard({
    required this.title,
    required this.value,
    required this.icon,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.green.withValues(alpha: 0.3),
          width: 1,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: (color ?? Colors.green).withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color ?? Colors.green, size: 28),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 14, color: Colors.grey[400]),
                ),
                SizedBox(height: 4),
                Text(
                  value,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
