class House {
  House({
      required this.slug,
      required this.name,});

  House.fromJson(dynamic json) {
    slug = json['slug'];
    name = json['name'];
  }
   late String slug;
   late String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['slug'] = slug;
    map['name'] = name;
    return map;
  }

}