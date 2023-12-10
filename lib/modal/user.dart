class User {
  String id;
  String firstName;
  String lastName;
  String email;
  int mobile;
  String district;
  String province;
  String currency;
  bool isVerified;
  String userType;
  bool isDeleted;
  DateTime createdAt;
  DateTime updatedAt;
  int v;
  String token;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.district,
    required this.province,
    required this.currency,
    required this.isVerified,
    required this.userType,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.token,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    email: json["email"],
    mobile: json["mobile"],
    district: json["district"],
    province: json["province"],
    currency: json["currency"],
    isVerified: json["isVerified"],
    userType: json["userType"],
    isDeleted: json["isDeleted"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    token: json["token"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "firstName": firstName,
    "lastName": lastName,
    "email": email,
    "mobile": mobile,
    "district": district,
    "province": province,
    "currency": currency,
    "isVerified": isVerified,
    "userType": userType,
    "isDeleted": isDeleted,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "__v": v,
    "token": token,
  };
}
