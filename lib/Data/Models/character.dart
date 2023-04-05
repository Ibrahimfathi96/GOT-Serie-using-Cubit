class Character {
  int? id;
  String? name;
  String? status;
  String? species;
  String? type;
  String? gender;
  Origin? origin;
  Location? location;
  String? image;

  Character.fromJson(Map jsonMap)
      : id = jsonMap['id'],
        name = valueOrDefaultValue(jsonMap['name']),
        status = valueOrDefaultValue(jsonMap['status']),
        species = valueOrDefaultValue(jsonMap['species']),
        type = valueOrDefaultValue(jsonMap['type']),
        gender = valueOrDefaultValue(jsonMap['gender']),
        origin = Origin.fromJson(jsonMap['origin']),
        location = Location.fromJson(jsonMap['location']),
        image = valueOrDefaultValue(jsonMap['image']);
}

class Origin {
  String? name;

  Origin.fromJson(Map jsonMap) : name = valueOrDefaultValue(jsonMap['name']);
}

class Location {
  String? name;

  Location.fromJson(Map jsonMap) : name = valueOrDefaultValue(jsonMap['name']);
}

String valueOrDefaultValue(String value) {
  return (value == null || value.isEmpty) ? "-" : value;
}
