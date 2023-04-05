class Character {
  late int id;
  late String name;
  late String status;
  late String species;
  late String type;
  late String gender;
  late Origin origin;
  late Location location;
  late String image;

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
  late String name;

  Origin.fromJson(Map jsonMap) : name = valueOrDefaultValue(jsonMap['name']);
}

class Location {
  late String name;

  Location.fromJson(Map jsonMap) : name = valueOrDefaultValue(jsonMap['name']);
}

String valueOrDefaultValue(String value) {
  return (value.isEmpty) ? "-" : value;
}
