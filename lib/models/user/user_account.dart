import 'package:eventx/models/user/profile.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_account.g.dart';

@JsonSerializable()
class UserAccount {
  @JsonKey(name: "_id")
  String? id;
  Profile? profile;
  String? accountStatus;
  String? category;
  String? email;
  bool? isVerified;

  UserAccount({this.id, this.profile, this.accountStatus, this.category, this.email, this.isVerified});

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$UserAccountFromJson(json);

  Map<String, dynamic> toJson() => _$UserAccountToJson(this);
}
