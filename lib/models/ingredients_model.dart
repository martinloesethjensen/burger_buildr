class IngredientsModel {
  String name;
  String label;
  double price;
  IngredientsModel({this.name, this.label, this.price});

  factory IngredientsModel.fromJson(Map<String, dynamic> json) =>
      IngredientsModel(
          name: json['name'] as String,
          label: json['label'] as String,
          price: json['price'] as double);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['label'] = this.label;
    data['price'] = this.price;
    return data;
  }
}
