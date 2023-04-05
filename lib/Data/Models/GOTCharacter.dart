/// id : 0
/// firstName : "Daenerys"
/// lastName : "Targaryen"
/// fullName : "Daenerys Targaryen"
/// title : "Mother of Dragons"
/// family : "House Targaryen"
/// image : "daenerys.jpg"
/// imageUrl : "https://thronesapi.com/assets/images/daenerys.jpg"

class GotCharacter {
  GotCharacter({
   required this.id,
   required this.firstName,
   required this.lastName,
   required this.fullName,
   required this.title,
   required this.family,
   required this.image,
   required this.imageUrl,});

  GotCharacter.fromJson(dynamic json) {
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    fullName = json['fullName'];
    title = json['title'];
    family = json['family'];
    image = json['image'];
    imageUrl = json['imageUrl'];
  }
   late num id;
   late String firstName;
   late String lastName;
   late String fullName;
   late String title;
   late String family;
   late String image;
   late String imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['fullName'] = fullName;
    map['title'] = title;
    map['family'] = family;
    map['image'] = image;
    map['imageUrl'] = imageUrl;
    return map;
  }

}