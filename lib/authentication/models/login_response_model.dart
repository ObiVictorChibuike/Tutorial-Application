
import 'dart:convert';

LoginResponseModel loginResponseModelFromJson(String str) => LoginResponseModel.fromJson(json.decode(str));

String loginResponseModelToJson(LoginResponseModel data) => json.encode(data.toJson());


class LoginResponseModel {
  String? firstName;
  String? lastName;
  String? email;
  String? businessName;
  String? accountType;
  String? phoneNumber;
  bool? hasBusinessProfile;
  bool? hasCompanyDocument;
  String? token;
  String? flagUrl;
  String? subscriptionPlan;
  String? userRole;
  bool? isActive;
  List<String>? addOns;
  DateTime? expiryDate;
  DateTime? tokenExpires;

  LoginResponseModel({
    this.firstName,
    this.lastName,
    this.email,
    this.businessName,
    this.accountType,
    this.phoneNumber,
    this.hasBusinessProfile,
    this.hasCompanyDocument,
    this.token,
    this.flagUrl,
    this.subscriptionPlan,
    this.userRole,
    this.isActive,
    this.addOns,
    this.expiryDate,
    this.tokenExpires,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) => LoginResponseModel(
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    businessName: json["businessName"],
    accountType: json["accountType"],
    phoneNumber: json["phoneNumber"],
    hasBusinessProfile: json["hasBusinessProfile"],
    hasCompanyDocument: json["hasCompanyDocument"],
    token: json["token"],
    flagUrl: json["flagUrl"],
    subscriptionPlan: json["subscriptionPlan"],
    userRole: json["userRole"],
    isActive: json["isActive"],
    addOns: json["addOns"] == null ? [] : List<String>.from(json["addOns"]!.map((x) => x)),
    expiryDate: json["expiryDate"] == null ? null : DateTime.parse(json["expiryDate"]),
    tokenExpires: json["tokenExpires"] == null ? null : DateTime.parse(json["tokenExpires"]),
  );

  Map<String, dynamic> toJson() => {
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "businessName": businessName,
    "accountType": accountType,
    "phoneNumber": phoneNumber,
    "hasBusinessProfile": hasBusinessProfile,
    "hasCompanyDocument": hasCompanyDocument,
    "token": token,
    "flagUrl": flagUrl,
    "subscriptionPlan": subscriptionPlan,
    "userRole": userRole,
    "isActive": isActive,
    "addOns": addOns == null ? [] : List<dynamic>.from(addOns!.map((x) => x)),
    "expiryDate": expiryDate?.toIso8601String(),
    "tokenExpires": tokenExpires?.toIso8601String(),
  };
}
