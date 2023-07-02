// ignore_for_file: public_member_api_docs, sort_constructors_first

class DataModel {
  String name;
  String img;
  int price;
  int people;
  int stars;
  String description;
  String location;
  DataModel({
    required this.name,
    required this.img,
    required this.price,
    required this.people,
    required this.stars,
    required this.description,
    required this.location,
  });

  DataModel copyWith({
    String? name,
    String? img,
    int? price,
    int? people,
    int? stars,
    String? description,
    String? location,
  }) {
    return DataModel(
      name: name ?? this.name,
      img: img ?? this.img,
      price: price ?? this.price,
      people: people ?? this.people,
      stars: stars ?? this.stars,
      description: description ?? this.description,
      location: location ?? this.location,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'img': img,
      'price': price,
      'people': people,
      'stars': stars,
      'description': description,
      'location': location,
    };
  }

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      name: json['name'],
      img: json['img'],
      price: json['price'],
      people: json['people'],
      stars: json['stars'],
      description: json['description'],
      location: json['location'],
    );
  }
}
