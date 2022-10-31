class ProductModel {
  // https://api-shoestore.000webhostapp.com/data.php
  List<Data>? data;

  ProductModel({this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? title;
  String? desc;
  String? price;
  String? brand;
  String? rating;
  String? sold;
  String? img1;
  String? img2;
  String? imgbrand;

  Data(
      {this.id,
      this.title,
      this.desc,
      this.price,
      this.brand,
      this.rating,
      this.sold,
      this.img1,
      this.img2,
      this.imgbrand});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    desc = json['desc'];
    price = json['price'];
    brand = json['brand'];
    rating = json['rating'];
    sold = json['sold'];
    img1 = json['img1'];
    img2 = json['img2'];
    imgbrand = json['imgbrand'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['desc'] = this.desc;
    data['price'] = this.price;
    data['brand'] = this.brand;
    data['rating'] = this.rating;
    data['sold'] = this.sold;
    data['img1'] = this.img1;
    data['img2'] = this.img2;
    data['imgbrand'] = this.imgbrand;
    return data;
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'desc': desc,
      'price': price,
      'brand': brand,
      'rating': rating,
      'sold': sold,
      'img1': img1,
      'img2': img2,
      'imgbrand': imgbrand,
    };
  }
}
