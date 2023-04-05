import 'House.dart';

class CharactersQuotes {
  CharactersQuotes({
      required this.name,
      required this.slug,
      required this.house,
      required this.quotes,});

  CharactersQuotes.fromJson(dynamic json) {
    name = json['name'];
    slug = json['slug'];
    house = (json['house'] != null ? House.fromJson(json['house']) : null)!;
    quotes = json['quotes'] != null ? json['quotes'].cast<String>() : [];
  }
   late String name;
   late String slug;
   late House house;
   late List<String> quotes;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['slug'] = slug;
    map['house'] = house.toJson();
    map['quotes'] = quotes;
    return map;
  }

}