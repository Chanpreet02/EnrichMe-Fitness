class FitnessPlan {
  String title;
  String description;
  String type;
  String imageUrl;

  FitnessPlan({
    required this.title,
    required this.description,
    required this.type,
    required this.imageUrl,
  });

  factory FitnessPlan.fromJson(Map<String, dynamic> json) {
    return FitnessPlan(
      title: json['title'],
      description: json['description'],
      type: json['type'],
      imageUrl: json['imageUrl'],
    );
  }
}
