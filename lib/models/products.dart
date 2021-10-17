import 'package:intl/intl.dart';

class Product {
  Product({
    this.id,
    this.sold,
    this.order,
    this.featured,
    this.views,
    this.status,
    this.bid,
    this.slug,
    this.quantity,
    this.weight,
    this.address,
    this.latitude,
    this.longitude,
    this.cell,
    this.url,
    this.name,
    this.price,
    this.rgrPrice,
    this.desc,
    this.expiredAt,
    this.conditionId,
    this.pricelabelId,
    this.assuredId,
    this.pricetypeId,
    this.dayId,
    this.adtypeId,
    this.cityId,
    this.userId,
    this.createdAt,
    this.updatedAt,
    this.image
  });

  int? id;
  String? sold;
  String? order;
  bool? featured;
  String? views;
  bool? status;
  String? bid;
  String? slug;
  String? quantity;
  String? weight;
  String? address;
  String? latitude;
  String? longitude;
  String? cell;
  String? url;
  String? name;
  String? price;
  String? rgrPrice;
  String? desc;
  DateTime? expiredAt;
  int? conditionId;
  String? pricelabelId;
  String? assuredId;
  String? pricetypeId;
  String? dayId;
  String? adtypeId;
  String? cityId;
  String? userId;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? image;

  dynamic priceFormated(){
    var f = NumberFormat("##,##,###.##", "en_US");

    return f.format(price);
  }
}
