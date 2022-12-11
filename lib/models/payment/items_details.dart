import 'package:json_annotation/json_annotation.dart';
part 'items_details.g.dart';

@JsonSerializable()
class Items {
  String? id;
  String? qty;

  Items({
    this.id,
    this.qty,
  });

  factory Items.fromJson(Map<String, dynamic> json) => _$ItemsFromJson(json);

  Map<String, dynamic> toJson() => _$ItemsToJson(this);
}
