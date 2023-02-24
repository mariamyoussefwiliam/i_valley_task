class AvailableCarModel {
  double? price;
  String? mainTitle;
  String? model;
  String? description;
  String? mainImagePath;
  String? brandName;

  AvailableCarModel({
    this.price,
    this.mainTitle,
    this.model,
    this.description,
    this.mainImagePath,
    this.brandName,
  });

  AvailableCarModel.fromJson(Map<String, dynamic> json) {
    price = double.parse(json['Price'].toString());
    mainTitle = json['MainTitle'];
    model = json['Model'];
    description = json['Description'];
    mainImagePath = json['MainImagePath'];
    brandName = json['BrandName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Price'] = price;
    data['MainTitle'] = mainTitle;
    data['Model'] = model;
    data['Description'] = description;
    data['MainImagePath'] = mainImagePath;
    data['BrandName'] = brandName;
    return data;
  }
}
