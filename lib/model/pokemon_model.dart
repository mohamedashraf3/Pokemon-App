class PokeModel {
  String? name;
  String? img;
   List<String>? type;
  String? height;
  String? weight;
  List<String>? weaknesses;

  PokeModel({
    this.name,
    this.img,
    this.type,
    this.height,
    this.weight,
    this.weaknesses,
  });

  PokeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    img = json['img'];
    type = json['type'].cast<String>();
    height = json['height'];
    weight = json['weight'];
    weaknesses = json['weaknesses'].cast<String>();
   }
}