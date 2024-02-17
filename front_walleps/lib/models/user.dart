class User {
  final int id; // Opcional, podría ser null
  final String name;
  final String surname;
  final String email;
  final String? image; // Opcional, podría ser null
  final bool isImageUrl;
  final int home_hours;
  final int home_duration;
  final bool is_sections;

  User({
    required this.id,
    required this.name,
    required this.surname,
    required this.email,
    this.image,
    required this.isImageUrl,
    required this.home_hours,
    required this.home_duration,
    required this.is_sections,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      surname: json['surname'],
      email: json['email'],
      image: json['image'],
      isImageUrl: json['is_image_url'],
      home_hours: json['home_hours'],
      home_duration: json['home_duration'],
      is_sections: json['is_sections'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'surname': surname,
      'email': email,
      'image': image,
      'is_image_url': isImageUrl,
      'home_hours': home_hours,
      'home_duration': home_duration,
      'is_sections': is_sections,
    };
  }
}
