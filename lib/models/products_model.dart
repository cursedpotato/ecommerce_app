// To parse this JSON data, do
//
//     final product = productFromJson(jsonString);

import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product data) => json.encode(data.toJson());

class Product {
    Product({
        required this.totalSize,
        required this.typeId,
        required this.offset,
        required products,
    }): _products = products;

    int totalSize;
    int typeId;
    int offset;
    late List<ProductModel> _products;
    List<ProductModel> get products=>_products;


    factory Product.fromJson(Map<String, dynamic> json) => Product(
        totalSize: json["totalSize"],
        typeId: json["typeId"],
        offset: json["offset"],
        products: List<ProductModel>.from(json["products"].map((x) => ProductModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "totalSize": totalSize,
        "typeId": typeId,
        "offset": offset,
        "products": List<dynamic>.from(_products.map((x) => x.toJson())),
    };
}

class ProductModel {
    ProductModel({
        this.id,
        this.name,
        this.description,
        this.price,
        this.stars,
        this.img,
        this.location,
        this.createdAt,
        this.updatedAt,
        this.typeId,
    });

    int? id;
    String? name;
    String? description;
    int? price;
    int? stars;
    String? img;
    String? location;
    String? createdAt;
    String? updatedAt;
    int? typeId;

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
        stars: json["stars"],
        img: json["img"],
        location: json["location"],
        createdAt: json["createdAt"],
        updatedAt: json["updatedAt"],
        typeId: json["typeId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "price": price,
        "stars": stars,
        "img": img,
        "location": location,
        "createdAt": createdAt,
        "updatedAt": updatedAt,
        "typeId": typeId,
    };
}
