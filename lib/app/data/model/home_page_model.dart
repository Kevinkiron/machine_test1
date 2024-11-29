// To parse this JSON data, do
//
//     final homePageModel = homePageModelFromJson(jsonString);

import 'dart:convert';

HomePageModel homePageModelFromJson(String str) =>
    HomePageModel.fromJson(json.decode(str));

String homePageModelToJson(HomePageModel data) => json.encode(data.toJson());

class HomePageModel {
  bool? status;
  int? code;
  int? blocked;
  Data? data;
  String? message;

  HomePageModel({
    this.status,
    this.code,
    this.blocked,
    this.data,
    this.message,
  });

  factory HomePageModel.fromJson(Map<String, dynamic> json) => HomePageModel(
        status: json["status"],
        code: json["code"],
        blocked: json["blocked"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "code": code,
        "blocked": blocked,
        "data": data?.toJson(),
        "message": message,
      };
}

class Data {
  List<Banner>? banners;
  int? notificationCount;
  List<Banner>? mealCategories;

  Data({
    this.banners,
    this.notificationCount,
    this.mealCategories,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        banners: json["banners"] == null
            ? []
            : List<Banner>.from(
                json["banners"]!.map((x) => Banner.fromJson(x))),
        notificationCount: json["notification_count"],
        mealCategories: json["meal_categories"] == null
            ? []
            : List<Banner>.from(
                json["meal_categories"]!.map((x) => Banner.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "banners": banners == null
            ? []
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
        "notification_count": notificationCount,
        "meal_categories": mealCategories == null
            ? []
            : List<dynamic>.from(mealCategories!.map((x) => x.toJson())),
      };
}

class Banner {
  int? id;
  String? name;
  String? image;
  List<MealPlan>? mealPlans;

  Banner({
    this.id,
    this.name,
    this.image,
    this.mealPlans,
  });

  factory Banner.fromJson(Map<String, dynamic> json) => Banner(
        id: json["id"],
        name: json["name"],
        image: json["image"],
        mealPlans: json["meal_plans"] == null
            ? []
            : List<MealPlan>.from(
                json["meal_plans"]!.map((x) => MealPlan.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "image": image,
        "meal_plans": mealPlans == null
            ? []
            : List<dynamic>.from(mealPlans!.map((x) => x.toJson())),
      };
}

class MealPlan {
  int? id;
  String? name;
  String? mealTypes;
  String? shortDescription;

  MealPlan({
    this.id,
    this.name,
    this.mealTypes,
    this.shortDescription,
  });

  factory MealPlan.fromJson(Map<String, dynamic> json) => MealPlan(
        id: json["id"],
        name: json["name"],
        mealTypes: json["meal_types"],
        shortDescription: json["short_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "meal_types": mealTypes,
        "short_description": shortDescription,
      };
}
