class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String image;
  final String gender;
  final Location? origin;
  final Location? location;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.image,
    required this.gender,
    this.origin,
    this.location,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      status: json['status'],
      species: json['species'],
      image: json['image'],
      gender: json['gender'],
      origin: json['origin'] != null ? Location.fromJson(json['origin']) : null,
      location: json['location'] != null
          ? Location.fromJson(json['location'])
          : null,
    );
  }
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(name: json['name'] ?? 'Unknown', url: json['url'] ?? '');
  }
}
