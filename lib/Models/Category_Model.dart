class Category {
  final String category;
  final String data;

  Category({this.category, this.data});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      category: json['category'],
      data: json['data'],
    );
  }
}
