// To parse this JSON data, do
//
//     final loginmmodel = loginmmodelFromJson(jsonString);

import 'dart:convert';

Loginmmodel loginmmodelFromJson(String str) => Loginmmodel.fromJson(json.decode(str));

String loginmmodelToJson(Loginmmodel data) => json.encode(data.toJson());

class Loginmmodel {
    bool? success;
    String? message;
    Data? data;
    List<dynamic>? errors;
    DateTime? timestamp;

    Loginmmodel({
        this.success,
        this.message,
        this.data,
        this.errors,
        this.timestamp,
    });

    factory Loginmmodel.fromJson(Map<String, dynamic> json) => Loginmmodel(
        success: json["success"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        errors: json["errors"] == null ? [] : List<dynamic>.from(json["errors"]!.map((x) => x)),
        timestamp: json["timestamp"] == null ? null : DateTime.parse(json["timestamp"]),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": data?.toJson(),
        "errors": errors == null ? [] : List<dynamic>.from(errors!.map((x) => x)),
        "timestamp": timestamp?.toIso8601String(),
    };
}

class Data {
    String? accessToken;
    String? refreshToken;
    int? expiresIn;
    User? user;

    Data({
        this.accessToken,
        this.refreshToken,
        this.expiresIn,
        this.user,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        accessToken: json["accessToken"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
        user: json["user"] == null ? null : User.fromJson(json["user"]),
    );

    Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "user": user?.toJson(),
    };
}

class User {
    int? userId;
    String? email;
    String? userName;
    String? role;
    String? kycStatus;

    User({
        this.userId,
        this.email,
        this.userName,
        this.role,
        this.kycStatus,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json["userID"],
        email: json["email"],
        userName: json["userName"],
        role: json["role"],
        kycStatus: json["kycStatus"],
    );

    Map<String, dynamic> toJson() => {
        "userID": userId,
        "email": email,
        "userName": userName,
        "role": role,
        "kycStatus": kycStatus,
    };
}
