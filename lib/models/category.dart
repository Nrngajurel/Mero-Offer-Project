
class Category {
  Category({
    required this.id,
    required this.name,
    this.status,
    this.font,
    this.color,
    this.order,
    this.desc,
    this.featured,
    this.menu,
    required this.image,
    this.parentId,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String? status;
  String? font;
  String? color;
  String? order;
  dynamic desc;
  String? featured;
  String? menu;
  String image;
  dynamic parentId;
  String? slug;
  DateTime? createdAt;
  DateTime? updatedAt;
}
