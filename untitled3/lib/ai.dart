//
// class get_prod {
//   int status;
//   String msg;
//   List<Information> information;
//
//   get_prod({required this.status, required this.msg, required this.information});
//
//   get_prod.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     msg = json['msg'];
//     // print( " msg is "+msg);
//     if (json['Information'] != null) {
//       information = <Information>[];
//       json['Information'].forEach((v) {
//         information.add(new Information.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     data['msg'] = this.msg;
//     if (this.information != null) {
//       data['Information'] = this.information.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Information {
//   int id;
//   String name;
//   String shortDesc;
//   String offpercent;
//   String mrp;
//   String price;
//   String wPrice;
//   int wQty;
//   String attr;
//   String imgUrl;
//   String brand;
//   String pricearray;
//   int stock;
//
//   Information(
//       {required this.id,
//         required this.name,
//         required this.shortDesc,
//         required this.offpercent,
//         required this.mrp,
//         required this.price,
//         required this.wPrice,
//         required this.wQty,
//         required this.attr,
//         required this.imgUrl,
//         required this.brand,
//         required this.pricearray,
//         required this.stock});
//
//   Information.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     shortDesc = json['short_desc'];
//     offpercent = json['offpercent'];
//     mrp = json['mrp'];
//     price = json['price'];
//     wPrice = json['w_price'];
//     wQty = json['w_qty'];
//     attr = json['attr'];
//     imgUrl = json['img_url'];
//     brand = json['brand'];
//     pricearray = json['pricearray'];
//     stock = json['stock'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['short_desc'] = this.shortDesc;
//     data['offpercent'] = this.offpercent;
//     data['mrp'] = this.mrp;
//     data['price'] = this.price;
//     data['w_price'] = this.wPrice;
//     data['w_qty'] = this.wQty;
//     data['attr'] = this.attr;
//     data['img_url'] = this.imgUrl;
//     data['brand'] = this.brand;
//     data['pricearray'] = this.pricearray;
//     data['stock'] = this.stock;
//     return data;
//   }
// }