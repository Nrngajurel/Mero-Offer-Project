

class City {
  City({
    required this.id,
    required this.name,
    this.order,
    this.slug,
    this.status,
    this.parentId,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String? order;
  String? slug;
  String? status;
  dynamic parentId;
  String? createdAt;
  String? updatedAt;
}
